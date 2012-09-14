package com.media.eximio

import grails.converters.JSON

class SpecialistController {

    def splist = {
        def c = Specialist.createCriteria()
        def results = c.list {
            ilike("description", "%"+params.term+"%")
            maxResults(10)
            order("description", "asc")
        }
        render results.description as JSON
    }
}
