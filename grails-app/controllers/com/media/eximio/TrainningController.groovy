package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException

class TrainningController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [trainningInstanceList: Trainning.list(params), trainningInstanceTotal: Trainning.count()]
    }

    def create() {
        [trainningInstance: new Trainning(params)]
    }

    def save() {
        def trainningInstance = new Trainning(params)
        if (!trainningInstance.save(flush: true)) {
            render(view: "create", model: [trainningInstance: trainningInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'trainning.label', default: 'Trainning'), trainningInstance.id])
        redirect(controller: "home", action: "edit", id: trainningInstance.user.id)
    }

    def show(Long id) {
        def trainningInstance = Trainning.get(id)
        if (!trainningInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainning.label', default: 'Trainning'), id])
            redirect(action: "list")
            return
        }

        [trainningInstance: trainningInstance]
    }

    def edit(Long id) {
        def trainningInstance = Trainning.get(id)
        if (!trainningInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainning.label', default: 'Trainning'), id])
            redirect(action: "list")
            return
        }

        [trainningInstance: trainningInstance]
    }

    def update(Long id, Long version) {
        def trainningInstance = Trainning.get(id)
        if (!trainningInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainning.label', default: 'Trainning'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (trainningInstance.version > version) {
                trainningInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'trainning.label', default: 'Trainning')] as Object[],
                          "Another user has updated this Trainning while you were editing")
                render(view: "edit", model: [trainningInstance: trainningInstance])
                return
            }
        }

        trainningInstance.properties = params

        if (!trainningInstance.save(flush: true)) {
            render(view: "edit", model: [trainningInstance: trainningInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'trainning.label', default: 'Trainning'), trainningInstance.id])
        redirect(controller: "home", action: "edit", id: trainningInstance.id)
    }

    def delete(Long id) {
        def trainningInstance = Trainning.get(id)
        if (!trainningInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'trainning.label', default: 'Trainning'), id])
            redirect(action: "list")
            return
        }

        try {
            trainningInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'trainning.label', default: 'Trainning'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'trainning.label', default: 'Trainning'), id])
            redirect(action: "show", id: id)
        }
    }
}
