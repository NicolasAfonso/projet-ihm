#Import Class
source info.tcl
source mini_map.tcl
source map.tcl
source vaisseau.tcl
source planete.tcl

inherit Univers_A Abstraction
method Univers_A constructor {control kernel mapCanvas minimapCanvas infoCanvas} {
	this inherited $control
	set this(mapCanvas) $mapCanvas
	
}

inherit Univers Control
method Univers constructor {parent kernel mapCanvas minimapCanvas infoCanvas} {
  	Univers_A ${objName}_A $objName $kernel $mapCanvas $minimapCanvas $infoCanvas
  	   
  	set this(kernel) $kernel
  	set this(mapCanvas) $mapCanvas
  	set this(minimapCanvas) $minimapCanvas
  	set this(infoCanvas) $infoCanvas

	# Declaration PAC fils
	Info ${objName}_I $objName $infoCanvas
	MiniMap ${objName}_MMAP $objName $minimapCanvas $kernel
	Map ${objName}_MAP $objName $mapCanvas $kernel

	#Heritage
	this inherited $parent ${objName}_A "" [list ${objName}_I ${objName}_MMAP ${objName}_MAP ] 
}

method Univers addPlanete {name x y radius density} {
	Planete ${objName}_$name $objName $this(kernel) $name $this(mapCanvas) $this(minimapCanvas) $this(infoCanvas) $x $y $radius $density
}

method Univers addShip {player name x y} {
	Vaisseau ${objName}_$name $objName $this(kernel) $this(mapCanvas) $this(minimapCanvas) $this(infoCanvas) $this(parent)_J_$player $name $x $y 
}

method Univers fire {} {
	$this(kernel) Start_fire
}

method Univers addPlayer {namePlayer color} {
	$this(parent) addPlayer $namePlayer $color
}
