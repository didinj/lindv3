package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class ReplyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [replyInstanceList: Reply.list(params), replyInstanceTotal: Reply.count()]
    }

    def create() {
        [replyInstance: new Reply(params)]
    }

    def save() {
        def replyInstance = new Reply(params)
        if (!replyInstance.save(flush: true)) {
            render(view: "create", model: [replyInstance: replyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reply.label', default: 'Reply'), replyInstance.id])
        redirect(action: "show", id: replyInstance.id)
    }

    def show(Long id) {
        def replyInstance = Reply.get(id)
        if (!replyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reply.label', default: 'Reply'), id])
            redirect(action: "list")
            return
        }

        [replyInstance: replyInstance]
    }

    def edit(Long id) {
        def replyInstance = Reply.get(id)
        if (!replyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reply.label', default: 'Reply'), id])
            redirect(action: "list")
            return
        }

        [replyInstance: replyInstance]
    }

    def update(Long id, Long version) {
        def replyInstance = Reply.get(id)
        if (!replyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reply.label', default: 'Reply'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (replyInstance.version > version) {
                replyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'reply.label', default: 'Reply')] as Object[],
                          "Another user has updated this Reply while you were editing")
                render(view: "edit", model: [replyInstance: replyInstance])
                return
            }
        }

        replyInstance.properties = params

        if (!replyInstance.save(flush: true)) {
            render(view: "edit", model: [replyInstance: replyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reply.label', default: 'Reply'), replyInstance.id])
        redirect(action: "show", id: replyInstance.id)
    }

    def delete(Long id) {
        def replyInstance = Reply.get(id)
        if (!replyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reply.label', default: 'Reply'), id])
            redirect(action: "list")
            return
        }

        try {
            replyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reply.label', default: 'Reply'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reply.label', default: 'Reply'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def getreply = {  
        def results = Reply.withCriteria {
            and {
                eq("message.msgto.id", Long.parseLong(params.id))
                ne("replyuser.id",Long.parseLong(params.id)) 
                eq("replyStatus","unread")
            }
        }
        render results.id as JSON
    }
}
