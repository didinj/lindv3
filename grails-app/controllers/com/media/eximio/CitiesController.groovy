package com.media.eximio

import grails.converters.JSON

class CitiesController {

    def citylist = {
        def c = Cities.createCriteria()
        def results = c.list {
            ilike("citiname", "%"+params.term+"%")
            maxResults(10)
            order("citiname", "asc")
        }
        render results.citiname as JSON
    }
}