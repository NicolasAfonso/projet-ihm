inherit VaisseauInfo_P Presentation
method VaisseauInfo_P constructor {control kernel infoCanvas x y color id}  {
	this inherited $control
	set this(infoCanvas) $infoCanvas
	set this(color) $color
	set this(kernel) $kernel
	set this(id) $id
   	$this(kernel) Subscribe_after_Update_ship $objName  "if {\$id == \"$this(id)\"} {
  		puts \"Ship $this(id) selected\";
  		$this(control) display_info
  		}"
}


method VaisseauInfo_P display_info {} {
	set name [$this(control) get_name]
	set velocity [$this(control) get_velocity]
	set x [$this(control) get_x]
	set y [$this(control) get_y]
	set this(typeLabel) [$this(infoCanvas).typeLabel configure -text "Ship information"]
	set this(shipNameLabel) [$this(infoCanvas).nameLabel configure -text "Name Ship: $name"]
	set this(positionLabel) [$this(infoCanvas).positionLabel configure -text "Coordinate in space: $x - $y"]
	set this(infoLabel) [$this(infoCanvas).infoLabel configure -text "Velocity : $velocity"]
}


inherit VaisseauInfo Control
method VaisseauInfo constructor {parent kernel infoCanvas mapCanvas x y color id} {
  VaisseauInfo_P ${objName}_P $objName $kernel $infoCanvas $x $y $color $id

  #Héritage
  this inherited $parent "" ${objName}_P ""
  
}

method VaisseauInfo display_info {} {
	$this(presentation) display_info
}

method VaisseauInfo get_id {} {
	return [$this(presentation) get_id]
}

method VaisseauInfo get_name {} {
	return [$this(parent) get_name]
}

method VaisseauInfo get_velocity {} {
	return [$this(parent) get_velocity]
}

method VaisseauInfo get_x {} {
	return [$this(parent) get_x]
}

method VaisseauInfo get_y {} {
	return [$this(parent) get_y]
}