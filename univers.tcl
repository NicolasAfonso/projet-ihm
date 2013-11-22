#Import Class
source info.tcl
source mini_map.tcl
source map.tcl
source vaisseau.tcl
source planete.tcl

inherit Univers_A Abstraction
method Univers_A constructor {control} {
}

inherit Univers Control
method Univers constructor {parent kernel mapCanevas minimapCanevas infoCanevas} {
  	Univers_A ${objName}_A $objName

	# Declaration PAC fils
	Info ${objName}_I $objName infoCanevas
	MiniMap ${objName}_MMAP $objName minimapCanevas
	Map ${objName}_MAP $objName mapCanevas

	#Vaisseaux
	Vaisseau ${objName}_V1 $objName

	#Planetes
	Planete ${objName}_P1 $objName "" "" "" "" 

	#FC mapcanevas minimapcanevas infoframe

	#Heritage
	this inherited $parent ${objName}_A "" [list ${objName}_I ${objName}_MMAP ${objName}_MAP ${objName}_P1 ${objName}_V1 ] 
}
#Generate_PAC_accessors Control Univers_A Univers_P ${objName};
#Manque Liste de planètes