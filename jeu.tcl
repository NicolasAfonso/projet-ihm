#Import utilisé par la classe
source SWL_FC.tcl
source univers.tcl
source control_pannel.tcl
source joueur.tcl

inherit Jeu_A Abstraction
method Jeu_A constructor {control} {
  this inherited $control
  set this(SWL) ""
  #Declarer le noyau fct
}

inherit Jeu_P Presentation
method Jeu_P constructor {control} {
  this inherited $control
  toplevel ._$objName
  entry ._${objName}.e
  pack ._${objName}.e -fill x -expand 1
  # On s'abonne à l'appui sur la touche "Return"
  bind ._${objName}.e <Return> "$objName user_set_value \[._${objName}.e get\]"
}

inherit Jeu Control
method Jeu constructor { } {
  Jeu_P ${objName}_P $objName
  Jeu_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils
	ControlPannel ${objName}_CP $objName;
	Generate_PAC_accessors Control ControlPannel_A ControlPannel_P ${objName}_CP;
	Univers ${objName}_U $objName;
	Generate_PAC_accessors Control Univers_A Univers_P ${objName}_U;
	#List de joueur
	Joueur ${objName}_J $objName;
	Generate_PAC_accessors Control Joueur_A Joueur_P ${objName}_J;
}

#Manque Liste de joueur
