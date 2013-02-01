package com.tickit

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class UtilisateurController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: Utilisateur.list(params), userInstanceTotal: Utilisateur.count()]
    }

    def create() {
        [userInstance: new Utilisateur(params), roleInstanceList: Role.findAll()]
    }

    def save() {
        def userInstance = new Utilisateur(params)
		
		def roleInstance = Role.get(params.authority)
		
		
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

		UserRole.create(userInstance, roleInstance)
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = Utilisateur.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
		
        [userInstance: userInstance]
	
    }

    def edit(Long id) {
        def userInstance = Utilisateur.get(id)
		def roleInstanceList = Role.findAll()
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
		
        [userInstance: userInstance, roleInstanceList: roleInstanceList]
    }

    def update(Long id, Long version) {
        def userInstance = Utilisateur.get(id)
		def roleInstance = Role.get(params.authority)
		
		def userRoleInstance = UserRole.getByUser(userInstance.id)
		
		if(userRoleInstance) {
			userRoleInstance.delete(flush: true)
		}
		
		UserRole.create(userInstance, roleInstance)
		
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = Utilisateur.get(id)
		def userRoleInstance = UserRole.getByUser(userInstance.id)
       
		 if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
			userRoleInstance.delete(flush: true)
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
}
