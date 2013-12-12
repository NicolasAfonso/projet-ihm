#Import utilisé par la classe
cd {D:/Jeff/SkyDrive/Documents/Polytech/RICM5/S1/IHM/projet-ihm}
source SWL_FC.tcl
source univers.tcl
source control_panel.tcl
source joueur.tcl


inherit Jeu_P Presentation
method Jeu_P constructor {control} {
  #Créer fenêtre 
  set this(win) ._$objName
  toplevel $this(win)

  #Créer mapCanvas
  set this(canMap) $this(win).canMap
  canvas $this(canMap) -background blue

  #Créer minimapCanvas
  set this(canMiniMap) $this(win).canMiniMap
  canvas $this(canMiniMap) -background blue

  #Créer mapCanvas
  set this(canInfos) $this(win).frameInfos
  frame $this(canInfos) -background green

  # Placement
  pack $this(canMap) -side right -expand 1 -fill both
  pack $this(canMiniMap) -side top -expand 0 -fill both
  pack $this(canInfos) -expand 1 -fill both
}

inherit Jeu_A Presentation
method Jeu_A constructor {control} {
  set this(fc)  ${objName}_kernel
  SWL_FC $this(fc)
}
inherit Jeu Control
method Jeu constructor { } {
  Jeu_P ${objName}_P $objName
  Jeu_A ${objName}_A $objName
   #Héritage
  this inherited "" ${objName}_A ${objName}_P [list]
 

	# Declaration PAC fils

  #Liste de joueur
  #Joueur parent kernel infoCanvas name color
  #Joueur ${objName}_JA $objName [${objName}_A attribute fc] [${objName}_P attribute canInfos] tutu green
  #Joueur ${objName}_JB $objName [${objName}_A attribute fc] [${objName}_P attribute canInfos] toto purple

  #ControlPannel parent kernel ControlPannelCanvas
	ControlPannel ${objName}_ControlPannel $objName [${objName}_A attribute fc] [${objName}_P attribute canInfos]

  #Univers parent kernel mapCanvas minimapCanvas infoCanvas
	Univers ${objName}_Univers $objName [${objName}_A attribute fc] [${objName}_P attribute canMap] [${objName}_P attribute canMiniMap] [${objName}_P attribute canInfos]


}

method Jeu addPlanete {name x y radius density} {
  ${objName}_Univers addPlanete $name $x $y $radius $density
}

method Jeu addShip {player name x y} {
  ${objName}_Univers addShip $player $name $x $y
}

method Jeu addPlayer {name color} {
  Joueur ${objName}_J_$name $objName [${objName}_A attribute fc] [${objName}_P attribute canInfos] $name $color
}

method Jeu fire {} {
  ${objName}_Univers fire
}