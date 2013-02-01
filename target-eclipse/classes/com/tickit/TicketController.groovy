package com.tickit

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class TicketController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ticketInstanceList: Ticket.list(params), ticketInstanceTotal: Ticket.count()]
    }
	
	def listByUser(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		
		def ticketInstanceList = Ticket.findAllByUser(springSecurityService.currentUser, params)
		
		[ticketInstanceList: ticketInstanceList, ticketInstanceTotal: Ticket.countByUser(springSecurityService.currentUser, params)]
	}

    def create() {
        [ticketInstance: new Ticket(params)]
    }

    def save() {
        def ticketInstance = new Ticket(params)
		
		setLog(params, ticketInstance)
		assignUser(ticketInstance)
		
		ticketInstance.setDateCreated(new Date())
        if (!ticketInstance.save(flush: true)) {
            render(view: "create", model: [ticketInstance: ticketInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])
        redirect(action: "show", id: ticketInstance.id)
    }

    def show(Long id) {
        def ticketInstance = Ticket.get(id)
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "list")
            return
        }

        [ticketInstance: ticketInstance]
    }

    def edit(Long id) {
        def ticketInstance = Ticket.get(id)
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "list")
            return
        }

        [ticketInstance: ticketInstance]
    }

    def update(Long id, Long version) {
        def ticketInstance = Ticket.get(id)

		setLog(params, ticketInstance)
		
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ticketInstance.version > version) {
                ticketInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ticket.label', default: 'Ticket')] as Object[],
                          "Another user has updated this Ticket while you were editing")
                render(view: "edit", model: [ticketInstance: ticketInstance])
                return
            }
        }

        ticketInstance.properties = params

        if (!ticketInstance.save(flush: true)) {
            render(view: "edit", model: [ticketInstance: ticketInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])
        redirect(action: "show", id: ticketInstance.id)
    }


    def delete(Long id) {
        def ticketInstance = Ticket.get(id)
        if (!ticketInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "list")
            return
        }

        try {
            ticketInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ticket.label', default: 'Ticket'), id])
            redirect(action: "show", id: id)
        }
    }
	
	private setLog(Map params, Ticket ticketInstance) {
		def log
		
		if(params.intervention != null && !params.intervention.trim().isEmpty()){
			log = new Log()
			log.setDateCreated(new Date())
			log.setDescription(params.intervention)
			log.setUser(springSecurityService.currentUser)

			ticketInstance.addToLogs(log)
		}
	}
	
	private assignUser(Ticket ticketInstance) {
		def user = springSecurityService.currentUser
		ticketInstance.setUser(user)
	}
}
