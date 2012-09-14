package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException

class EventsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [eventsInstanceList: Events.list(params), eventsInstanceTotal: Events.count()]
    }

    def create() {
        [eventsInstance: new Events(params)]
    }

    def save() {
        def eventsInstance = new Events(params)
        if (!eventsInstance.save(flush: true)) {
            render(view: "create", model: [eventsInstance: eventsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'events.label', default: 'Events'), eventsInstance.id])
        redirect(action: "show", id: eventsInstance.id)
    }

    def show(Long id) {
        def eventsInstance = Events.get(id)
        if (!eventsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'events.label', default: 'Events'), id])
            redirect(action: "list")
            return
        }

        [eventsInstance: eventsInstance]
    }

    def edit(Long id) {
        def eventsInstance = Events.get(id)
        if (!eventsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'events.label', default: 'Events'), id])
            redirect(action: "list")
            return
        }

        [eventsInstance: eventsInstance]
    }

    def update(Long id, Long version) {
        def eventsInstance = Events.get(id)
        if (!eventsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'events.label', default: 'Events'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (eventsInstance.version > version) {
                eventsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'events.label', default: 'Events')] as Object[],
                          "Another user has updated this Events while you were editing")
                render(view: "edit", model: [eventsInstance: eventsInstance])
                return
            }
        }

        eventsInstance.properties = params

        if (!eventsInstance.save(flush: true)) {
            render(view: "edit", model: [eventsInstance: eventsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'events.label', default: 'Events'), eventsInstance.id])
        redirect(action: "show", id: eventsInstance.id)
    }

    def delete(Long id) {
        def eventsInstance = Events.get(id)
        if (!eventsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'events.label', default: 'Events'), id])
            redirect(action: "list")
            return
        }

        try {
            eventsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'events.label', default: 'Events'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'events.label', default: 'Events'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def eventimage = {
        def event = Events.get(params.id)
        if (!event || !event.eventimage) {
            response.sendError(404)
            return;
        }
        response.setContentType("image/jpeg")
        response.setContentLength(event.eventimage.size())
        OutputStream out = response.getOutputStream();
        out.write(event.eventimage);
        out.close();
    }
}
