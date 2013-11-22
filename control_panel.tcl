inherit ControlPannel_P Presentation
method ControlPannel_P constructor {control} {
  this inherited $control
}

inherit ControlPannel Control
method ControlPannel constructor {parent kernel ControlPannelCanevas} {
  ControlPannel_P ${objName}_P $objName

  #Hériatage
  this inherited $parent "" ${objName}_P ""
}
