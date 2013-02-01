package com.tickit

import org.springframework.dao.DataIntegrityViolationException

class LogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [logInstanceList: Log.list(params), logInstanceTotal: Log.count()]
    }

    def create() {
        [logInstance: new Log(params)]
    }

    def save() {
        def logInstance = new Log(params)
        if (!logInstance.save(flush: true)) {
            render(view: "create", model: [logInstance: logInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'log.label', default: 'Log'), logInstance.id])
        redirect(action: "show", id: logInstance.id)
    }

    def show(Long id) {
        def logInstance = Log.get(id)
        if (!logInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'log.label', default: 'Log'), id])
            redirect(action: "list")
            return
        }

        [logInstance: logInstance]
    }

    def edit(Long id) {
        def logInstance = Log.get(id)
        if (!logInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'log.label', default: 'Log'), id])
            redirect(action: "list")
            return
        }

        [logInstance: logInstance]
    }

    def update(Long id, Long version) {
        def logInstance = Log.get(id)
        if (!logInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'log.label', default: 'Log'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (logInstance.version > version) {
                logInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'log.label', default: 'Log')] as Object[],
                          "Another user has updated this Log while you were editing")
                render(view: "edit", model: [logInstance: logInstance])
                return
            }
        }

        logInstance.properties = params

        if (!logInstance.save(flush: true)) {
            render(view: "edit", model: [logInstance: logInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'log.label', default: 'Log'), logInstance.id])
        redirect(action: "show", id: logInstance.id)
    }

    def delete(Long id) {
        def logInstance = Log.get(id)
        if (!logInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'log.label', default: 'Log'), id])
            redirect(action: "list")
            return
        }

        try {
            logInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'log.label', default: 'Log'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'log.label', default: 'Log'), id])
            redirect(action: "show", id: id)
        }
    }
}
