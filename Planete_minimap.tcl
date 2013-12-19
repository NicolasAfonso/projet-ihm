inherit PlaneteMiniMap_P Presentation
method PlaneteMiniMap_P constructor {control kernel miniMapCanvas x y radius} {
	this inherited $control
	set this(miniMapCanvas) $miniMapCanvas
	set this(kernel) $kernel
	set this(id) [$this(miniMapCanvas) create oval [expr {($x-$radius)/2}] [expr {($y-$radius)/2}] [expr {($x+$radius)/2}] [expr {($y+$radius)/2}] -outline #000 -fill black]
  	$this(kernel) Subscribe_after_Update_planet $objName "$this(control) updatePositionPlanete \$this(D_planets)"
}

method PlaneteMiniMap_P updatePositionPlanete {D_planets id} {
	set x [dict get $D_planets $id x]
	set y [dict get $D_planets $id y]
	set radius [dict get $D_planets $id radius]
	$this(miniMapCanvas) coords $this(id) [expr {($x-$radius)/2}] [expr {($y-$radius)/2}] [expr {($x+$radius)/2}] [expr {($y+$radius)/2}]
}

inherit PlaneteMiniMap Control
method PlaneteMiniMap constructor {parent kernel miniMapCanvas x y radius} {
  PlaneteMiniMap_P ${objName}_P $objName $kernel $miniMapCanvas $x $y $radius
  

  #Héritage
  this inherited $parent "" ${objName}_P ""

}

method PlaneteMiniMap updatePositionPlanete {D_planets} {
	$this(presentation) updatePositionPlanete $D_planets [this get_id]
}


method PlaneteMiniMap get_id {} {
	return [$this(parent) get_id]
}