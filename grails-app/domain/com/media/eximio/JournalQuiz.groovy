package com.media.eximio

class JournalQuiz {
    
    static belongsTo = [journal:Journal]
    
    String question
    String opsa
    String opsb
    String opsc
    String opsd
    String rightanswer
    boolean answered

    static constraints = {
        question nullable:true, blank:true
        opsa nullable:true, blank:true
        opsb nullable:true, blank:true
        opsc nullable:true, blank:true
        opsd nullable:true, blank:true
        rightanswer nullable:true, blank:true
        answered nullable:true, blank:true
    }
    
    static mapping = {
        question type: 'text' 
        opsa type: 'text'
        opsb type: 'text'
        opsc type: 'text'
        opsd type: 'text'
        
    }
    
    String toString() {
        question
    }
}
