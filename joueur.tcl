
inherit Joueur_A Abstraction
method Joueur_A constructor {control} {
  this inherited $control
}

inherit Joueur_P Presentation
method Joueur_P constructor {control} {
  
}

inherit Joueur Control
method Joueur constructor {parent infoCanevas} {
  Joueur_P ${objName}_P $objName
  Joueur_A ${objName}_A $objName

  #Héritage
  this inherited $parent ${objName}_A ${objName}_P ""

}

#Manque GETTER ET SETTER
#Generate_PAC_accessors Control Joueur_A Joueur_P ${objName};