inherit VaisseauMap_P Presentation
method VaisseauMap_P constructor {control mapCanvas x y color} {
    this inherited $control
   	set this(mapCanvas) $mapCanvas
   	set this(id) [$this(mapCanvas) create oval [expr {$x-10}] [expr {$y-10}] [expr {$x+10}] [expr {$y+10}] -fill $color]

}

inherit VaisseauMap Control
method VaisseauMap constructor {parent mapCanvas x y color} {
  VaisseauMap_P ${objName}_P $objName $mapCanvas $x $y $color

  #Héritage
  this inherited $parent "" ${objName}_P ""

}

#Manque GETTER ET SETTER
