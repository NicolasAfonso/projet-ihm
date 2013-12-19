inherit PlaneteInfo_P Presentation
method PlaneteInfo_P constructor {control kernel infoCanvas id} {
  	this inherited $control
	set this(infoCanvas) $infoCanvas
	set this(kernel) $kernel
	set this(infoCanvas) $infoCanvas
	set this(id) $id
   	$this(kernel) Subscribe_after_Update_planet $objName  "if {\$id == \"$this(id)\"} {
  		puts \"Ship $this(id) selected\";
  		$this(control) display_info
  		}"
 }

method PlaneteInfo_P display_info {} {
	puts "Here"
	set name [$this(control) get_name]
	set density [$this(control) get_density]
	set x [$this(control) get_x]
	set y [$this(control) get_y]
	set this(typeLabel) [$this(infoCanvas).typeLabel configure -text "Planet information"]
	set this(nameLabel) [$this(infoCanvas).nameLabel configure -text "Name Planet: $name"]
	set this(positionLabel) [$this(infoCanvas).positionLabel configure -text "Coordinate in space: $x - $y"]
	set this(infoLabel) [$this(infoCanvas).infoLabel configure -text "Density: $density"]
}
inherit PlaneteInfo Control
method PlaneteInfo constructor {parent kernel infoCanvas x y id} {
  PlaneteInfo_P ${objName}_P $objName $kernel $infoCanvas $id


  #Héritage
  this inherited $parent "" ${objName}_P ""


}

method PlaneteInfo display_info {} {
	$this(presentation) display_info
}

method PlaneteInfo get_id {} {
	return [$this(presentation) get_id]
}

method PlaneteInfo get_name {} {
	return [$this(parent) get_name]
}

method PlaneteInfo get_density {} {
	return [$this(parent) get_density]
}

method PlaneteInfo get_x {} {
	return [$this(parent) get_x]
}

method PlaneteInfo get_y {} {
	return [$this(parent) get_y]
}

