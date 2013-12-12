inherit VaisseauMiniMap_P Presentation
method VaisseauMiniMap_P constructor {control miniMapCanvas x y color} {
  	set this(miniMapCanvas) $miniMapCanvas
	set this(id) [$this(miniMapCanvas) create oval [expr {$x/2-5}] [expr {$y/2-5}] [expr {$x/2+5}] [expr {$y/2+5}] -outline #000 -fill $color]
}

inherit VaisseauMiniMap Control
method VaisseauMiniMap constructor {parent miniMapCanvas x y color} {
  VaisseauMiniMap_P ${objName}_P $objName $miniMapCanvas $x $y $color


  #Héritage
  this inherited $parent "" ${objName}_P ""
}

#Manque GETTER ET SETTER
