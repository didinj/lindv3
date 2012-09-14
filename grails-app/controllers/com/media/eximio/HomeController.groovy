package com.media.eximio

import com.media.eximio.auth.User
import com.media.eximio.Journal
import com.media.eximio.Article
import grails.converters.JSON

class HomeController {
    def springSecurityService  

    def index =  {
        def userInstance
        def articleInstance
        def journalInstance
        def eventsInstance
        def connInstance
        def radv1
        def radv2
        def tadv
        //        def activities = new ArrayList<Activity>()
        if (!springSecurityService.isLoggedIn()) {
            userInstance = User.get(params.id)
        } else {
            def user = springSecurityService.getPrincipal() 
            def userid = user?.getId()
            userInstance = User.get(userid)
            Integer point = userInstance.points+1
            userInstance.setPoints(point)
            //            activities = activityService.getRecentActivitiesForUser( userInstance, 25 );
            articleInstance = Article.withCriteria {
                eq('user.id',userid)
                maxResults(4)
                order("createdate", "desc")
            }
            journalInstance = Journal.withCriteria {
                createAlias('user','u')
                eq('u.id',userid)
                maxResults(5)
                order("createdate", "desc")
            }
            eventsInstance = Events.withCriteria {
                createAlias('user','u')
                eq('u.id',userid)
                maxResults(3)
                order("createdate","desc")
            }
            connInstance = User.withCriteria {
                createAlias('friends','f')
                eq('f.id',userid)
                maxResults(5)
            }
            radv1 = Advertising.withCriteria {
                createAlias('users','u')
                and {
                    eq('u.id',userid)
                    eq('advtype','right1')
                }                
                maxResults(1)
            }
            radv2 = Advertising.withCriteria {
                createAlias('users','u')
                and {
                    eq('u.id',userid)
                    eq('advtype','right2')
                }
                maxResults(1)
            }
        }       
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            return
        }
        
