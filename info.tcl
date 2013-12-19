inherit Info_P Presentation
method Info_P constructor {control infoCanvas} {
  this inherited $control
  set this(infoCanvas) $infoCanvas
  set this(typeLabel) [label $this(infoCanvas).typeLabel -justify left -text ""]

  set this(positionLabel) [label $this(infoCanvas).positionLabel -justify left -text ""]
  set this(nameLabel) [label $this(infoCanvas).nameLabel -justify left -text ""]
  set this(infoLabel) [label $this(infoCanvas).infoLabel -justify left -text ""]
  pack $this(typeLabel) -anchor n -fill both
  pack $this(nameLabel) -anchor n -fill both
  pack $this(positionLabel) -anchor n -fill both
  pack $this(infoLabel) -anchor n -fill both


 #  	set this(diametre) [entry $this(infoCanvas).diametre -justify left]
	# set this(densite) [entry $this(infoCanvas).densite -justify left]

	# set this(diametreLabel) [label $this(infoCanvas).diametreLabel -justify left -text "Diametre:"]
	# set this(densiteLabel) [label $this(infoCanvas).densiteLabel -justify left -text "Densite:"]
	# pack $this(diametreLabel) -anchor n -fill both
	# pack $this(diametre) -anchor n -fill both
}

inherit Info Control
method Info constructor {parent infoCanvas} {
  Info_P ${objName}_P $objName $infoCanvas
  	
  #Héritage
  this inherited $parent "" ${objName}_P "" 
}

#Manque GETTER ET SETTER