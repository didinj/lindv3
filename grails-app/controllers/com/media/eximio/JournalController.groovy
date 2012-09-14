package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException
import com.media.eximio.auth.User
import grails.converters.JSON

class JournalController {
    
//    PdfService pdfService
    
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [journalInstanceList: Journal.list(params), journalInstanceTotal: Journal.count()]
//        if (springSecurityService.isLoggedIn()) {
//            def user = springSecurityService.getPrincipal()
//            def query = {
//                createAlias('user','u')
//                eq('u.id',user.id)               
//            }
//            def criteria = Journal.createCriteria()
//            params.max = Math.min(params.max ? params.int('max') : 10, 100)
//            def journalInstanceList = criteria.list(query,max: params.max, offset: params.offset)
//            [journalInstanceList: journalInstanceList, journalInstanceTotal: Journal.count()]
//        } else {
//            redirect(uri: "/")
//        }        
    }

    def create() {
        [journalInstance: new Journal(params)]
    }

    def save() {
        def journalInstance = new Journal(params)
        if (!journalInstance.save(flush: true)) {
            render(view: "create", model: [journalInstance: journalInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'journal.label', default: 'Journal'), journalInstance.id])
        redirect(action: "show", id: journalInstance.id)
    }

    def show(Long id) {
        def journalInstance = Journal.get(id)
        if (!journalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'journal.label', default: 'Journal'), id])
            redirect(action: "list")
            return
        }

        [journalInstance: journalInstance]
    }

    def edit(Long id) {
        def journalInstance = Journal.get(id)
        if (!journalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'journal.label', default: 'Journal'), id])
            redirect(action: "list")
            return
        }

        [journalInstance: journalInstance]
    }

    def update(Long id, Long version) {
        def journalInstance = Journal.get(id)
        if (!journalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'journal.label', default: 'Journal'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (journalInstance.version > version) {
                journalInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'journal.label', default: 'Journal')] as Object[],
                          "Another user has updated this Journal while you were editing")
                render(view: "edit", model: [journalInstance: journalInstance])
                return
            }
        }

        journalInstance.properties = params

        if (!journalInstance.save(flush: true)) {
            render(view: "edit", model: [journalInstance: journalInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'journal.label', default: 'Journal'), journalInstance.id])
        redirect(action: "journalshow", id: journalInstance.id)
    }

    def delete(Long id) {
        def journalInstance = Journal.get(id)
        if (!journalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'journal.label', default: 'Journal'), id])
            redirect(action: "list")
            return
        }

        try {
            journalInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'journal.label', default: 'Journal'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'journal.label', default: 'Journal'), id])
            redirect(action: "show", id: id)
        }
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
    
    def getjournal = {      
        def results = Journal.withCriteria {
            createAlias('user','u')
            eq('u.id',params.id)
        }
        render results.id as JSON
    }
    
    def quizresult = {
        def radv1
        def radv2
        def tadv
        def userid = springSecurityService.getPrincipal().getId() 
        def user = User.get(userid)
        int rightans
        int totalpoints
        def q1 = JournalQuiz.get(params.q1)
        if(q1.rightanswer.equalsIgnoreCase(params.ans1))
            rightans=rightans+1
        def q2 = JournalQuiz.get(params.q2)
        if(q1.rightanswer.equalsIgnoreCase(params.ans2))
            rightans=rightans+1
        def q3 = JournalQuiz.get(params.q3)
        if(q1.rightanswer.equalsIgnoreCase(params.ans3))
            rightans=rightans+1
        def q4 = JournalQuiz.get(params.q4)
        if(q1.rightanswer.equalsIgnoreCase(params.ans4))
            rightans=rightans+1
        def q5 = JournalQuiz.get(params.q5)
        if(q1.rightanswer.equalsIgnoreCase(params.ans5))
            rightans=rightans+1   
            
        totalpoints = rightans*20
//        println(rightans+" "+totalpoints)
        
        int point = user.points+totalpoints
        user.setPoints(point)        
        
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

        [totalpoints:totalpoints,rightans:rightans,radv1:radv1,radv2:radv2]
    }
    
    def journalpdf = {
        def journal = Journal.get(params.id)
        
        return [journal:journal]
    }
}
