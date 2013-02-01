package com.domain.enums

public enum ERole {

	HOTLINE('Project Hotline'),
	DEV('Project developer'),
	TEAMLEADER('Project leader'),
	PROJECTMANAGER('Project Manager'),
	ADMIN('Administrateur Tick-it')
	
	String name

	ERole(String name) {
		this.name = name
	}
	
}