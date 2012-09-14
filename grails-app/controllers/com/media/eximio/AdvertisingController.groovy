package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException

class AdvertisingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [advertisingInstanceList: Advertising.list(params), advertisingInstanceTotal: Advertising.count()]
    }

    def create() {
        [advertisingInstance: new Advertising(params)]
    }

    def save() {
        def advertisingInstance = new Advertising(params)
        if (!advertisingInstance.save(flush: true)) {
            render(view: "create", model: [advertisingInstance: advertisingInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'advertising.label', default: 'Advertising'), advertisingInstance.id])
        redirect(action: "show", id: advertisingInstance.id)
    }

    def show(Long id) {
        def advertisingInstance = Advertising.get(id)
        if (!advertisingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'advertising.label', default: 'Advertising'), id])
            redirect(action: "list")
            return
        }

        [advertisingInstance: advertisingInstance]
    }

    def edit(Long id) {
        def advertisingInstance = Advertising.get(id)
        if (!advertisingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'advertising.label', default: 'Advertising'), id])
            redirect(action: "list")
            return
        }

        [advertisingInstance: advertisingInstance]
    }

    def update(Long id, Long version) {
        def advertisingInstance = Advertising.get(id)
        if (!advertisingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'advertising.label', default: 'Advertising'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (advertisingInstance.version > version) {
                advertisingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'advertising.label', default: 'Advertising')] as Object[],
                          "Another user has updated this Advertising while you were editing")
                render(view: "edit", model: [advertisingInstance: advertisingInstance])
                return
            }
        }

        advertisingInstance.properties = params

        if (!advertisingInstance.save(flush: true)) {
            render(view: "edit", model: [advertisingInstance: advertisingInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'advertising.label', default: 'Advertising'), advertisingInstance.id])
        redirect(action: "show", id: advertisingInstance.id)
    }

    def delete(Long id) {
        def advertisingInstance = Advertising.get(id)
        if (!advertisingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'advertising.label', default: 'Advertising'), id])
            redirect(action: "list")
            return
        }

        try {
            advertisingInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'advertising.label', default: 'Advertising'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'advertising.label', default: 'Advertising'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def adv_image = {
        def adv = Advertising.get(params.id)
        if (!adv || !adv.advimage) {
            response.sendError(404)
            return;
        }
        response.setContentType("image/jpeg")
        response.setContentLength(adv.advimage.size())
        OutputStream out = response.getOutputStream();
        out.write(adv.advimage);
        out.close();
    }
}
