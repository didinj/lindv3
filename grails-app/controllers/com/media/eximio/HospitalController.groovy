package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException
import com.media.eximio.auth.*
import grails.converters.JSON

class HospitalController {
    
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        def hospital
        if(springSecurityService.getPrincipal()) {
            hospital = Hospital.findByAdminid(springSecurityService.getPrincipal().getId())
        } else {
            hospital = Hospital.get(params.id)
        }
        
        [hospitalInstance:hospital]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [hospitalInstanceList: Hospital.list(params), hospitalInstanceTotal: Hospital.count()]
    }
    
    def listdoctor(Integer max) {
        def query = {
            createAlias('hospital','h')
            eq('h.id',Long.parseLong(params.id))               
        }
        def criteria = User.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def userInstanceList = criteria.list(query,max: params.max, offset: params.offset)
        
        def hospital = Hospital.get(Long.parseLong(params.id))
        [userInstanceList: userInstanceList, userInstanceTotal: userInstanceList.size(),hospital:hospital]
    }

    def create() {
        [hospitalInstance: new Hospital(params)]
    }

    def save() {
        def hospitalInstance = new Hospital(params)
        if (!hospitalInstance.save(flush: true)) {
            render(view: "create", model: [hospitalInstance: hospitalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'hospital.label', default: 'Hospital'), hospitalInstance.id])
        redirect(action: "show", id: hospitalInstance.id)
    }

    def show(Long id) {
        def hospitalInstance = Hospital.get(id)
        def hospitalDoctor
        if (!hospitalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "list")
            return
        }
        
        def otherHospital = Hospital.list(max:5)
        
        hospitalDoctor = User.withCriteria {
            createAlias('hospital','h')
            eq('h.id',id) 
            maxResults(5)
        }

        [hospitalInstance: hospitalInstance,otherHospital:otherHospital,hospitalDoctor:hospitalDoctor]
    }
    
    def dokterlist = {
        def hospitalDoctor
        if(params.docspec.equals("null")) {
            hospitalDoctor = User.withCriteria {
                createAlias('hospital','h')
                and {
                    eq('h.id',Long.parseLong(params.id))
                }
            }
        } else {
            hospitalDoctor = User.withCriteria {
                createAlias('hospital','h')
                and {
                    eq('h.id',Long.parseLong(params.id))
                    eq('specialties',params.docspec)
                }
            }
        }
        render(template:'dokterlist', model:[hospitalDoctor:hospitalDoctor])
    }

    def edit(Long id) {
        def hospitalInstance = Hospital.get(id)
        if (!hospitalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "list")
            return
        }
        
        def role = Authority.findByAuthority("ROLE_HOSPITAL")
        def users = UserAuthority.findAllByAuthority(role).user

        [hospitalInstance: hospitalInstance, users:users]
    }

    def update(Long id, Long version) {
        def hospitalInstance = Hospital.get(id)
        if (!hospitalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "list")
            return
        }
 
        if (version != null) {
            if (hospitalInstance.version > version) {
                hospitalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'hospital.label', default: 'Hospital')] as Object[],
                          "Another user has updated this Hospital while you were editing")
                render(view: "edit", model: [hospitalInstance: hospitalInstance])
                return
            }
        }

        hospitalInstance.properties = params

        if (!hospitalInstance.save(flush: true)) {
            render(view: "edit", model: [hospitalInstance: hospitalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'hospital.label', default: 'Hospital'), hospitalInstance.id])
        
        redirect(action: "index",id:hospitalInstance.id)
    }

    def delete(Long id) {
        def hospitalInstance = Hospital.get(id)
        if (!hospitalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "list")
            return
        }

        try {
            hospitalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'hospital.label', default: 'Hospital'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def hospimage = {
        def hosp = Hospital.get(params.id)
        if (!hosp || !hosp.hospimage) {
            response.sendError(404)
            return;
        }
        response.setContentType("image/jpeg")
        response.setContentLength(hosp.hospimage.size())
        OutputStream out = response.getOutputStream();
        out.write(hosp.hospimage);
        out.close();
    }
    
    def avatar_image = {
        def avatarUser = User.get(params.id)
        if (!avatarUser || !avatarUser.avatar) {
            response.sendError(404)
            return;
        }
        response.setContentType("image/jpeg")
        response.setContentLength(avatarUser.avatar.size())
        OutputStream out = response.getOutputStream();
        out.write(avatarUser.avatar);
        out.close();
    }
    
    def hosplist = {
        def c = Hospital.createCriteria()
        def results = c.list {
            ilike("hospname", "%"+params.term+"%")
            maxResults(10)
            order("hospname", "asc")
        }
        render results.hospname as JSON
    }
}
