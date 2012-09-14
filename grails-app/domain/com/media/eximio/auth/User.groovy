package com.media.eximio.auth

import com.media.eximio.*

class User {

    transient springSecurityService
//    static searchable = [only: ['fullname', 'specialties', 'city', 'hospital']] 
    static searchable = {
        hospital component:true
        organization component:true
        except: 'ROLE_HOSPITAL'
    }

    String username
    String password
    String fullname
    String specialties
    byte[] avatar
    String city
    String country = "Indonesia"
    Integer points = 0
    Date createdate
    Date updatedate
    boolean enabled = false
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    Set grps
      
    static hasMany = [hospital:Hospital,schedule:Schedule,grps:Groups,organization:Organization,education:Education,trainning:Trainning,journals:Journal,articles:Article,friends:User,advs:Advertising, events:Events,textbooks:Textbooks]
    
    static mappedBy  = [ friends: 'friends', grps: 'g' ]

    static constraints = {
        username blank: true, nullable:false, unique: true
        password blank: true, nullable:false, password: true
        fullname blank: true, maxLength:50, nullable: true
        specialties blank: true, maxLength:50, nullable: true
        education blank: true,nullable: true
        trainning blank: true,nullable: true
        city blank: true, maxLength:30, nullable: true
        country blank: true, nullable: true
        avatar blank: true, maxSize:102400, nullable: true
        hospital blank: true, nullable: true
        schedule blank: true, nullable: true
        organization blank: true, nullable: true
        points blank: true, nullable: true
        createdate blank: true, nullable: true
        updatedate blank: true, nullable: true
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Authority> getAuthorities() {
        UserAuthority.findAllByUser(this).collect { it.authority } as Set
    }

    def beforeInsert() {
        encodePassword()
        createdate = new Date()
        updatedate = new Date()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
        updatedate = new Date()
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
    
    String toString() {
        fullname
    }
}
