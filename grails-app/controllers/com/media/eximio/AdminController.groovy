package com.media.eximio

import com.media.eximio.auth.User
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class AdminController {

    def index() {
        def activeUserInstance = User.withCriteria {
            eq("enabled", true)
            order("createdate", "desc")
            maxResults(5)
        }
        
        def inactiveUserInstance = User.withCriteria {
            eq("enabled", false)
            order("createdate", "desc")
            maxResults(5)
        }
        
        def journalInstance = Journal.list(max: 10, sort: "createdate", order: "desc")
        
        [activeUserInstance:activeUserInstance, inactiveUserInstance:inactiveUserInstance, journalInstance:journalInstance, userCount: User.count(), journalCount:Journal.count()]
    }
    
    def activeuser(Integer max) {
        def query = {
            eq("enabled",true)  
            order("createdate", "desc")
        }
        def criteria = User.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def activeUserList = criteria.list(query,max: params.max, offset: params.offset)
        
        [activeUserList: activeUserList, activeUserTotal: User.count()]
    }
    
    def inactiveuser(Integer max) {
        def query = {
            eq("enabled",false)  
            order("createdate", "desc")
        }
        def criteria = User.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def inactiveUserList = criteria.list(query,max: params.max, offset: params.offset)
        
        [inactiveUserList: inactiveUserList, inactiveUserTotal: User.count()]
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
    
    def showactiveuser(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }
    def editactiveuser(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }
    
    def enableduser() {
        def userInstance = User.get(params.id)
        userInstance.enabled = true
        userInstance.save(flush:true)
        
        render userInstance as JSON
    }
    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "index")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }
        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "index")
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "index")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "index")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "editactiveuser", id: id)
        }
    }
    
    def showjournal(Long id) {
        def journalInstance = Journal.get(id)
        if (!journalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'journal.label', default: 'Journal'), id])
            redirect(action: "index")
            return
        }

        [journalInstance: journalInstance]
    }
    
    def editjournal(Long id) {
        def journalInstance = Journal.get(id)
        if (!journalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'journal.label', default: 'Journal'), id])
            redirect(action: "list")
            return
        }

        [journalInstance: journalInstance]
    }
    
    def journal_image = {
        def journal = Journal.get(params.id)
        if (!journal || !journal.journalimage) {
            response.sendError(404)
            return;
        }
        response.setContentType("image/jpeg")
        response.setContentLength(journal.journalimage.size())
        OutputStream out = response.getOutputStream();
        out.write(journal.journalimage);
        out.close();
    }
}