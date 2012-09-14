package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException
import com.media.eximio.auth.*

class OrganizationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    def springSecurityService

    def index() {
        def organization
        if(springSecurityService.getPrincipal()) {
            organization = Organization.findByOrgadminid(springSecurityService.getPrincipal().getId())
        } else {
            organization = Organization.get(params.id)
        }
       
        [organizationInstance:organization]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [organizationInstanceList: Organization.list(params), organizationInstanceTotal: Organization.count()]
    }
    
    def listdoctor(Integer max) {
        def query = {
            createAlias('organization','o')
            eq('o.id',Long.parseLong(params.id))               
        }
        def criteria = User.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def userInstanceList = criteria.list(query,max: params.max, offset: params.offset)
        
        def organization = Organization.get(Long.parseLong(params.id))
        [userInstanceList: userInstanceList, userInstanceTotal: userInstanceList.size(),organization:organization]
    }
    
    def dokterlist = {
        def orgDoctor
        if(params.docspec.equals("null")) {
            orgDoctor = User.withCriteria {
                createAlias('organization','o')
                and {
                    eq('o.id',Long.parseLong(params.id))
                }
                maxResults(6)
            }
        } else {
            orgDoctor = User.withCriteria {
                createAlias('organization','o')
                and {
                    eq('o.id',Long.parseLong(params.id))
                    eq('specialties',params.docspec)
                }
                maxResults(6)
            }
        }
        render(template:'dokterlist', model:[orgDoctor:orgDoctor])
    }

    def create() {
        [organizationInstance: new Organization(params)]
    }

    def save() {
        def organizationInstance = new Organization(params)
        if (!organizationInstance.save(flush: true)) {
            render(view: "create", model: [organizationInstance: organizationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'organization.label', default: 'Organization'), organizationInstance.id])
        redirect(action: "list")
    }

    def show(Long id) {
        def organizationInstance = Organization.get(id)
        def orgDoctor
        if (!organizationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "list")
            return
        }

        def otherOrg = Organization.list(max:5)
        
        orgDoctor = User.withCriteria {
            createAlias('organization','o')
            eq('o.id',id) 
            maxResults(5)
        }

        [organizationInstance: organizationInstance,otherOrg:otherOrg,orgDoctor:orgDoctor]
    }

    def edit(Long id) {
        def organizationInstance = Organization.get(id)
        if (!organizationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "list")
            return
        }
        
        def role = Authority.findByAuthority("ROLE_ORGANIZATION")
        def users = UserAuthority.findAllByAuthority(role).user

        [organizationInstance: organizationInstance, users:users]
    }

    def update(Long id, Long version) {
        def organizationInstance = Organization.get(id)
        if (!organizationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (organizationInstance.version > version) {
                organizationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'organization.label', default: 'Organization')] as Object[],
                          "Another user has updated this Organization while you were editing")
                render(view: "edit", model: [organizationInstance: organizationInstance])
                return
            }
        }

        organizationInstance.properties = params

        if (!organizationInstance.save(flush: true)) {
            render(view: "edit", model: [organizationInstance: organizationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'organization.label', default: 'Organization'), organizationInstance.id])
        redirect(action: "index", id:organizationInstance.id)
    }

    def delete(Long id) {
        def organizationInstance = Organization.get(id)
        if (!organizationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "list")
            return
        }

        try {
            organizationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'organization.label', default: 'Organization'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def orgimage = {
        def org = Organization.get(params.id)
        if (!org || !org.orgimage) {
            response.sendError(404)
            return;
        }
        response.setContentType("image/jpeg")
        response.setContentLength(org.orgimage.size())
        OutputStream out = response.getOutputStream();
        out.write(org.orgimage);
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
    
    def info = {
        def organization
        if(springSecurityService.getPrincipal()) {
            organization = Organization.findByOrgadminid(springSecurityService.getPrincipal().getId())
        } else {
            organization = Organization.get(params.id)
        }
       
        [organizationInstance:organization]
    }
}
