#Import utilisé par la classe
cd {D:/Jeff/SkyDrive/Documents/Polytech/RICM5/S1/IHM/projet-ihm}
source SWL_FC.tcl
source univers.tcl
source control_panel.tcl
source joueur.tcl

inherit Jeu_A Abstraction
method Jeu_A constructor {control} {
  this inherited $control

  set this(SWL) ""
  #Declarer le noyau fct
}

inherit Jeu_P Presentation
method Jeu_P constructor {control} {
  # this inherited $control
  # canvas .c
  # pack .c -expand 1 -fill both
  # frame .global -background "#808080" -relief groove
  # frame .global.panel -background "#808080" -relief groove
  # frame .global.minimap -background "#808080" -relief groove
  # frame .global.map -background "#808080" -relief groove

  # pack .global.minimap -side left
  # pack .global.map -side top -ipadx 5 -ipadx 5
  # pack .global.panel -side top -fill x -expand true
  # pack .global -fill x -expand true -ipadx 5 -ipady 5 -side left

}

inherit Jeu Control
method Jeu constructor { } {
  Jeu_P ${objName}_P $objName
  Jeu_A ${objName}_A $objName
  
  #setter la liste des childrens avant de la passer ds le constructeur
  
  
	# Declaration PAC fils
	ControlPannel ${objName}_ControlPannel $objName "";
	Univers ${objName}_Univers $objName "" "" "" ""; #mapFrame minimapFrame infoFrame
	#Liste de joueur
	Joueur ${objName}_JA $objName;
  Joueur ${objName}_JB $objName;
	this inherited "" ${objName}_A ${objName}_P [list ${objName}_ControlPannel ${objName}_Univers ${objName}_JA ${objName}_JB]
}

#Manque Liste de joueur

#Getters and setters
#Generate_PAC_accessors Control Jeu_A Jeu_P m;