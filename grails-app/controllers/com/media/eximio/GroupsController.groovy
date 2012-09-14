package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException
import com.media.eximio.auth.User

class GroupsController {
    
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        if (springSecurityService.isLoggedIn()) {
            def userid = springSecurityService.getPrincipal().getId()
            def radv1
            def radv2
            def tadv
            def query = {
                or {
                    eq('groupowner.id',userid)
                }                
            }
            def criteria = Groups.createCriteria()
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            def groupsInstanceList = criteria.list(query,max: params.max, offset: params.offset)
            
            radv1 = Advertising.withCriteria {
                createAlias('users','u')
                and {
                    eq('u.id',userid)
                    eq('advtype','right1')
                }                
                maxResults(1)
            }
            radv2 = Advertising.withCriteria {
                createAlias('users','u')
                and {
                    eq('u.id',userid)
                    eq('advtype','right2')
                }
                maxResults(1)
            }
            [groupsInstanceList: groupsInstanceList, groupsInstanceTotal: groupsInstanceList.size(),userId:userid,radv1:radv1,radv2:radv2]
        } else {
            redirect(uri: "/")
        }  
    }

    def create() {
        def userid = springSecurityService.getPrincipal().getId()
        def radv1
        def radv2
        def tadv
        radv1 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',userid)
                eq('advtype','right1')
            }                
            maxResults(1)
        }
        radv2 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',userid)
                eq('advtype','right2')
            }
            maxResults(1)
        }
        [groupsInstance: new Groups(params), userId: userid,radv1:radv1,radv2:radv2]
    }

    def save() {
        def groupsInstance = new Groups(params)
        if (!groupsInstance.save(flush: true)) {
            render(view: "create", model: [groupsInstance: groupsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'groups.label', default: 'Groups'), groupsInstance.id])
        redirect(controller: "home", action: "index")
    }
    
    def join() {
        def group = Groups.get(params.id)
        def user = User.get(params.member)
        group.addToG(user)
        group.save(flush:true)
        
        redirect(action: "list")
    }
     
    def show(Long id) {
        def userid = springSecurityService.getPrincipal().getId()
        def groupsInstance = Groups.get(id)
        if (!groupsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groups.label', default: 'Groups'), id])
            redirect(action: "list")
            return
        }
        
        def radv1
        def radv2
        def tadv
        radv1 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',userid)
                eq('advtype','right1')
            }                
            maxResults(1)
        }
        radv2 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',userid)
                eq('advtype','right2')
            }
            maxResults(1)
        }

        [groupsInstance: groupsInstance,radv1:radv1,radv2:radv2]
    }

    def edit(Long id) {
        def userid = springSecurityService.getPrincipal().getId()
        def groupsInstance = Groups.get(id)
        if (!groupsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groups.label', default: 'Groups'), id])
            redirect(action: "list")
            return
        }
        
        def radv1
        def radv2
        def tadv
        radv1 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',userid)
                eq('advtype','right1')
            }                
            maxResults(1)
        }
        radv2 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',userid)
                eq('advtype','right2')
            }
            maxResults(1)
        }

        [groupsInstance: groupsInstance,radv1:radv1,radv2:radv2]
    }

    def update(Long id, Long version) {
        def groupsInstance = Groups.get(id)
        if (!groupsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groups.label', default: 'Groups'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (groupsInstance.version > version) {
                groupsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'groups.label', default: 'Groups')] as Object[],
                          "Another user has updated this Groups while you were editing")
                render(view: "edit", model: [groupsInstance: groupsInstance])
                return
            }
        }

        groupsInstance.properties = params

        if (!groupsInstance.save(flush: true)) {
            render(view: "edit", model: [groupsInstance: groupsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'groups.label', default: 'Groups'), groupsInstance.id])
        redirect(action: "show", id: groupsInstance.id)
    }

    def delete(Long id) {
        def groupsInstance = Groups.get(id)
        if (!groupsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groups.label', default: 'Groups'), id])
            redirect(action: "list")
            return
        }

        try {
            groupsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'groups.label', default: 'Groups'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'groups.label', default: 'Groups'), id])
            redirect(action: "show", id: id)
        }
    }
    def group_photo = {
        def gphoto = Groups.get(params.id)
        if (!gphoto || !gphoto.groupphoto) {
            response.sendError(404)
            return;
        }
        response.setContentType("image/jpeg")
        response.setContentLength(gphoto.groupphoto.size())
        OutputStream out = response.getOutputStream();
        out.write(gphoto.groupphoto);
        out.close();
    }
    
}
