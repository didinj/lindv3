package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException

class JournalQuizController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [journalQuizInstanceList: JournalQuiz.list(params), journalQuizInstanceTotal: JournalQuiz.count()]
    }

    def create() {
        [journalQuizInstance: new JournalQuiz(params)]
    }

    def save() {
        def journalQuizInstance = new JournalQuiz(params)
        if (!journalQuizInstance.save(flush: true)) {
            render(view: "create", model: [journalQuizInstance: journalQuizInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'journalQuiz.label', default: 'JournalQuiz'), journalQuizInstance.id])
        redirect(controller: "journal", action: "edit", id: journalQuizInstance.journal.id)
    }

    def show(Long id) {
        def journalQuizInstance = JournalQuiz.get(id)
        if (!journalQuizInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'journalQuiz.label', default: 'JournalQuiz'), id])
            redirect(action: "list")
            return
        }

        [journalQuizInstance: journalQuizInstance]
    }

    def edit(Long id) {
        def journalQuizInstance = JournalQuiz.get(id)
        if (!journalQuizInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'journalQuiz.label', default: 'JournalQuiz'), id])
            redirect(action: "list")
            return
        }

        [journalQuizInstance: journalQuizInstance]
    }

    def update(Long id, Long version) {
        def journalQuizInstance = JournalQuiz.get(id)
        if (!journalQuizInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'journalQuiz.label', default: 'JournalQuiz'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (journalQuizInstance.version > version) {
                journalQuizInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'journalQuiz.label', default: 'JournalQuiz')] as Object[],
                          "Another user has updated this JournalQuiz while you were editing")
                render(view: "edit", model: [journalQuizInstance: journalQuizInstance])
                return
            }
        }

        journalQuizInstance.properties = params

        if (!journalQuizInstance.save(flush: true)) {
            render(view: "edit", model: [journalQuizInstance: journalQuizInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'journalQuiz.label', default: 'JournalQuiz'), journalQuizInstance.id])
        redirect(action: "show", id: journalQuizInstance.id)
    }

    def delete(Long id) {
        def journalQuizInstance = JournalQuiz.get(id)
        if (!journalQuizInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'journalQuiz.label', default: 'JournalQuiz'), id])
            redirect(action: "list")
            return
        }

        try {
            journalQuizInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'journalQuiz.label', default: 'JournalQuiz'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'journalQuiz.label', default: 'JournalQuiz'), id])
            redirect(action: "show", id: id)
        }
    }
}
