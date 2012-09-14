package com.media.eximio

import com.media.eximio.auth.User

class Groups {

    static belongsTo = User
    String groupname
    String groupdesc
    User groupowner
    byte[] groupphoto
    Set g
    static hasMany = [g:User]
       
    static constraints = {
        groupname(blank:false,nullable:false)
        groupdesc(blank:true,nullable:true)
        groupowner(blank:false,nullable:false)
        groupphoto(blank:true,nullabel:true,maxSize: 131072)
    }
}
