package com.media.eximio

import com.media.eximio.auth.User

class Organization {
    static searchable = {
        only:'orgname'
        root false
    }
    
    static belongsTo = User
    static hasMany = [user:User]
    String orgname
    String orgaddress
    String orgphone
    String orgcity
    String orgemail
    String orgwebsite
    byte[] orgimage
    String orgcountry = "Indonesia"
    Long orgadminid 
    String orgabout

    static constraints = {
        user nullable:true,blank:true
        orgname()
        orgaddress nullable:true,blank:true
        orgphone maxLength: 20,nullable:true,blank:true
        orgcity nullable:true,blank:true
        orgcountry nullable:true,blank:true
        orgimage blank:true,nullabel:true,maxSize: 131072
        orgemail email: true, blank: true, nullable:true
        orgwebsite url: true, blank: true, nullable:true
        orgadminid blank: true, nullable:false
        orgabout blank: true, nullable:true
    }
    
    String toString() {
        orgname
    }
    
    static mapping = {
        orgabout type: 'text'
    }
}
