#Import utilisé par la classe
cd {D:/Jeff/SkyDrive/Documents/Polytech/RICM5/S1/IHM/projet-ihm}
source SWL_FC.tcl
source univers.tcl
source joueur.tcl
source utils.tcl


inherit Jeu_P Presentation
method Jeu_P constructor {control} {
  this inherited $control
  #Créer fenêtre 
  set this(win) ._$objName
  toplevel $this(win)
  wm protocol $this(win) WM_DELETE_WINDOW "$this(control) dispose"
  wm title $this(win) "Dans une galaxie lointaine, très lointaine..."
  #Créer mapCanvas
  set this(canMap) $this(win).canMap
  canvas $this(canMap) -background blue

  #Créer minimapCanvas
  set this(canMiniMap) $this(win).canMiniMap
  canvas $this(canMiniMap) -background blue

  #Créer mapCanvas
  set this(canInfos) $this(win).frameInfos
  frame $this(canInfos) -background grey

  # Placement
  pack $this(canMap) -side right -expand 1 -fill both
  pack $this(canMiniMap) -side top -expand 0 -fill both
  pack $this(canInfos) -expand 1 -fill both
}


inherit Jeu_A Abstraction
method Jeu_A constructor {control} {
  this inherited $control
  set this(kernel)  ${objName}_kernel
  SWL_FC $this(kernel)
}

inherit Jeu Control
method Jeu constructor { } {
  Jeu_P ${objName}_P $objName
  Jeu_A ${objName}_A $objName
   #Héritage
  this inherited "" ${objName}_A ${objName}_P [list]

	# Declaration PAC fils
  #Univers parent kernel mapCanvas minimapCanvas infoCanvas
	Univers ${objName}_Univers $objName [${objName}_A attribute kernel] [${objName}_P attribute canMap] [${objName}_P attribute canMiniMap] [${objName}_P attribute canInfos]
}

method Jeu_P dispose {} {
  destroy $this(win)
  this inherited
}

method Jeu addPlanete {name x y radius density} {
  ${objName}_Univers addPlanete $name $x $y $radius $density
}

method Jeu addShip {playerName nameShip x y} {
  ${objName}_Univers addShip $playerName $nameShip $x $y 
}

method Jeu addPlayer {name color} {
  Joueur ${objName}_J_$name $objName [${objName}_A attribute kernel] [${objName}_P attribute canInfos] $name $color
}

method Jeu fire {} {
  ${objName}_Univers fire
}