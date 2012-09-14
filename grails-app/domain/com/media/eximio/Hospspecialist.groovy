package com.media.eximio

class Hospspecialist {
    
    String specialistname

    static constraints = {
        specialistname blank:true, nullable:true
    }
    
    String toString() {
        specialistname
    }
}
