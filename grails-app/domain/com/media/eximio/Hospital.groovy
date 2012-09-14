package com.media.eximio

import com.media.eximio.auth.User

class Hospital {  
    static searchable = {
        only:'hospname'
        root false
    }
    
    static belongsTo = User
    String hospname
    String hospaddr
    String hospcity
    String hospcountry = "Indonesia"
    String hospphone
    byte[] hospimage
    String hospemail
    String hospwebsite
    String hospabout
    Long adminid
 
    static hasMany = [schedule:Schedule,user:User,hospgalleries:Hospgallery,hospspecialists:Hospspecialist]

    static constraints = {
        hospname blank: false, maxLength: 50
        hospaddr blank: false, maxLength: 255
        hospcity blank: true, maxLength: 30
        hospcountry blank: true, maxLength: 30
        schedule nullable:true
        user nullable:true
        hospimage blank:true,nullabel:true,maxSize: 131072
        hospphone maxLength: 20, blank: true, nullable:true
        hospemail email: true, blank: true, nullable:true
        hospwebsite url: true, blank: true, nullable:true
        hospabout blank: true, nullable:true
    }
    
    String toString() {
        return hospname
    }
    
    static mapping = {
        hospabout type: 'text'
    }

}