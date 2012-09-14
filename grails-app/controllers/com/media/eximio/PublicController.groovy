package com.media.eximio

import com.media.eximio.auth.*
import com.media.eximio.*
import com.media.eximio.auth.*
import grails.converters.JSON

class PublicController {
    
    def mailService

    def index = {   
        def articleInstanceList = Article.withCriteria {
            and {
                eq("publish", true)
            }
            maxResults(3)
            order("createdate", "desc")
        }
        
        def userInstanceList = User.withCriteria {
            and {
                eq("enabled", true)
                ne("username","lindadmin@lind.com")
            }
            maxResults(6)
            order("points","desc")
        }
        
        [userInstanceList:userInstanceList,articleInstanceList:articleInstanceList]
    }
    
    def list = {
        def user = User.list(max: 1, offset:1, sort:"fullname",order:"asc")   
        render user as JSON
    }
    
    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
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
    
    def createaccount() {
        [userInstance: new User(params)]
    }
    
    def saveaccount() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }
        
        mailService.sendMail {
            to userInstance.username
            subject userInstance.fullname+", you have register to LIND"
            html "<p>Thanks, you have register to LIND.<br /> We will send you confirmation Email for activate your account soon. </p><br /><br /><p>Regards,<br />LIND Admin</p>"
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "accountresponse")
    }
    
    def accountresponse() {
        
    }
}
