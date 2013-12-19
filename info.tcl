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

   set this(addShipLabel) [label $this(infoCanvas).addShipLabel -justify left -text "Ajouter vaisseau"]
   set this(shipNameLabel) [label $this(infoCanvas).shipNameLabel -justify left -text "Nom vaisseau : "]
   set this(shipName) [entry $this(infoCanvas).shipName -justify left]

   set this(playerSNameLabel) [label $this(infoCanvas).playerSNameLabel -justify left -text "Nom du joueur : "]
   set this(shipPlayer) [entry $this(infoCanvas).shipPlayer -justify left]

   set this(coordXLabel) [label $this(infoCanvas).coordXLabel -justify left -text "X : "]
   set this(coordSX) [entry $this(infoCanvas).coordSX -justify left]

   set this(coordYLabel) [label $this(infoCanvas).coordYLabel -justify left -text "Y : "]
   set this(coordSY) [entry $this(infoCanvas).coordSY -justify left]

   pack $this(addShipLabel) -anchor n -fill both
   pack $this(shipNameLabel) -anchor n -fill both
   pack $this(shipName) -anchor n -fill both

   pack $this(playerSNameLabel) -anchor n -fill both
   pack $this(shipPlayer) -anchor n -fill both

   pack $this(coordXLabel) -anchor n -fill both
   pack $this(coordSX) -anchor n -fill both

   pack $this(coordYLabel) -anchor n -fill both
   pack $this(coordSY) -anchor n -fill both

   set this(addShip) [ttk::button $this(infoCanvas).addShip -text "Ajouter mon vaisseau!" -command "$this(control) addShip $this(shipName) $this(shipPlayer) $this(coordSX) $this(coordSY)"]
   pack $this(addShip) -anchor n -fill both
 #   set this(diametre) [entry $this(infoCanvas).diametre -justify left]
	# set this(densite) [entry $this(infoCanvas).densite -justify left]

   set this(addCommandLabel) [label $this(infoCanvas).addCommandLabel -justify left -text "Starfleet command"]
   set this(fire) [ttk::button $this(infoCanvas).fire -text "Feu !" -command "$this(control) fire"]
   pack $this(addCommandLabel) -anchor n -fill both
   pack $this(fire) -anchor n -fill both
	# set this(diametreLabel) [label $this(infoCanvas).diametreLabel -justify left -text "Diametre:"]
	# set this(densiteLabel) [label $this(infoCanvas).densiteLabel -justify left -text "Densite:"]
	# pack $this(diametreLabel) -anchor n -fill both
	# pack $this(diametre) -anchor n -fill both
}

method Info addShip {player name x y} {
	$this(parent) addShip $player $name $x $y
}

method Info fire {} {
	$this(parent) fire
}

inherit Info Control
method Info constructor {parent infoCanvas} {
  Info_P ${objName}_P $objName $infoCanvas
  	
  #Héritage
  this inherited $parent "" ${objName}_P "" 
}

#Manque GETTER ET SETTER