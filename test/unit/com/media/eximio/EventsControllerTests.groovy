package com.media.eximio



import org.junit.*
import grails.test.mixin.*

@TestFor(EventsController)
@Mock(Events)
class EventsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/events/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.eventsInstanceList.size() == 0
        assert model.eventsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.eventsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.eventsInstance != null
        assert view == '/events/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/events/show/1'
        assert controller.flash.message != null
        assert Events.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/events/list'

        populateValidParams(params)
        def events = new Events(params)

        assert events.save() != null

        params.id = events.id

        def model = controller.show()

        assert model.eventsInstance == events
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/events/list'

        populateValidParams(params)
        def events = new Events(params)

        assert events.save() != null

        params.id = events.id

        def model = controller.edit()

        assert model.eventsInstance == events
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/events/list'

        response.reset()

        populateValidParams(params)
        def events = new Events(params)

        assert events.save() != null

        // test invalid parameters in update
        params.id = events.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/events/edit"
        assert model.eventsInstance != null

        events.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/events/show/$events.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        events.clearErrors()

        populateValidParams(params)
        params.id = events.id
        params.version = -1
        controller.update()

        assert view == "/events/edit"
        assert model.eventsInstance != null
        assert model.eventsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/events/list'

        response.reset()

        populateValidParams(params)
        def events = new Events(params)

        assert events.save() != null
        assert Events.count() == 1

        params.id = events.id

        controller.delete()

        assert Events.count() == 0
        assert Events.get(events.id) == null
        assert response.redirectedUrl == '/events/list'
    }
}
