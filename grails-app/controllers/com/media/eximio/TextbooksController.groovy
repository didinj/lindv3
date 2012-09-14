package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException

class TextbooksController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [textbooksInstanceList: Textbooks.list(params), textbooksInstanceTotal: Textbooks.count()]
    }

    def create() {
        [textbooksInstance: new Textbooks(params)]
    }

    def save() {
        def textbooksInstance = new Textbooks(params)
        if (!textbooksInstance.save(flush: true)) {
            render(view: "create", model: [textbooksInstance: textbooksInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'textbooks.label', default: 'Textbooks'), textbooksInstance.id])
        redirect(action: "show", id: textbooksInstance.id)
    }

    def show(Long id) {
        def textbooksInstance = Textbooks.get(id)
        if (!textbooksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'textbooks.label', default: 'Textbooks'), id])
            redirect(action: "list")
            return
        }

        [textbooksInstance: textbooksInstance]
    }

    def edit(Long id) {
        def textbooksInstance = Textbooks.get(id)
        if (!textbooksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'textbooks.label', default: 'Textbooks'), id])
            redirect(action: "list")
            return
        }

        [textbooksInstance: textbooksInstance]
    }

    def update(Long id, Long version) {
        def textbooksInstance = Textbooks.get(id)
        if (!textbooksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'textbooks.label', default: 'Textbooks'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (textbooksInstance.version > version) {
                textbooksInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'textbooks.label', default: 'Textbooks')] as Object[],
                          "Another user has updated this Textbooks while you were editing")
                render(view: "edit", model: [textbooksInstance: textbooksInstance])
                return
            }
        }

        textbooksInstance.properties = params

        if (!textbooksInstance.save(flush: true)) {
            render(view: "edit", model: [textbooksInstance: textbooksInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'textbooks.label', default: 'Textbooks'), textbooksInstance.id])
        redirect(action: "show", id: textbooksInstance.id)
    }

    def delete(Long id) {
        def textbooksInstance = Textbooks.get(id)
        if (!textbooksInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'textbooks.label', default: 'Textbooks'), id])
            redirect(action: "list")
            return
        }

        try {
            textbooksInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'textbooks.label', default: 'Textbooks'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'textbooks.label', default: 'Textbooks'), id])
            redirect(action: "show", id: id)
        }
    }
}
