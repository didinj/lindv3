package com.media.eximio



import org.junit.*
import grails.test.mixin.*

@TestFor(AdvertisingController)
@Mock(Advertising)
class AdvertisingControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/advertising/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.advertisingInstanceList.size() == 0
        assert model.advertisingInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.advertisingInstance != null
    }

    void testSave() {
        controller.save()

        assert model.advertisingInstance != null
        assert view == '/advertising/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/advertising/show/1'
        assert controller.flash.message != null
        assert Advertising.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/advertising/list'

        populateValidParams(params)
        def advertising = new Advertising(params)

        assert advertising.save() != null

        params.id = advertising.id

        def model = controller.show()

        assert model.advertisingInstance == advertising
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/advertising/list'

        populateValidParams(params)
        def advertising = new Advertising(params)

        assert advertising.save() != null

        params.id = advertising.id

        def model = controller.edit()

        assert model.advertisingInstance == advertising
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/advertising/list'

        response.reset()

        populateValidParams(params)
        def advertising = new Advertising(params)

        assert advertising.save() != null

        // test invalid parameters in update
        params.id = advertising.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/advertising/edit"
        assert model.advertisingInstance != null

        advertising.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/advertising/show/$advertising.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        advertising.clearErrors()

        populateValidParams(params)
        params.id = advertising.id
        params.version = -1
        controller.update()

        assert view == "/advertising/edit"
        assert model.advertisingInstance != null
        assert model.advertisingInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/advertising/list'

        response.reset()

        populateValidParams(params)
        def advertising = new Advertising(params)

        assert advertising.save() != null
        assert Advertising.count() == 1

        params.id = advertising.id

        controller.delete()

        assert Advertising.count() == 0
        assert Advertising.get(advertising.id) == null
        assert response.redirectedUrl == '/advertising/list'
    }
}
