package com.tickit

import com.domain.enums.Priority

class Ticket {

	String title
	String description
	Date dateCreated
	Date lastUpdated
	Date dateClosed //used to know when done
	Priority priority
	//	String idAdmin;
	//	String idUser;
	
	static hasMany = [logs:Log]
	
	static belongsTo = [user:Utilisateur]
	
	static mapping = {
		description type: 'text'
	 }
	
	static constraints = {
		title(blank:false, unique:false)
		description(blank:false)
		dateCreated(unique:false, nullable:false, display:false)
		lastUpdated(unique:false, nullable:true, display:false)
		dateClosed(unique:false, nullable:true, display:false)
		logs(display:false)
	}
	
	static List<Ticket> findAllByUser(Utilisateur user, Map namedParams){
		Ticket.findAll("from Ticket as t where t.user=? order by t.dateCreated",
			[user], namedParams)
	}
	
	@Override
	public String toString() {
		return title + "( " + dateCreated + ") "
	}
}
