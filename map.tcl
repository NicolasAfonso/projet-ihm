inherit Map_P Presentation
method Map_P constructor {control mapCanvas kernel} {
  this inherited $control
	set this(mapCanvas) $mapCanvas

	$kernel Subscribe_after_Start_fire A "
	$this(mapCanvas) delete Bullet
	set radius 3
	foreach {id x y vx vy} \$this(L_bullets) {
		$this(mapCanvas) create oval \[expr \$x - \$radius\] \[expr \$y - \$radius\] \[expr \$x + \$radius\] \[expr \$y + \$radius\] -fill black -tags \[list Bullet \$id\]
	}"

	$kernel Subscribe_after_Compute_a_simulation_step A "
	set radius 3
	foreach {id x y vx vy} \$this(L_bullets) {
		$this(mapCanvas) coords \$id \[expr \$x - \$radius\] \[expr \$y - \$radius\] \[expr \$x + \$radius\] \[expr \$y + \$radius\]
	}"
}

inherit Map Control
method Map constructor {parent mapCanvas kernel} {
  Map_P ${objName}_P $objName $mapCanvas $kernel

  #Héritage
  this inherited $parent "" ${objName}_P ""
}