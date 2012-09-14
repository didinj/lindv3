package com.media.eximio

class AutocompleteService {

    def splist(params){
        def query = {
            like("description", "${params.term}%") // term is the parameter send by jQuery autocomplete
            projections { // good to select only the required columns.
                property("description")
            }
        }
        def slist = Specialist.createCriteria().list(query) // execute  to the get the list of companies
        def specialistSelectList = [] // to add each company details
        slist.each {
            def specialistMap = [:] // add to map. jQuery autocomplete expects the JSON object to be with id/label/value.
            specialistMap.put("id", it[0])
            specialistMap.put("label", it[2])
            specialistSelectList.add(specialistMap) // add to the arraylist
        }
        return specialistSelectList
    }
}
