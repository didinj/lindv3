package com.media.eximio



import org.junit.*
import grails.test.mixin.*

@TestFor(TrainningController)
@Mock(Trainning)
class TrainningControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/trainning/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.trainningInstanceList.size() == 0
        assert model.trainningInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.trainningInstance != null
    }

    void testSave() {
        controller.save()

        assert model.trainningInstance != null
        assert view == '/trainning/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/trainning/show/1'
        assert controller.flash.message != null
        assert Trainning.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/trainning/list'

        populateValidParams(params)
        def trainning = new Trainning(params)

        assert trainning.save() != null

        params.id = trainning.id

        def model = controller.show()

        assert model.trainningInstance == trainning
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/trainning/list'

        populateValidParams(params)
        def trainning = new Trainning(params)

        assert trainning.save() != null

        params.id = trainning.id

        def model = controller.edit()

        assert model.trainningInstance == trainning
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/trainning/list'

        response.reset()

        populateValidParams(params)
        def trainning = new Trainning(params)

        assert trainning.save() != null

        // test invalid parameters in update
        params.id = trainning.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/trainning/edit"
        assert model.trainningInstance != null

        trainning.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/trainning/show/$trainning.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        trainning.clearErrors()

        populateValidParams(params)
        params.id = trainning.id
        params.version = -1
        controller.update()

        assert view == "/trainning/edit"
        assert model.trainningInstance != null
        assert model.trainningInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/trainning/list'

        response.reset()

        populateValidParams(params)
        def trainning = new Trainning(params)

        assert trainning.save() != null
        assert Trainning.count() == 1

        params.id = trainning.id

        controller.delete()

        assert Trainning.count() == 0
        assert Trainning.get(trainning.id) == null
        assert response.redirectedUrl == '/trainning/list'
    }
}
