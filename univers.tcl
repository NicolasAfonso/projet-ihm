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
method Univers constructor {parent kernel mapCanvas minimapCanvas infoCanvas} {
  	Univers_A ${objName}_A $objName

	# Declaration PAC fils
	Info ${objName}_I $objName $infoCanvas
	MiniMap ${objName}_MMAP $objName $minimapCanvas
	Map ${objName}_MAP $objName $mapCanvas

	#Vaisseaux parent kernel mapCanvas minimapCanvas infoframe
	Vaisseau ${objName}_V1 $objName "" "" "" ""

	#Planetes parent kernel mapCanvas minimapCanvas infoframe
	Planete ${objName}_P1 $objName "" "" "" "" 

	#Heritage
	this inherited $parent ${objName}_A "" [list ${objName}_I ${objName}_MMAP ${objName}_MAP ${objName}_P1 ${objName}_V1 ] 
}
#Generate_PAC_accessors Control Univers_A Univers_P ${objName};
#Manque Liste de planètes