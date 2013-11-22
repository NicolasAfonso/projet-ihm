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
  canvas $this(canMap) -background black

  #Créer mapCanvas
  set this(canMiniMap) $this(win).canMiniMap
  canvas $this(canMiniMap) -background red

  #Créer mapCanvas
  set this(frameInfos) $this(win).frameInfos
  frame $this(frameInfos) -background green

  # Placement
  pack $this(canMap) -side right -expand 1 -fill both
  pack $this(canMiniMap) -side top -expand 0 -fill both
  pack $this(frameInfos) -expand 1 -fill both
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

  #ControlPannel parent kernel ControlPannelCanvas
	ControlPannel ${objName}_ControlPannel $objName [${objName}_A attribute fc] ""

  #Univers parent kernel mapCanvas minimapCanvas infoCanvas
	Univers ${objName}_Univers $objName "" "" "" ""

	#Liste de joueur
  #Joueur parent kernel infoCanvas
	Joueur ${objName}_JA $objName "" ""
  Joueur ${objName}_JB $objName "" ""

}

#Manque Liste de joueur

#Getters and setters
#Generate_PAC_accessors Control Jeu_A Jeu_P m;