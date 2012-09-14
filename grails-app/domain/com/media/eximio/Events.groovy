package com.media.eximio

import com.media.eximio.auth.User

class Events {
    
    static belongsTo = User
    static hasMany = [user:User]
    
    String eventname
    Date eventdate
    String eventdesc
    String eventloc
    String eventcontact
    Date createdate
    byte[] eventimage

    static constraints = {
        eventname nullable:true, blank:true
        eventdate nullable:true, blank:true
        eventdesc nullable:true, blank:true
        eventloc nullable:true, blank:true
        eventcontact nullable:true, blank:true
        createdate nullable:true, blank:true
        eventimage blank: true, maxSize:1024000, nullable: true
    }
    
    def beforeInsert() {
        createdate = new Date()
    }
    
    static mapping = {
        eventdesc type: 'text'
    }  
    
    String toString() {
        eventname
    }
}
