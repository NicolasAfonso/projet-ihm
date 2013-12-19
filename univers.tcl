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
	# $kernel Subscribe_after_Destroy_planet A {puts "Destroy planet $id"; $this(mapCanvas) delete $id}
	# $kernel Subscribe_after_Update_planet  A {
	# set x [dict get $this(D_planets) $id x]
	# set y [dict get $this(D_planets) $id y]
	# set radius [dict get $this(D_planets) $id radius]
	# # this(mapCanvas) coords $id [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius]
	# }	

	# # $kernel Subscribe_after_Destroy_ship A {puts "Destroy ship $id"; $this(mapCanvas) delete $id}
	# $kernel Subscribe_after_Destroy_ship A "puts {Destroy ship \$id}; $this(mapCanvas) delete \$id"

# 	$kernel Subscribe_after_Add_new_ship ALEX {$this(mapCanvas) delete $rep; $this(mapCanvas) create oval [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius] -fill red -tags [list ALEX $rep]}
# $kernel Subscribe_after_Destroy_ship ALEX {puts "Destroy ship $id"; $this(mapCanvas) delete $id}
# $kernel Subscribe_after_Update_ship  ALEX {
# 	set x [dict get $this(D_players) $id_player D_ships $id x]
# 	set y [dict get $this(D_players) $id_player D_ships $id y]
# 	set radius [dict get $this(D_players) $id_player D_ships $id radius]
# 	$this(mapCanvas) coords $id [expr $x - $radius] [expr $y - $radius] [expr $x + $radius] [expr $y + $radius]
# }

	
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

	#Vaisseaux parent kernel mapCanvas minimapCanvas infoframe
	#Vaisseau ${objName}_V1 $objName $kernel $mapCanvas $minimapCanvas $infoCanvas Player_1 90 90 red

	

	#Heritage
	this inherited $parent ${objName}_A "" [list ${objName}_I ${objName}_MMAP ${objName}_MAP ] 
}

method Univers addPlanete {name x y radius density} {
	#Planetes parent kernel mapCanvas minimapCanvas infoCanvas x y radius density
	#Planete ${objName}_P1 $objName $kernel $mapCanvas $minimapCanvas $infoCanvas 50 50 40 40
	Planete ${objName}_$name $objName $this(kernel) $name $this(mapCanvas) $this(minimapCanvas) $this(infoCanvas) $x $y $radius $density
}

method Univers addShip {player name x y} {
Vaisseau ${objName}_$name $objName $this(kernel) $this(mapCanvas) $this(minimapCanvas) $this(infoCanvas) $player $name $x $y 
}

method Univers fire {} {
	$this(kernel) Start_fire
}

