package com.media.eximio

import com.media.eximio.auth.User

class Trainning {
    static belongsTo = [user:User]
    String institution
    String certification
    String city
    String country
    String year

    static constraints = {
        user()
        institution()
        certification()
        city()
        country()
        year()
    }
    
    String toString() {
        institution+", "+city+", "+country+", "+year
    }
}
