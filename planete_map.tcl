inherit PlaneteMap_P Presentation
method PlaneteMap_P constructor {control mapCanvas x y radius} {
  	this inherited $control
	set this(mapCanvas) $mapCanvas
	set this(id) [$this(mapCanvas) create oval [expr {$x-$radius}] [expr {$y-$radius}] [expr {$x+$radius}] [expr {$y+$radius}] -outline #000 -fill black]
}

inherit PlaneteMap Control
method PlaneteMap constructor {parent mapCanvas x y radius} {
  PlaneteMap_P ${objName}_P $objName $mapCanvas $x $y $radius


  #Héritage
  this inherited $parent "" ${objName}_P ""

}
# Generate_PAC_accessors Control Planete_Map_A Planete_Map_P ${objName};

