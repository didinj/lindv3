package com.media.eximio

import org.compass.core.engine.SearchEngineQueryParseException
import com.media.eximio.auth.*

class SearchController {
    def springSecurityService
    
    def searchableService

    def index = {
        def currentUser = springSecurityService.currentUser
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            return [searchResult: searchableService.search(params.q, params),currentUser:currentUser,searchby:params.searchby,termcount:params.termcount,currentParams:params.q]
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }
    
    def searchresults = {
//        println(searchableService.search(params.q, params))
        def currentUser = springSecurityService.currentUser
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            render(template:'searchresults', model:[searchResult: searchableService.search(params.q, params),currentUser:currentUser,searchby:params.searchby,termcount:params.termcount])
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }         
    }
    
    /**
     * Perform a bulk index of every searchable object in the database
     */
    def indexAll = {
        Thread.start {
            searchableService.index()
        }
        render("bulk index started in a background thread")
    }

    /**
     * Perform a bulk index of every searchable object in the database
     */
    def unindexAll = {
        searchableService.unindex()
        render("unindexAll done")
    }
    
    def friendrequest = {
        def friendRequestInstance = new FriendRequest(params)
        println(params)
        if (!friendRequestInstance.save(flush: true)) {
            render(view: "index", model: [friendRequestInstance: friendRequestInstance])
            return
        }

        log.info 'broadcasting'
        broadcaster['/atmosphere/friendrequest'].broadcast("freq|$friendRequestInstance.toUser.id")

        flash.message = message(code: 'default.created.message', args: [message(code: 'friendRequest.label', default: 'FriendRequest'), friendRequestInstance.id])
        return
    }
}