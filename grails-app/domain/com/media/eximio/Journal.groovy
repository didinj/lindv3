package com.media.eximio

import com.media.eximio.auth.User

class Journal {
    
    static belongsTo = User
    static hasMany = [user:User, downers:JournalDownloader, quiz:JournalQuiz]
    String journalauthor
    String journalabstract
    String journaltitle
    String journalcontent
    String journalreference
    byte[] journalimage
    Date createdate
    Date updatedate

    static constraints = {
        journalauthor(nullable:false,blank:false)
        journaltitle(nullable:false,blank:false)
        journalabstract(nullable:false,blank:false)        
        journalcontent(nullable:false,blank:false)
        journalreference(nullable:false,blank:false)
        user(nullable:true)
        journalimage(blank: true, maxSize:102400, nullable: true)
        downers(nullable:true,blank:true)
    }
    
    def beforeInsert() {
        createdate = new Date()
        updatedate = new Date()
    }

    def beforeUpdate() {
        updatedate = new Date()
    }
    
    static mapping = {
        journalabstract type: 'text' 
        journaltitle type: 'text'
        journalcontent type: 'text'
        journalreference type: 'text'
    }  
    
    String toString() {
        journaltitle
    }
}
