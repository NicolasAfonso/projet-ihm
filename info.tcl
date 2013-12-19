source utils.tcl
inherit Info_P Presentation
method Info_P constructor {control infoCanvas} {
  this inherited $control

  ########### Object information ##############
  set this(infoCanvas) $infoCanvas
  set this(typeLabel) [label $this(infoCanvas).typeLabel -justify left -text ""]

  set this(positionLabel) [label $this(infoCanvas).positionLabel -justify left -text ""]
  set this(nameLabel) [label $this(infoCanvas).nameLabel -justify left -text ""]
  set this(infoLabel) [label $this(infoCanvas).infoLabel -justify left -text ""]
  pack $this(typeLabel) -anchor n -fill both
  pack $this(nameLabel) -anchor n -fill both
  pack $this(positionLabel) -anchor n -fill both
  pack $this(infoLabel) -anchor n -fill both

  ########### Add Ship ########################
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
  set this(addShip) [ttk::button $this(infoCanvas).addShip -text "Ajouter mon vaisseau!" -command "$this(control) addShip"]
  pack $this(addShip) -anchor n -fill both


  ##### Add player ##############################
  set this(addPlayerLabel) [label $this(infoCanvas).addPlayerLabel -justify left -text "Ajouter joueur"]
  set this(playerNameLabel) [label $this(infoCanvas).playerNameLabel -justify left -text "Nom Joueur : "]
  set this(namePlayer) [entry $this(infoCanvas).namePlayer -justify left]

  set this(addColorPlayerLabel) [label $this(infoCanvas).addColorPlayerLabel -justify left -text "Couleur"]
  set this(addColorPlayer) [entry $this(infoCanvas).addColorPlayer -justify left]
  set this(addPlayer) [ttk::button $this(infoCanvas).addPlayer -text "Ajouter mon joueur!" -command "$this(control) addPlayer"]

  pack $this(addPlayerLabel) -anchor n -fill both
  pack $this(playerNameLabel) -anchor n -fill both
  pack $this(namePlayer) -anchor n -fill both
  pack $this(addColorPlayerLabel) -anchor n -fill both
  pack $this(addColorPlayer) -anchor n -fill both
  pack $this(addPlayer) -anchor n -fill both


  #####Command Fire #############################
  set this(addCommandLabel) [label $this(infoCanvas).addCommandLabel -justify left -text "Starfleet command"]
  set this(fire) [ttk::button $this(infoCanvas).fire -text "Feu !" -command "$this(control) fire"]
  pack $this(addCommandLabel) -anchor n -fill both
  pack $this(fire) -anchor n -fill both
	# set this(diametreLabel) [label $this(infoCanvas).diametreLabel -justify left -text "Diametre:"]
	# set this(densiteLabel) [label $this(infoCanvas).densiteLabel -justify left -text "Densite:"]
	# pack $this(diametreLabel) -anchor n -fill both
	# pack $this(diametre) -anchor n -fill both
}


method Info_P addShip {} {
	$this(control) addShipOnKernel [$this(shipPlayer) get] [$this(shipName) get] [$this(coordSX) get]  [$this(coordSY) get]
}

method Info addShip {} {
	$this(presentation) addShip
}

method Info addShipOnKernel {player ship x y} {
	$this(parent) addShip $player $ship $x $y
}

method Info_P addPlayer {} {
	puts "[$this(addColorPlayer) get]"
	$this(control) addPlayerOnKernel [$this(namePlayer) get] [$this(addColorPlayer) get]
}

method Info addPlayer {} {
	$this(presentation) addPlayer
}

method Info addPlayerOnKernel {namePlayer color} {
	$this(parent) addPlayer $namePlayer $color
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