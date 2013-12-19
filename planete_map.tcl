inherit PlaneteMap_P Presentation
method PlaneteMap_P constructor {control mapCanvas x y radius} {
  	this inherited $control
	set this(mapCanvas) $mapCanvas
	set this(x) $x
	set this(y) $y
	set this(radius) $radius
	set this(id) [$this(mapCanvas) create oval [expr {$x-$radius}] [expr {$y-$radius}] [expr {$x+$radius}] [expr {$y+$radius}] -outline #000 -fill green]
	$mapCanvas bind $this(id) <Button-1> [list $objName start_drag %x %y]
}


method PlaneteMap_P start_drag {x y} {
	set this(last_x) $x
	set this(last_y) $y
	bind $this(mapCanvas) <B1-Motion>       [list $objName update_drag %x %y]
	bind $this(mapCanvas) <ButtonRelease-1> [list $objName stop_drag]
}

method PlaneteMap_P stop_drag {} {
	bind $this(mapCanvas) <B1-Motion> ""
}

method PlaneteMap_P update_drag {x y} {
	set dx [expr $x - $this(last_x)]; set this(last_x) $x
	set dy [expr $y - $this(last_y)]; set this(last_y) $y
	$this(control) set_x $x
	$this(control) set_y $y
	$this(mapCanvas) coords $this(id) [expr {$x-$this(radius)}] [expr {$y-$this(radius)}] [expr {$x+$this(radius)}] [expr {$y+$this(radius)}]
}

inherit PlaneteMap Control
method PlaneteMap constructor {parent mapCanvas x y radius} {
  PlaneteMap_P ${objName}_P $objName $mapCanvas $x $y $radius


  #Héritage
  this inherited $parent "" ${objName}_P ""

}

method PlaneteMap set_x {x} {
	$this(parent) set_x $x
}

method PlaneteMap set_y {y} {
	$this(parent) set_y $y
}

