package com.media.eximio



import org.junit.*
import grails.test.mixin.*

@TestFor(JournalQuizController)
@Mock(JournalQuiz)
class JournalQuizControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/journalQuiz/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.journalQuizInstanceList.size() == 0
        assert model.journalQuizInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.journalQuizInstance != null
    }

    void testSave() {
        controller.save()

        assert model.journalQuizInstance != null
        assert view == '/journalQuiz/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/journalQuiz/show/1'
        assert controller.flash.message != null
        assert JournalQuiz.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/journalQuiz/list'

        populateValidParams(params)
        def journalQuiz = new JournalQuiz(params)

        assert journalQuiz.save() != null

        params.id = journalQuiz.id

        def model = controller.show()

        assert model.journalQuizInstance == journalQuiz
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/journalQuiz/list'

        populateValidParams(params)
        def journalQuiz = new JournalQuiz(params)

        assert journalQuiz.save() != null

        params.id = journalQuiz.id

        def model = controller.edit()

        assert model.journalQuizInstance == journalQuiz
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/journalQuiz/list'

        response.reset()

        populateValidParams(params)
        def journalQuiz = new JournalQuiz(params)

        assert journalQuiz.save() != null

        // test invalid parameters in update
        params.id = journalQuiz.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/journalQuiz/edit"
        assert model.journalQuizInstance != null

        journalQuiz.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/journalQuiz/show/$journalQuiz.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        journalQuiz.clearErrors()

        populateValidParams(params)
        params.id = journalQuiz.id
        params.version = -1
        controller.update()

        assert view == "/journalQuiz/edit"
        assert model.journalQuizInstance != null
        assert model.journalQuizInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/journalQuiz/list'

        response.reset()

        populateValidParams(params)
        def journalQuiz = new JournalQuiz(params)

        assert journalQuiz.save() != null
        assert JournalQuiz.count() == 1

        params.id = journalQuiz.id

        controller.delete()

        assert JournalQuiz.count() == 0
        assert JournalQuiz.get(journalQuiz.id) == null
        assert response.redirectedUrl == '/journalQuiz/list'
    }
}
