inherit VaisseauMiniMap_P Presentation
method VaisseauMiniMap_P constructor {control miniMapCanvas x y color kernel} {
	this inherited $control
  	set this(miniMapCanvas) $miniMapCanvas
  	set this(kernel) $kernel
	set this(id) [$this(miniMapCanvas) create oval [expr {$x/2-5}] [expr {$y/2-5}] [expr {$x/2+5}] [expr {$y/2+5}] -outline #000 -fill $color]
	# $this(kernel) Subscribe_after_Destroy_ship ${objName} "puts {Destroy ship \$this(id)};$this(control) dispose"
	# $this(kernel) Subscribe_after_Update_ship {
	# set x [dict get $this(D_players) $id_player D_ships $id x]
	# set y [dict get $this(D_players) $id_player D_ships $id y]
	# set radius [dict get $this(D_players) $id_player D_ships $id radius]
	# }
}


# method VaisseauMiniMap_P updatePositionShip {} {
# 	# $this(miniMapCanvas) delete $this(id)
# 	# set this(id) [$this(miniMapCanvas) create oval [expr {$x/2-5}] [expr {$y/2-5}] [expr {$x/2+5}] [expr {$y/2+5}] -outline #000 -fill $color]
# }


# method VaisseauMiniMap_P delete {} {
# 	$this(miniMapCanvas) delete $this(id)
# }

inherit VaisseauMiniMap Control
method VaisseauMiniMap constructor {parent miniMapCanvas x y color kernel} {
  VaisseauMiniMap_P ${objName}_P $objName $miniMapCanvas $x $y $color $kernel


  #Héritage
  this inherited $parent "" ${objName}_P ""
}


# method VaisseauMiniMap updatePositionShip {x y} {
# 	$this(Presentation) updatePositionShip $x $y
# }

method VaisseauMiniMap_P dispose {} {
	$this(miniMapCanvas) delete $this(id)
	# this inherited
}



