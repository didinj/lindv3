package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import com.media.eximio.auth.User

class FriendRequestController {

    def springSecurityService  
    
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() { 
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        if (springSecurityService.isLoggedIn()) {
            def user = springSecurityService.getPrincipal()
            def query = {
                and {
                    eq("toUser.id",user.id)
                    ne("status","accept")
                }                
            }
            def criteria = FriendRequest.createCriteria()
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            def friendRequestInstanceList = criteria.list(query,max: params.max, offset: params.offset)
        
            [friendRequestInstanceList: friendRequestInstanceList, friendRequestInstanceTotal: FriendRequest.count()]
        } else {
            redirect(uri: "/")
        }
    }

    def create() {
        [friendRequestInstance: new FriendRequest(params)]
    }

    def save() {
        def friendRequestInstance = new FriendRequest("fromUser.id":params.fromUser,"toUser.id":params.toUser).save(flush: true)
        
        log.info 'broadcasting'
        broadcaster['/atmosphere/friendrequest'].broadcast("freq|$friendRequestInstance.toUser.id")
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'friendRequest.label', default: 'FriendRequest'), friendRequestInstance.id])
        //        redirect(action: "list")
        render friendRequestInstance.toUser as JSON
    }
    
    def acceptreq(Long id) {
        def friendRequestInstance = FriendRequest.get(id)
        
        if (!friendRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'friendRequest.label', default: 'FriendRequest'), id])
            redirect(action: "list")
            return
        }
        
        friendRequestInstance.properties = params
        
        if (!friendRequestInstance.save(flush: true)) {
            render(view: "edit", model: [friendRequestInstance: friendRequestInstance])
            return
        }
        
        def user = User.get(friendRequestInstance.toUser.id)
        def friend = User.get(friendRequestInstance.fromUser.id)
        user.addToFriends(friend)
        
        flash.message = message(code: 'default.accept.message', args: [message(code: 'friendRequest.label', default: 'Connection request of '), friendRequestInstance.fromUser.fullname])
        redirect(action: "list")
    }

    def show(Long id) {
        def friendRequestInstance = FriendRequest.get(id)
        if (!friendRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'friendRequest.label', default: 'FriendRequest'), id])
            redirect(action: "list")
            return
        }

        [friendRequestInstance: friendRequestInstance]
    }

    def edit(Long id) {
        def friendRequestInstance = FriendRequest.get(id)
        if (!friendRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'friendRequest.label', default: 'FriendRequest'), id])
            redirect(action: "list")
            return
        }

        [friendRequestInstance: friendRequestInstance]
    }

    def update(Long id, Long version) {
        def friendRequestInstance = FriendRequest.get(id)
        if (!friendRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'friendRequest.label', default: 'FriendRequest'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (friendRequestInstance.version > version) {
                friendRequestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'friendRequest.label', default: 'FriendRequest')] as Object[],
                          "Another user has updated this FriendRequest while you were editing")
                render(view: "edit", model: [friendRequestInstance: friendRequestInstance])
                return
            }
        }

        friendRequestInstance.properties = params

        if (!friendRequestInstance.save(flush: true)) {
            render(view: "edit", model: [friendRequestInstance: friendRequestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'friendRequest.label', default: 'FriendRequest'), friendRequestInstance.id])
        redirect(action: "show", id: friendRequestInstance.id)
    }

    def delete(Long id) {
        def friendRequestInstance = FriendRequest.get(id)
        if (!friendRequestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'friendRequest.label', default: 'FriendRequest'), id])
            redirect(action: "list")
            return
        }

        try {
            friendRequestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'friendRequest.label', default: 'FriendRequest'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'friendRequest.label', default: 'FriendRequest'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def getrequest = {      
        def results = FriendRequest.withCriteria {
            and {
                eq("toUser.id", Long.parseLong(params.id))
                eq("status","request")
            }
        }
        render results.id as JSON
    }
}