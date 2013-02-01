package com.domain.enums

public enum Priority {

	 VERY_LOW("Très faible"),
	 LOW("Faible"),
	 MEDIUM("Normale"),
	 HIGH("Haute"),
	 VERY_HIGH("Très haute")

	 private final String value;

	 Priority(String value){
	  this.value = value;
	 }

	 String toString() {
	  value;
	 }

	 String getKey() {
	  name();
	 }

	 static list(){
	  [VERY_LOW, LOW, MEDIUM, HIGH, VERY_HIGH]
	 }

}
