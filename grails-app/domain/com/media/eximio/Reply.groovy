package com.media.eximio

import com.media.eximio.auth.User

class Reply {
    
    static belongsTo = [message:Message]
    String replybody
    Date replydate
    User replyuser
    String replyStatus="unread"

    static constraints = {
        replybody(nullable:true, maxSize: 8094)
        replydate()
        replyuser()
    }
    
    static mapping = {
        sort id:'asc'
    }
}
