package com.media.eximio

import com.media.eximio.auth.User

class Schedule {

    static belongsTo = [hospital:Hospital,user:User]
    String day
    String starttime
    String endtime
    static constraints = {
        day()
        starttime()
        endtime()
    }
    
    def String toString() {
        return day+": "+starttime+" - "+endtime
    }
}
