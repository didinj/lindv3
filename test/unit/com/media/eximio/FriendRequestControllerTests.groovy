package com.media.eximio



import org.junit.*
import grails.test.mixin.*

@TestFor(FriendRequestController)
@Mock(FriendRequest)
class FriendRequestControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/friendRequest/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.friendRequestInstanceList.size() == 0
        assert model.friendRequestInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.friendRequestInstance != null
    }

    void testSave() {
        controller.save()

        assert model.friendRequestInstance != null
        assert view == '/friendRequest/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/friendRequest/show/1'
        assert controller.flash.message != null
        assert FriendRequest.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/friendRequest/list'

        populateValidParams(params)
        def friendRequest = new FriendRequest(params)

        assert friendRequest.save() != null

        params.id = friendRequest.id

        def model = controller.show()

        assert model.friendRequestInstance == friendRequest
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/friendRequest/list'

        populateValidParams(params)
        def friendRequest = new FriendRequest(params)

        assert friendRequest.save() != null

        params.id = friendRequest.id

        def model = controller.edit()

        assert model.friendRequestInstance == friendRequest
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/friendRequest/list'

        response.reset()

        populateValidParams(params)
        def friendRequest = new FriendRequest(params)

        assert friendRequest.save() != null

        // test invalid parameters in update
        params.id = friendRequest.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/friendRequest/edit"
        assert model.friendRequestInstance != null

        friendRequest.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/friendRequest/show/$friendRequest.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        friendRequest.clearErrors()

        populateValidParams(params)
        params.id = friendRequest.id
        params.version = -1
        controller.update()

        assert view == "/friendRequest/edit"
        assert model.friendRequestInstance != null
        assert model.friendRequestInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/friendRequest/list'

        response.reset()

        populateValidParams(params)
        def friendRequest = new FriendRequest(params)

        assert friendRequest.save() != null
        assert FriendRequest.count() == 1

        params.id = friendRequest.id

        controller.delete()

        assert FriendRequest.count() == 0
        assert FriendRequest.get(friendRequest.id) == null
        assert response.redirectedUrl == '/friendRequest/list'
    }
}
