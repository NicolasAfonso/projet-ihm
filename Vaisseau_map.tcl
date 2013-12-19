inherit VaisseauMap_P Presentation
method VaisseauMap_P constructor {control mapCanvas x y color kernel playerId vId} {
    this inherited $control
   	set this(mapCanvas) $mapCanvas
   	set this(kernel) $kernel
   	set this(vId) $vId
   	set this(color) $color
   	set dragged_object ""; set last_x ""; set last_y ""
   	set this(playerId) $playerId
   	set this(id) [$this(mapCanvas) create oval [expr {$x-10}] [expr {$y-10}] [expr {$x+10}] [expr {$y+10}] -fill $color -tags [list ]]
   	$this(mapCanvas) bind $this(id) <Button-1>  "${objName} pressShip %x %y"
   	# $this(kernel) Subscribe_after_Destroy_ship $objName ""
}

inherit VaisseauMap Control
method VaisseauMap constructor {parent mapCanvas x y color kernel playerId v} {
  VaisseauMap_P ${objName}_P $objName $mapCanvas $x $y $color $kernel $playerId $v
  set this(parent) $parent
  #Héritage
  this inherited $parent "" ${objName}_P ""

}

method VaisseauMap_P pressShip {x y} {
	set this(arrowId) [$this(mapCanvas) create line [$this(control) get_x] [$this(control) get_y] $x $y -arrow last]
	bind $this(mapCanvas) <B1-Motion> "${objName} drawPos %x %y"
	bind $this(mapCanvas) <ButtonRelease-1>  "${objName} releaseShip %x %y"
}

method VaisseauMap_P drawPos {x y} {
	$this(mapCanvas)  coords $this(arrowId) [$this(control) get_x] [$this(control) get_y] $x $y
}

method VaisseauMap_P dispose {} {
	$this(mapCanvas) delete $this(id)
	this inherited
}

method VaisseauMap_P  releaseShip {x y} {
	set diffY [expr {$y-[$this(control) get_y]}]
	set diffX [expr {$x-[$this(control) get_x]}]
	$this(control) set_x $x
	$this(control) set_y $y
	$this(control) set_angle [::tcl::mathfunc::atan2 $diffY $diffX]
	$this(control) set_velocity [::tcl::mathfunc::max 1 [::tcl::mathfunc::min 20 [::tcl::mathfunc::sqrt [expr {($diffY*$diffY + $diffX*$diffX)/100.}]]]]
	$this(mapCanvas) delete $this(arrowId)
	$this(mapCanvas) delete $this(id)
	set this(id) [$this(mapCanvas) create oval [expr {$x-10}] [expr {$y-10}] [expr {$x+10}] [expr {$y+10}] -fill $this(color) -tags [list ]]
	$this(mapCanvas) bind $this(id) <Button-1>  "${objName} pressShip %x %y"
}

method VaisseauMap get_x {} {
	return [$this(parent) get_x]
}

method VaisseauMap get_y {} {
	return [$this(parent) get_y]
}

method VaisseauMap set_angle {angle} {
	$this(parent) set_angle $angle
}

method VaisseauMap set_velocity {velocity} {
	$this(parent) set_velocity $velocity
}

method VaisseauMap set_x {x} {
	$this(parent) set_x $x
}

method VaisseauMap set_y {y} {
	$this(parent) set_y $y
}