#Import Class
source info.tcl
source mini_map.tcl
source map.tcl
source vaisseau.tcl
source planete.tcl

inherit Univers_A Abstraction
method Jeu_A constructor {control} {
}

inherit Univers_P Presentation
method Univers_P constructor {control} {
  this inherited $control
}

inherit Univers Control
method Univers constructor { } {
  Jeu_P ${objName}_P $objName
  Jeu_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils
	Info ${objName}_I $objName;
	 MiniMap ${objName}_MMAP $objName;
	Map ${objName}_MAP $objName;
	#List Vaisseaux
	Vaisseau ${objName}_V $objName;
	#List Planete
	Planete ${objName}_P $objName
}

#Manque GETTER ET SETTER