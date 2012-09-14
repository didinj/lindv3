package com.media.eximio

import com.media.eximio.auth.User

class Advertising {
    
    byte[] advimage
    String advdesc
    Integer advclick = 0
    static hasMany = [users:User]
    static belongsTo = User
    String advtype
    Date createdate

    static constraints = {
        advimage blank: true, maxSize:512800, nullable: true
        advdesc nullable:true
        advclick nullable:true
        users nullable:true
        createdate nullable:true,blank:true
    }
    
    def beforeInsert() {
        createdate = new Date()
    }
}
