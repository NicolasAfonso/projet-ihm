


inherit Planete_Map_A Abstraction
method Planete_Map_A constructor {control} {
  this inherited $control
}

inherit Planete_Map_P Presentation
method Planete_Map_P constructor {control} {
  
}

inherit Planete_Map Control
method Planete_Map constructor { } {
  Planete_Map_P ${objName}_P $objName
  Planete_Map_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""

}
Generate_PAC_accessors Control Planete_Map_A Planete_Map_P ${objName};

