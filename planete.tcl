source Planete_map.tcl
source Planete_minimap.tcl
source Planete_info.tcl
source utils.tcl

inherit Planete_A Abstraction
method Planete_A constructor {control kernel x y radius density} {
  this inherited $control
  set this(kernel) $kernel
  set this(x) $x
  set this(y) $y
  set this(radius) $radius
  set this(density) $density
  this addPlaneteToKernel $x $y $radius $density
  
}



method Planete_A addPlaneteToKernel {x y radius density} {
 	set this(id) [$this(kernel) Add_new_planet $x $y $radius $density]
	$this(kernel) Subscribe_after_Destroy_planet $objName "after 10 {$this(control) dispose}"
}

method Planete_A set_x {x} {
	set this(x) $x
	$this(kernel) Update_planet $this(id) [dict create x $this(x) y $this(y)]
}

method Planete_A set_y {y} {
	set this(y) $y
	$this(kernel) Update_planet $this(id) [dict create x $this(x) y $this(y)]
}


method Planete_A set_position {position} {
    lassign $position x y
    $this(kernel) Update_planet $this(id) [dict create x $x y $y]
}

method Planete_A dispose {} {
	# UnSubscribe to functionnal core ?
	this inherited
}

Generate_PAC_accessors Planete Planete_A "" id

inherit Planete Control
method Planete constructor {parent kernel mapCanvas minimapCanvas infoCanvas x y radius density} {

  Planete_A ${objName}_A $objName $kernel $x $y $radius $density
  
  
	# Declaration PAC fils
	# pour un Planete, on a 1 Planete map, 1 Planete mini map, 1 Planete info
	PlaneteMap ${objName}_PM $objName $mapCanvas $x $y $radius
	PlaneteMiniMap ${objName}_PMM $objName $kernel $minimapCanvas $x $y $radius
	PlaneteInfo ${objName}_PI $objName $infoCanvas $x $y
	
	this inherited $parent ${objName}_A "" [list ${objName}_PM ${objName}_PMM ${objName}_PI]
}



method Planete set_position {position} {
    lassign $position x y
    $this(fc) Update_planet $this(id) [dict create x $x y $y]
}

method Planete set_x {x} {
	$this(abstraction) set_x $x
}

method Planete set_y {y} {
	$this(abstraction) set_y $y
}
