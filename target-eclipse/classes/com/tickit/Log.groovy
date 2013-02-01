package com.tickit

class Log {
	String description
	Date dateCreated
	
	static belongsTo = [user: Utilisateur]
	
	static mapping = {
		description type: 'text'
	 }
	
	static constraints = {
		description(blank:false)
		dateCreated(unique:false, nullable:false) 
	}
	
}