        [userInstance: userInstance,articleInstanceList:articleInstance,journalInstanceList:journalInstance,eventsInstance:eventsInstance,connInstance:connInstance,radv1:radv1,radv2:radv2]
    }
    
    def edit(Long id) {
        def userInstance = User.get(id)
        def radv1
        def radv2
        def tadv
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
        
        radv1 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',id)
                eq('advtype','right1')
            }                
            maxResults(1)
        }
        radv2 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',id)
                eq('advtype','right2')
            }
            maxResults(1)
        }

        [userInstance: userInstance,radv1:radv1,radv2:radv2]
    }
    
    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }
        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "index")
    }
    
    def avatar_image = {
        def userid = springSecurityService.getPrincipal().getId()
        def avatarUser = User.get(userid)
        if (!avatarUser || !avatarUser.avatar) {
            response.sendError(404)
            return;
        }
        response.setContentType("image/jpeg")
        response.setContentLength(avatarUser.avatar.size())
        OutputStream out = response.getOutputStream();
        out.write(avatarUser.avatar);
        out.close();
    }
    
    def avatar_image2 = {
        def avatarUser = User.get(params.id)
        if (!avatarUser || !avatarUser.avatar) {
            response.sendError(404)
            return;
        }
        response.setContentType("image/jpeg")
        response.setContentLength(avatarUser.avatar.size())
        OutputStream out = response.getOutputStream();
        out.write(avatarUser.avatar);
        out.close();
    }
    
    def adv_image = {
        def advid = params.id
        advid=advid.replace("[","")
        advid=advid.replace("]","")
        def adv = Advertising.get(Long.parseLong(advid))
        if (!adv || !adv.advimage) {
            response.sendError(404)
            return;
        }
        response.setContentType("image/jpeg")
        response.setContentLength(adv.advimage.size())
        OutputStream out = response.getOutputStream();
        out.write(adv.advimage);
        out.close();
    }
    
    def showjournal(Long id) {
        def journalInstance = Journal.get(id)
        def radv1
        def radv2
        def tadv
        if (!journalInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'journal.label', default: 'Journal'), id])
            redirect(action: "list")
            return
        }
        
        def userid = springSecurityService.getPrincipal().getId() 
        def user = User.get(userid)
        Integer point = user.points+5
        user.setPoints(point)
        
        radv1 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',userid)
                eq('advtype','right1')
            }                
            maxResults(1)
        }
        radv2 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',userid)
                eq('advtype','right2')
            }
            maxResults(1)
        }

        [journalInstance: journalInstance,radv1:radv1,radv2:radv2]
    }
    def listjournal(Integer max) {
        if (springSecurityService.isLoggedIn()) {
            def userid = springSecurityService.getPrincipal().getId() 
            def radv1
            def radv2
            def tadv
            def query = {
                createAlias('user','u')
                eq('u.id',userid)               
            }
            def criteria = Journal.createCriteria()
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            def journalInstanceList = criteria.list(query,max: params.max, offset: params.offset)
            
            radv1 = Advertising.withCriteria {
                createAlias('users','u')
                and {
                    eq('u.id',userid)
                    eq('advtype','right1')
                }                
                maxResults(1)
            }
            radv2 = Advertising.withCriteria {
                createAlias('users','u')
                and {
                    eq('u.id',userid)
                    eq('advtype','right2')
                }
                maxResults(1)
            }
            [journalInstanceList: journalInstanceList, journalInstanceTotal: Journal.count(),radv1:radv1,radv2:radv2]
        } else {
            redirect(uri: "/")
        }        
    }
    
    def showconnection(Long id) {
        def currentUser
        def articleInstance
        def connInstance
        def radv1
        def radv2
        def tadv
        
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (springSecurityService.isLoggedIn()) {
            currentUser=User.get(springSecurityService.getPrincipal().getId())
        }
        
        articleInstance = Article.withCriteria {
            eq('user.id',id)
            maxResults(4)
            order("createdate", "desc")
        }
        
        connInstance = User.withCriteria {
            createAlias('friends','f') 
            eq('f.id',id)
            maxResults(3)
        }
        
        radv1 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',id)
                eq('advtype','right1')
            }                
            maxResults(1)
        }
        radv2 = Advertising.withCriteria {
            createAlias('users','u')
            and {
                eq('u.id',id)
                eq('advtype','right2')
            }
            maxResults(1)
        }
        [userInstance: userInstance,articleInstanceList:articleInstance,connInstance:connInstance,currentUser:currentUser,radv1:radv1,radv2:radv2]
    }
    
    def listcontact(Integer max) {
        if (springSecurityService.isLoggedIn()) {
            def userid = springSecurityService.getPrincipal().getId()
            def radv1
            def radv2
            def tadv
            def query = {
                createAlias('friends','f')
                eq('f.id',userid)               
            }
            def criteria = User.createCriteria()
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            def connInstanceList = criteria.list(query,max: params.max, offset: params.offset)
            
            radv1 = Advertising.withCriteria {
                createAlias('users','u')
                and {
                    eq('u.id',userid)
                    eq('advtype','right1')
                }                
                maxResults(1)
            }
            radv2 = Advertising.withCriteria {
                createAlias('users','u')
                and {
                    eq('u.id',userid)
                    eq('advtype','right2')
                }
                maxResults(1)
            }
            [connInstanceList: connInstanceList, connInstanceTotal: connInstanceList.size(),radv1:radv1,radv2:radv2]
        } else {
            redirect(uri: "/")
        } 
    }
    
    def radv1click() {
        def adv = Advertising.get(params.id)
        Integer clicked = adv.advclick+1
        adv.setAdvclick(clicked)
        
        render adv as JSON
    }
    
    def radv2click() {
        def adv = Advertising.get(params.id)
        Integer clicked = adv.advclick+1
        adv.setAdvclick(clicked)
        
        render adv as JSON
    }
    
    def exportjournal = {
        def id = params.id
        def name = params.name
        def age = params.age
        def randomString = params.randomString ?: "PDF creation is a blast!!!"
        def food = params.food
        def hometown = params.hometown
        return [id:id, name:name, age:age, randomString:randomString, food:food, hometown:hometown]
    }
    
    def test = {}
    
    def profile = {
        def userInstance
        def connInstance
        def radv1
        def radv2
        def tadv
        //        def activities = new ArrayList<Activity>()
        if (!springSecurityService.isLoggedIn()) {
            userInstance = User.get(params.id)
        } else {
            def user = springSecurityService.getPrincipal() 
            def userid = user?.getId()
            userInstance = User.get(userid)
            Integer point = userInstance.points+1
            userInstance.setPoints(point)
            //            activities = activityService.getRecentActivitiesForUser( userInstance, 25 );
            
            connInstance = User.withCriteria {
                createAlias('friends','f')
                eq('f.id',userid)
                maxResults(5)
            }
            radv1 = Advertising.withCriteria {
                createAlias('users','u')
                and {
                    eq('u.id',userid)
                    eq('advtype','right1')
                }                
                maxResults(1)
            }
            radv2 = Advertising.withCriteria {
                createAlias('users','u')
                and {
                    eq('u.id',userid)
                    eq('advtype','right2')
                }
                maxResults(1)
            }
        }       
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
            return
        }
        
        [userInstance: userInstance,connInstance:connInstance,radv1:radv1,radv2:radv2]
    }
}