package require Tk;
#Import Class
cd {C:\apps\tcl\include\gml_Object}
source gml_Object.tcl
source PAC.tcl
source introspact.tcl
cd {D:/Jeff/SkyDrive/Documents/Polytech/RICM5/S1/IHM/projet-ihm}
source jeu.tcl
source assesor_generator.tcl
#Initialisation du jeu
if {[lsearch  [gmlObject info objects Jeu] J ] == -1 } {
	#Instance de Jeu
	Jeu J;
	#instance Introspact pour le Jeu 
	Introspact intro J;

	#Test
	J addPlayer toto green
	J addPlayer titi purple
	J addPlanete Jupitae 167 198 30 2
	J addShip toto ooo1 90 200
	J addShip titi ooo3 90 400



}

