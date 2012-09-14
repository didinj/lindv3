package com.media.eximio

import org.springframework.dao.DataIntegrityViolationException
import com.media.eximio.auth.User

class ArticleController {
    
    def springSecurityService  

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        if (springSecurityService.isLoggedIn()) {
            def userid = springSecurityService.getPrincipal().getId()
            def radv1
            def radv2
            def tadv
            def query = {
                and {
                    eq("user.id",userid)
                }                
            }
            def criteria = Article.createCriteria()
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            def articleInstanceList = criteria.list(query,max: params.max, offset: params.offset)
            
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
            [articleInstanceList: articleInstanceList, articleInstanceTotal: Article.count(),radv1:radv1,radv2:radv2]
        } else {
            redirect(uri: "/")
        }        
    }

    def create() {
        def userid = springSecurityService.getPrincipal().getId()
        def radv1
        def radv2
        def tadv
        def userInstance= User.get(userid)
        
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
        [articleInstance: new Article(params),userInstance:userInstance,radv1:radv1,radv2:radv2]
    }

    def save() {
        def articleInstance = new Article('user.id':params.user.id,articletitle:params.articletitle,articleabstract:params.articleabstract,articlecontent:params.articlecontent,articlereference:params.articlereference,articleimage:params.articleimage,publish:params.publish as boolean)
        if (!articleInstance.save(flush: true)) {
            render(view: "create", model: [articleInstance: articleInstance])
            return
        }
        
        def userid = springSecurityService.getPrincipal().getId() 
        def user = User.get(userid)
        Integer point = user.points+10
        user.setPoints(point)

        flash.message = message(code: 'default.created.message', args: [message(code: 'article.label', default: 'Article'), articleInstance.articletitle])
        redirect(action: "show", id: articleInstance.id)
    }

    def show(Long id) {
        def userid = springSecurityService.getPrincipal().getId()
        def radv1
        def radv2
        def tadv
        def articleInstance = Article.get(id)
        if (!articleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'article.label', default: 'Article'), id])
            redirect(action: "list")
            return
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

        [articleInstance: articleInstance,radv1:radv1,radv2:radv2]
    }

    def edit(Long id) {
        def userid = springSecurityService.getPrincipal().getId()
        def radv1
        def radv2
        def tadv
        def userInstance= User.get(userid)
        def articleInstance = Article.get(id)
        if (!articleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'article.label', default: 'Article'), id])
            redirect(action: "list")
            return
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

        [articleInstance: articleInstance,userInstance:userInstance,radv1:radv1,radv2:radv2]
    }

    def update(Long id, Long version) {
        def articleInstance = Article.get(id)
        if (!articleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'article.label', default: 'Article'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (articleInstance.version > version) {
                articleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'article.label', default: 'Article')] as Object[],
                          "Another user has updated this Article while you were editing")
                render(view: "edit", model: [articleInstance: articleInstance])
                return
            }
        }

        articleInstance.properties = params
        println(params)
        if (!articleInstance.save(flush: true)) {
            render(view: "edit", model: [articleInstance: articleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'article.label', default: 'Article'), articleInstance.id])
        redirect(action: "show", id: articleInstance.id)
    }

    def delete(Long id) {
        def articleInstance = Article.get(id)
        if (!articleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'article.label', default: 'Article'), id])
            redirect(action: "list")
            return
        }

        try {
            articleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'article.label', default: 'Article'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'article.label', default: 'Article'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def article_image = {
        def article = Article.get(params.id)
        if (!article || !article.articleimage) {
            response.sendError(404)
            return;
        }
        response.setContentType("image/jpeg")
        response.setContentLength(article.articleimage.size())
        OutputStream out = response.getOutputStream();
        out.write(article.articleimage);
        out.close();
    }
}
