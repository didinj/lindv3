package com.media.eximio

import com.media.eximio.auth.User

class Textbooks {
    
    static belongsTo = User
    static hasMany = [user:User]
    
    String tbauthor
    String tbtitle
    String tbabstract
    String tbcontent
    String tbreference
    byte[] tbimage
    Date createdate
    Date updatedate

    static constraints = {
        tbauthor(nullable:false,blank:false)
        tbtitle(nullable:false,blank:false)
        tbabstract(nullable:false,blank:false)        
        tbcontent(nullable:false,blank:false)
        tbreference(nullable:false,blank:false)
        user(nullable:true)
        tbimage(blank: true, maxSize:102400, nullable: true)
    }
    
    def beforeInsert() {
        createdate = new Date()
        updatedate = new Date()
    }

    def beforeUpdate() {
        updatedate = new Date()
    }
    
    static mapping = {
        tbabstract type: 'text' 
        tbtitle type: 'text'
        tbcontent type: 'text'
        tbreference type: 'text'
    }  
    
    String toString() {
        tbtitle
    }
}
