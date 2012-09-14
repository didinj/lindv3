package com.media.eximio

import com.media.eximio.auth.User

class Article {
    
    static belongsTo = [user:User]
    String articleabstract
    String articletitle
    String articlecontent
    String articlereference
    byte[] articleimage
    Date createdate
    Date updatedate
    boolean publish

    static constraints = {
        user(nullable:false,blank:false)
        articleabstract(nullable:false,blank:false)
        articletitle(nullable:false,blank:false)
        articlecontent(nullable:false,blank:false)
        articlereference(nullable:false,blank:false)
        articleimage(blank: true, maxSize:102400, nullable: true)
        createdate(blank:true,nullable:true)
        updatedate(blank:true,nullable:true)
        publish()
    }
    
    def beforeInsert() {
        createdate = new Date()
        updatedate = new Date()
    }

    def beforeUpdate() {
        updatedate = new Date()
    }
    static mapping = {
        articleabstract type: 'text' 
        articlecontent type: 'text'
        articletitle type: 'text'
        articlereference type: 'text'
    }    
    
    String toString() {
        articletitle
    }
}
