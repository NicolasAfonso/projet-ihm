#Import Class
source info.tcl
source mini_map.tcl
source map.tcl
source vaisseau.tcl
source planete.tcl

inherit Univers_A Abstraction
method Univers_A constructor {control} {
}

inherit Univers_P Presentation
method Univers_P constructor {control} {
  this inherited $control
}

inherit Univers Control
method Univers constructor {parent kernel mapFrame miniMapFrame infoFrame} {

	Univers_P ${objName}_P $objName
  	Univers_A ${objName}_A $objName
	# Declaration PAC fils
	Info ${objName}_I $objName infoFrame
	MiniMap ${objName}_MMAP $objName miniMapFrame
	Map ${objName}_MAP $objName mapFrame

	#List Vaisseaux
	Vaisseau ${objName}_V1 $objName
	#List Planete
	Planete ${objName}_P1 $objName "" "" "" "" 
	#FC mapcanevas minimapcanevas infoframe
	#Planete ${objName}_P2 $objName "" "" "" ""
	this inherited $parent ${objName}_A ${objName}_P [list ${objName}_I ${objName}_MMAP ${objName}_MAP ${objName}_P1 ${objName}_V1]
}
#Generate_PAC_accessors Control Univers_A Univers_P ${objName};
#Manque Liste de planètes