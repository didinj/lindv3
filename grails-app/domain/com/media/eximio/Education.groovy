package com.media.eximio

import com.media.eximio.auth.User

class Education {
    
    static belongsTo = [user:User]
    String institutionname
    String institutioncity
    String institutioncountry
    String major
    String degree
    String year

    static constraints = {
        user()
        institutionname()
        institutioncity()
        institutioncountry()
        major()
        degree()
        year()
    }
    
    String toString() {
        institutionname+", "+institutioncity+", "+institutioncountry+", "+year
    }
}
