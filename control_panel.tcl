inherit ControlPannel_A Abstraction
method ControlPannel_A constructor {control} {
}

inherit ControlPannel_P Presentation
method ControlPannel_P constructor {control} {
  this inherited $control
}

inherit ControlPannel Control
method ControlPannel constructor {parent kernel} {
  
  ControlPannel_P ${objName}_P $objName
  ControlPannel_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
}

#Manque GETTER ET SETTER