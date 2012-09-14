package com.media.eximio

import com.media.eximio.auth.User

class FriendRequest {
    User fromUser
    User toUser
    String status='request'    // request, accept, pending, reject default request
    Date createDate
    Date updateDate
    
    static constraints = {
        fromUser()
        toUser()
        status()
        createDate(blank:true,nullable:true)
        updateDate(blank:true,nullable:true)
    }
    
    def beforeInsert() {
        createDate = new Date()
    }

    def beforeUpdate() {
        updateDate = new Date()
    }
}
