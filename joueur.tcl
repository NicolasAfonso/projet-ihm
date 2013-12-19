
inherit Joueur_A Abstraction
method Joueur_A constructor {control kernel name color} {
  this inherited $control
	set this(kernel) $kernel
	set this(name) $name
	set this(color) $color
	set this(id) [$kernel Add_new_player $name]
}


Generate_PAC_accessors Joueur Joueur_A "" name
Generate_PAC_accessors Joueur Joueur_A "" id
Generate_PAC_accessors Joueur Joueur_A "" color

inherit Joueur_P Presentation
method Joueur_P constructor {control infoCanvas} {
  
}

inherit Joueur Control
method Joueur constructor {parent kernel infoCanvas name color} {
  Joueur_P ${objName}_P $objName $infoCanvas
  Joueur_A ${objName}_A $objName $kernel $name $color

  #Héritage
  this inherited $parent ${objName}_A ${objName}_P ""

}


method Joueur get_id {} {
	return [$this(abstraction) get_id]
}