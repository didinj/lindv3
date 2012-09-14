package com.media.eximio



import org.junit.*
import grails.test.mixin.*

@TestFor(TextbooksController)
@Mock(Textbooks)
class TextbooksControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/textbooks/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.textbooksInstanceList.size() == 0
        assert model.textbooksInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.textbooksInstance != null
    }

    void testSave() {
        controller.save()

        assert model.textbooksInstance != null
        assert view == '/textbooks/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/textbooks/show/1'
        assert controller.flash.message != null
        assert Textbooks.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/textbooks/list'

        populateValidParams(params)
        def textbooks = new Textbooks(params)

        assert textbooks.save() != null

        params.id = textbooks.id

        def model = controller.show()

        assert model.textbooksInstance == textbooks
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/textbooks/list'

        populateValidParams(params)
        def textbooks = new Textbooks(params)

        assert textbooks.save() != null

        params.id = textbooks.id

        def model = controller.edit()

        assert model.textbooksInstance == textbooks
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/textbooks/list'

        response.reset()

        populateValidParams(params)
        def textbooks = new Textbooks(params)

        assert textbooks.save() != null

        // test invalid parameters in update
        params.id = textbooks.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/textbooks/edit"
        assert model.textbooksInstance != null

        textbooks.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/textbooks/show/$textbooks.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        textbooks.clearErrors()

        populateValidParams(params)
        params.id = textbooks.id
        params.version = -1
        controller.update()

        assert view == "/textbooks/edit"
        assert model.textbooksInstance != null
        assert model.textbooksInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/textbooks/list'

        response.reset()

        populateValidParams(params)
        def textbooks = new Textbooks(params)

        assert textbooks.save() != null
        assert Textbooks.count() == 1

        params.id = textbooks.id

        controller.delete()

        assert Textbooks.count() == 0
        assert Textbooks.get(textbooks.id) == null
        assert response.redirectedUrl == '/textbooks/list'
    }
}
