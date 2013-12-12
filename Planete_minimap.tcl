inherit PlaneteMiniMap_P Presentation
method PlaneteMiniMap_P constructor {control miniMapCanvas x y radius} {
	this inherited $control
	set this(miniMapCanvas) $miniMapCanvas
	set this(id) [$this(miniMapCanvas) create oval [expr {($x-$radius)/2}] [expr {($y-$radius)/2}] [expr {($x+$radius)/2}] [expr {($y+$radius)/2}] -outline #000 -fill black]
  
}

inherit PlaneteMiniMap Control
method PlaneteMiniMap constructor {parent miniMapCanvas x y radius} {
  PlaneteMiniMap_P ${objName}_P $objName $miniMapCanvas $x $y $radius


  #Héritage
  this inherited $parent "" ${objName}_P ""

}
# Generate_PAC_accessors Control Planete_Map_A Planete_Map_P ${objName};

