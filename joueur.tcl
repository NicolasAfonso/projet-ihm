
inherit Joueur_A Abstraction
method Joueur_A constructor {control kernel name color} {
  this inherited $control
	set this(kernel) $kernel
	set this(name) $name
	set this(color) $color
	set this(id) [$kernel Add_new_player $name]
}

inherit Joueur_P Presentation
method Joueur_P constructor {control infoCanvas} {
  
}

inherit Joueur Control
method Joueur constructor {parent kernel infoCanvas name color} {
  Joueur_P ${objName}_P $objName $infoCanvas
  Joueur_A ${objName}_A $objName $kernel name color

  #Héritage
  this inherited $parent ${objName}_A ${objName}_P ""

}

#Manque GETTER ET SETTER
#Generate_PAC_accessors Control Joueur_A Joueur_P ${objName};