package com.media.eximio

import com.media.eximio.auth.User

class Message {
    
    User msgfrom
    User msgto
    String msgbody
    Date msgcreated
    String messageStatus="unread" // unread or read 
    
    static hasMany = [reply:Reply]

    static constraints = {
        msgfrom()
        msgto()
        msgbody(nullable:true, maxSize: 8094)
        msgcreated()
    }
}
