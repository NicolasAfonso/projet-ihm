inherit MiniMap_P Presentation
method MiniMap_P constructor {control miniMapCanvas kernel} {
  this inherited $control

  set this(miniMapCanvas) $miniMapCanvas
  	$kernel Subscribe_after_Start_fire A "
	$this(miniMapCanvas) delete Bullet
	set radius 3
	foreach {id x y vx vy} \$this(L_bullets) {
		$this(miniMapCanvas) create oval \[expr \$x - \$radius\] \[expr \$y - \$radius\] \[expr \$x + \$radius\] \[expr \$y + \$radius\] -fill black -tags \[list Bullet \$id\]
	}"

	$kernel Subscribe_after_Compute_a_simulation_step A "
	set radius 3
	foreach {id x y vx vy} \$this(L_bullets) {
		$this(miniMapCanvas) coords \$id \[expr \$x - \$radius\] \[expr \$y - \$radius\] \[expr \$x + \$radius\] \[expr \$y + \$radius\]
	}"
}

inherit MiniMap Control
method MiniMap constructor {parent miniMapCanvas kernel} {
  MiniMap_P ${objName}_P $objName $miniMapCanvas $kernel

  this inherited $parent "" ${objName}_P ""
}
#Generate_PAC_accessors Control MiniMap_A MiniMap_P m;