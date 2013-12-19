source Vaisseau_map.tcl
source Vaisseau_minimap.tcl
source Vaisseau_info.tcl
source utils.tcl

inherit Vaisseau_A Abstraction
method Vaisseau_A constructor {control kernel playerId name x y color} {
  this inherited $control
  set this(kernel) $kernel
  set this(playerId) [$playerId get_id] 
  set this(name) $name
  set this(color) $color
  set this(x) $x
  set this(y) $y
  set this(velocity) 10
  set this(angle) 0
  this addShipToKernel $this(playerId) $x $y

}

inherit Vaisseau Control
method Vaisseau constructor {parent kernel mapCanvas miniMapCanvas infoCanvas playerId name x y } {
    Vaisseau_A ${objName}_A $objName $kernel $playerId $name $x $y [$playerId get_color]
 
	# Declaration PAC fils
	# pour un Vaisseau, on a 1 Vaisseau map, 1 Vaisseau mini map, 1 Vaisseau info

	#VaisseauMap parent mapCanvas
	VaisseauMap ${objName}_VM $objName $mapCanvas $x $y [$playerId get_color] $kernel $playerId [${objName}_A attribute id]

	#VaisseauMiniMap parent miniMapCanvas
	VaisseauMiniMap ${objName}_VMM $objName $miniMapCanvas $x $y [$playerId get_color] $kernel $playerId [${objName}_A attribute id]

	#VaisseauInfo parent infoCanvas
	VaisseauInfo ${objName}_VI $objName $kernel $infoCanvas $mapCanvas $x $y [$playerId get_color] [${objName}_A attribute id]


	this inherited $parent ${objName}_A "" [list ${objName}_VM ${objName}_VMM ${objName}_VI]

	this set_id [this get_id]
}

#Generate_MV_PAC_accessors Vaisseau Vaisseau_A [list VaisseauMap VaisseauMiniMap VaisseauInfo] id

Generate_PAC_accessors Vaisseau Vaisseau_A "" playerId
Generate_PAC_accessors Vaisseau Vaisseau_A "" name
Generate_PAC_accessors Vaisseau Vaisseau_A "" x
Generate_PAC_accessors Vaisseau Vaisseau_A "" y
Generate_PAC_accessors Vaisseau Vaisseau_A "" id



method Vaisseau_A addShipToKernel {playerId x y} {
	set this(id) [$this(kernel) Add_new_ship $playerId $x $y 10]
	  $this(kernel) Subscribe_after_Destroy_ship $objName "
  		if {\$id == \"$this(id)\"} {
  		puts \"Ship $this(id) destroyed\";
  		$this(control) dispose
  		}"

}


method Vaisseau_A set_angle {angle} {
	set this(angle) $angle
	this updateShip
}

method Vaisseau_A set_velocity {velocity} {
	set this(velocity) $velocity
	this updateShip
}

method Vaisseau_A get_velocity {} {
	return $this(velocity)
}

method Vaisseau_A updateShip {} {
	$this(kernel) Update_ship $this(playerId) $this(id) [dict create fire_velocity $this(velocity) fire_angle $this(angle) x $this(x) y $this(y)]
}

method Vaisseau_A dispose {} {
	#UnSubscribe to functionnal core
	this inherited
}

method Vaisseau dispose {} {
	this inherited
}
method Vaisseau set_angle {angle} {
	$this(abstraction) set_angle $angle
}

method Vaisseau set_velocity {velocity} {
	$this(abstraction) set_velocity $velocity
}

method Vaisseau set_angle {angle} {
	$this(abstraction) set_angle $angle
}

method Vaisseau set_velocity {velocity} {
	$this(abstraction) set_velocity $velocity
}

method Vaisseau get_velocity {} {
	return [$this(abstraction) get_velocity]
}

method Vaisseau set_x {x} {
	$this(abstraction) set_x $x
}

method Vaisseau set_y {y} {
	$this(abstraction) set_y $y
}

