package com.tickit



import org.junit.*
import grails.test.mixin.*

@TestFor(LogController)
@Mock(Log)
class LogControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/log/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.logInstanceList.size() == 0
        assert model.logInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.logInstance != null
    }

    void testSave() {
        controller.save()

        assert model.logInstance != null
        assert view == '/log/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/log/show/1'
        assert controller.flash.message != null
        assert Log.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/log/list'

        populateValidParams(params)
        def log = new Log(params)

        assert log.save() != null

        params.id = log.id

        def model = controller.show()

        assert model.logInstance == log
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/log/list'

        populateValidParams(params)
        def log = new Log(params)

        assert log.save() != null

        params.id = log.id

        def model = controller.edit()

        assert model.logInstance == log
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/log/list'

        response.reset()

        populateValidParams(params)
        def log = new Log(params)

        assert log.save() != null

        // test invalid parameters in update
        params.id = log.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/log/edit"
        assert model.logInstance != null

        log.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/log/show/$log.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        log.clearErrors()

        populateValidParams(params)
        params.id = log.id
        params.version = -1
        controller.update()

        assert view == "/log/edit"
        assert model.logInstance != null
        assert model.logInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/log/list'

        response.reset()

        populateValidParams(params)
        def log = new Log(params)

        assert log.save() != null
        assert Log.count() == 1

        params.id = log.id

        controller.delete()

        assert Log.count() == 0
        assert Log.get(log.id) == null
        assert response.redirectedUrl == '/log/list'
    }
}
