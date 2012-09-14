package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import com.media.eximio.auth.User

class MessageController {
    
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def inbox(Integer max) {
        def radv1
        def radv2
        def tadv
        def userid = springSecurityService.getPrincipal().getId()
        def query = {
            or {
                eq("msgto.id",userid)
            }      
        }
        def criteria = Message.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def messages = criteria.list(query,max: params.max, offset: params.offset)
        
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
        
        [messageInstanceList: messages, messageInstanceTotal: Message.count(),radv1:radv1,radv2:radv2]
    }
    
    def sent(Integer max) {
        def userid = springSecurityService.getPrincipal().getId()
        def radv1
        def radv2
        def tadv
        def query = {
            or {
                eq("msgfrom.id",userid)
            }      
        }
        def criteria = Message.createCriteria()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def messages = criteria.list(query,max: params.max, offset: params.offset)
        
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
        
        [messageInstanceList: messages, messageInstanceTotal: Message.count(),radv1:radv1,radv2:radv2]
    }

    def create(Long id) {
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
        [messageInstance: new Message(params),toId:id,toUser:User.get(id),fromId:userid,radv1:radv1,radv2:radv2]
    }

    def save() {
        def userid = springSecurityService.getPrincipal().getId()
        def radv1
        def radv2
        def tadv
        def messageInstance = new Message(params)
        if (!messageInstance.save(flush: true)) {
            render(view: "create", model: [messageInstance: messageInstance])
            return
        }
        
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
        
        //        log.info 'broadcasting'
        //        broadcaster['/atmosphere/friendrequest'].broadcast("message|$messageInstance.msgto.id")
        //
        //        flash.message = message(code: 'default.created.message', args: [message(code: 'message.label', default: 'Message'), messageInstance.id])
        
        render(view: "create", model: [messageInstance: messageInstance,radv1:radv1,radv2:radv2])
    }
    
    def savereply() {
        def replyInstance = new Reply(params)
        if (!replyInstance.save(flush: true)) {
            render(view: "show", model: [replyInstance: replyInstance])
            return
        }
       
        render replyInstance
    }

    def show(Long id) {
        def userid = springSecurityService.getPrincipal().getId()
        def messageInstance = Message.get(id)
        def radv1
        def radv2
        def tadv
        
        if (!messageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "list")
            return
        }
        
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

        [messageInstance: messageInstance,radv1:radv1,radv2:radv2]
    }
    
    def showsent(Long id) {
        def userid = springSecurityService.getPrincipal().getId()
        def messageInstance = Message.get(id)
        def radv1
        def radv2
        def tadv
        if (!messageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "list")
            return
        }
        
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

        [messageInstance: messageInstance,radv1:radv1,radv2:radv2]
    }

    def edit(Long id) {
        def messageInstance = Message.get(id)
        if (!messageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "list")
            return
        }

        [messageInstance: messageInstance]
    }

    def update(Long id, Long version) {
        def messageInstance = Message.get(id)
        if (!messageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (messageInstance.version > version) {
                messageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'message.label', default: 'Message')] as Object[],
                          "Another user has updated this Message while you were editing")
                render(view: "edit", model: [messageInstance: messageInstance])
                return
            }
        }

        messageInstance.properties = params

        if (!messageInstance.save(flush: true)) {
            render(view: "edit", model: [messageInstance: messageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'message.label', default: 'Message'), messageInstance.id])
        redirect(action: "show", id: messageInstance.id)
    }

    def delete(Long id) {
        def messageInstance = Message.get(id)
        if (!messageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "list")
            return
        }

        try {
            messageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'message.label', default: 'Message'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def getmessage = {  
        def results = Message.withCriteria {
            and {
                eq("msgto.id", Long.parseLong(params.id))
                eq("messageStatus","unread")
            }
        }
        def results2 = Reply.withCriteria {
            and {
                createAlias('message','m')
                //                eq("m.msgto.id", Long.parseLong(params.id))
                ne("replyuser.id",Long.parseLong(params.id)) 
                eq("replyStatus","unread")
            }
        }
        Integer total = results.size()+results2.size()
        def rslt = ["total":total]
        render rslt as JSON
    }
    
    def updmsgstatus = {
        def msgs = Message.get(params.id)
        msgs.setMessageStatus("read")
        render msgs as JSON
    }
    
    def updrepstatus = {
        def repls = Reply.withCriteria {
            and {
                eq("message.id", Long.parseLong(params.id))
                eq("replyStatus","unread")
            }
        }
        def repl = Reply.get(repls[0].id)
        repl.setReplyStatus("read")
        
        render repls as JSON
    }
}
