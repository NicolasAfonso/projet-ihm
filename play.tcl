package require Tk;
#Import Class
cd {C:\apps\tcl\include\gml_Object}
source gml_Object.tcl
source PAC.tcl
source introspact.tcl
cd {D:/Jeff/SkyDrive/Documents/Polytech/RICM5/S1/IHM/projet-ihm}
source jeu.tcl
#Initialisation du jeu
if {[lsearch  [gmlObject info objects Jeu] J ] == -1 } {
	#Instance de Jeu
	Jeu J;
	#instance Introspact pour le Jeu 
	Introspact intro J;

	#Declare new objets 
	J addPlayer Republique white
	J addPlayer Empire black
	J addPlanete Naboo 519 687 30 2
	J addPlanete Tatooine 954 695 30 2
	J addPlanete Coruscant 691 385 30 2
	J addPlanete Endor 499 94 30 2
	J addShip Republique faucon_millenium 319 100
	J addShip Republique croiseur 200 50
	J addShip Empire etoile_noire 90 400



}

