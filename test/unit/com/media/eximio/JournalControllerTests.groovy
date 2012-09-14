package com.media.eximio



import org.junit.*
import grails.test.mixin.*

@TestFor(JournalController)
@Mock(Journal)
class JournalControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/journal/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.journalInstanceList.size() == 0
        assert model.journalInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.journalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.journalInstance != null
        assert view == '/journal/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/journal/show/1'
        assert controller.flash.message != null
        assert Journal.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/journal/list'

        populateValidParams(params)
        def journal = new Journal(params)

        assert journal.save() != null

        params.id = journal.id

        def model = controller.show()

        assert model.journalInstance == journal
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/journal/list'

        populateValidParams(params)
        def journal = new Journal(params)

        assert journal.save() != null

        params.id = journal.id

        def model = controller.edit()

        assert model.journalInstance == journal
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/journal/list'

        response.reset()

        populateValidParams(params)
        def journal = new Journal(params)

        assert journal.save() != null

        // test invalid parameters in update
        params.id = journal.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/journal/edit"
        assert model.journalInstance != null

        journal.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/journal/show/$journal.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        journal.clearErrors()

        populateValidParams(params)
        params.id = journal.id
        params.version = -1
        controller.update()

        assert view == "/journal/edit"
        assert model.journalInstance != null
        assert model.journalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/journal/list'

        response.reset()

        populateValidParams(params)
        def journal = new Journal(params)

        assert journal.save() != null
        assert Journal.count() == 1

        params.id = journal.id

        controller.delete()

        assert Journal.count() == 0
        assert Journal.get(journal.id) == null
        assert response.redirectedUrl == '/journal/list'
    }
}
