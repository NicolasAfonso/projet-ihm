


inherit PlaneteInfo_A Abstraction
method PlaneteInfo_A constructor {control} {
  this inherited $control
}

inherit PlaneteInfo_P Presentation
method PlaneteInfo_P constructor {control} {
  
}

inherit PlaneteInfo Control
method PlaneteInfo constructor {parent infoframe} {
  PlaneteInfo_P ${objName}_P $objName
  PlaneteInfo_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils

}
# Generate_PAC_accessors Control Planete_Info_A Planete_Info_P ${objName};

