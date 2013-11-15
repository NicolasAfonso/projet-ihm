
inherit Joueur_A Abstraction
method Joueur_A constructor {control} {
  this inherited $control
}

inherit Joueur_P Presentation
method Joueur_P constructor {control} {
  
}

inherit Joueur Control
method Joueur constructor { } {
  Joueur_P ${objName}_P $objName
  Joueur_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils

}

#Manque GETTER ET SETTER
Generate_PAC_accessors Control Joueur_A Joueur_P ${objName};