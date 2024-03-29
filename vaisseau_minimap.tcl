inherit VaisseauMiniMap_P Presentation
method VaisseauMiniMap_P constructor {control miniMapCanvas x y color kernel playerId vId } {
	this inherited $control
  	set this(miniMapCanvas) $miniMapCanvas
   	set this(kernel) $kernel
   	set this(vId) $vId
   	set this(color) $color
   	set this(playerId) $playerId
	set this(id) [$this(miniMapCanvas) create oval [expr {$x/2-5}] [expr {$y/2-5}] [expr {$x/2+5}] [expr {$y/2+5}] -outline #000 -fill $color]
	$this(kernel) Subscribe_after_Update_ship $objName "$this(control) updatePositionShip \$this(D_players)"

	}



method VaisseauMiniMap_P updatePositionShip {D_players playerId vId} {
	set x [dict get $D_players $playerId D_ships $vId  x]
	set y [dict get $D_players $playerId  D_ships $vId   y]
	puts "VaisseauMiniMap_P updatePositionShip $x $y"
	$this(miniMapCanvas) coords $this(id) [expr {$x/2-5}] [expr {$y/2-5}] [expr {$x/2+5}] [expr {$y/2+5}] 
}


inherit VaisseauMiniMap Control
method VaisseauMiniMap constructor {parent miniMapCanvas x y color kernel playerId vId} {
  VaisseauMiniMap_P ${objName}_P $objName $miniMapCanvas $x $y $color $kernel playerId vId
  #Héritage
  this inherited $parent "" ${objName}_P ""
}


method VaisseauMiniMap updatePositionShip {D_players} {
	$this(presentation) updatePositionShip $D_players [this get_Playerid] [this get_id]
}

method VaisseauMiniMap_P dispose {} {
	$this(miniMapCanvas) delete $this(id)
	# Desinscriptipn
	$this(kernel) Subscribe_after_Update_ship $objName ""
	this inherited
}

method VaisseauMiniMap get_id {} {
	return [$this(parent) get_id]
}

method VaisseauMiniMap get_Playerid {} {
	return [$this(parent) get_playerId]
}
