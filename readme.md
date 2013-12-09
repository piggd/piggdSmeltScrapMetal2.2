*****************************************
* Mod Name:  piggd Smelt Scrap Metal    *
* Author: piggd							*
* Email: dayzpiggd@gmail.com			*
* Version: 2.2							*
* Date:	12/9/2013						*
*****************************************

Information:
I really hate farming and having to dump 50-75% of the items I gather outside the building because they have no practical use in the game or I have too many. 
Really how many road flares or cans of pepsi do you really need?  So this mod will you to turn your trash into useful items.  
This mod will allow you to make multiple materials into other useful items.  It requires fileed canteen of water (boiled or unboiled), tool box and a fire for all receipes.

Change log ver 1.0 - Inital Script creation
Change log ver 2.1 - Created a new smelt folder.  rename smelt.sqf and move it into the smelt folder.  Created new scripts to smelt Engine Parts, Main Rotary Parts,  Fuel Tank, 
	Wind Screen Glass, Wheel, and Unfilled Jerry Can.
Change log ver 2.1 - Added new scripts to smelt heat packs, tents, sandbags, tank traps and wire kits.
Change log ver 2.2 - Updated different ingredient.

Installation:

Unpack your dayz mission pbo.

*****************************************

* Download smelt_*.sqf files 
*  and exmaples https://github.com/piggd/piggdSmeltScrapMetal2.1.git
* Create a smelt folder *
* Copy smelt_*.sqf into smelt folder. *
*****************************************

Make a copy of or modify your existing custom variable.sqf

FIND
	s_player_boil =			-1;

ADD immediately after

// ------------------------------------------------------------------------Piggd Smelt Scrap Metal ver 2.2 Start------------------------------------------------------------------------
	s_player_smelt_engineparts =		-1;
	s_player_smelt_fueltank =			-1;	
	s_player_smelt_heatpack =			-1;	
	s_player_smelt_jerrycan =			-1;	
	s_player_smelt_mainrotoraryparts =	-1;
	s_player_smelt_sandbag =			-1;	
	s_player_smelt_scrapmetal =			-1;	
	s_player_smelt_tanktrap =			-1;	
	s_player_smelt_tent =				-1;	
	s_player_smelt_wheel =				-1;	
	s_player_smelt_windscreenglass =	-1;
	s_player_smelt_wirekit =			-1;	
// ------------------------------------------------------------------------Piggd Smelt Scrap Metal ver 2.2 End----------------------------------------------------------------------

*******************************************************************************************************************************
* Modify your fn_self_actions.sqf file, if new rememver to modify your compiles.sql to point to the custom n_self_actions.sqf *
*******************************************************************************************************************************

FIND
	if (inflamed cursorTarget and (_hasbottleitem and _hastinitem) and _canDo) then {
		if (s_player_boil < 0) then {
			s_player_boil = player addAction [localize "str_actions_boilwater", "\z\addons\dayz_code\actions\boil.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_boil;
		s_player_boil = -1;
	};

ADD immediately after

	// ------------------------------------------------------------------------Piggd Smelt Scrap Metal ver 2.2 Start------------------------------------------------------------------------
	// Smelt Engine Parts
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_engineparts < 0) then {
			s_player_smelt_engineparts = player addAction[("<t color=""	#FF9999"">" + ("Smelt Engine Parts") +"</t>"),"smelt\smelt_engineparts.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_engineparts;
		s_player_smelt_engineparts = -1;
	};
	// Smelt Fuel Tank
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_fueltank < 0) then {
			s_player_smelt_fueltank = player addAction[("<t color=""	#FF9999"">" + ("Smelt Fuel Tank") +"</t>"),"smelt\smelt_fueltank.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_fueltank;
		s_player_smelt_fueltank = -1;
	};
	// Smelt Heat Pack
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_heatpack < 0) then {
			s_player_smelt_heatpack = player addAction[("<t color=""	#FF9999"">" + ("Smelt Heat Pack") +"</t>"),"smelt\smelt_heatpack.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_heatpack;
		s_player_smelt_heatpack = -1;
	};
	// Smelt Jerry Can
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_jerrycan < 0) then {
			s_player_smelt_jerrycan = player addAction[("<t color=""	#FF9999"">" + ("Smelt Jerry Can") +"</t>"),"smelt\smelt_jerrycan.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_jerrycan;
		s_player_smelt_jerrycan = -1;
	};
	// Smelt Main Rotary Parts
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_mainrotoraryparts < 0) then {
			s_player_smelt_mainrotoraryparts = player addAction[("<t color=""	#FF9999"">" + ("Smelt Main Rotary Parts") +"</t>"),"smelt\smelt_mainrotoraryparts.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_mainrotoraryparts;
		s_player_smelt_mainrotoraryparts = -1;
	};
	// Smelt Sand Bag
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_sandbag < 0) then {
			s_player_smelt_sandbag = player addAction[("<t color=""	#FF9999"">" + ("Smelt Sandbags") +"</t>"),"smelt\smelt_sandbag.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_sandbag;
		s_player_smelt_sandbag = -1;
	};
	// Smelt Scrap Metal
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_scrapmetal < 0) then {
			s_player_smelt_scrapmetal = player addAction[("<t color=""	#FF9999"">" + ("Smelt Scrap Metal") +"</t>"),"smelt\smelt_scrapmetal.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_scrapmetal;
		s_player_smelt_scrapmetal = -1;
	};
	// Smelt Tank Trap
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_tanktrap < 0) then {
			s_player_smelt_tanktrap = player addAction[("<t color=""	#FF9999"">" + ("Smelt Tank Trap") +"</t>"),"smelt\smelt_tanktrap.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_tanktrap;
		s_player_smelt_tanktrap = -1;
	};
	// Smelt Tent
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_tent < 0) then {
			s_player_smelt_tent = player addAction[("<t color=""	#FF9999"">" + ("Smelt Tent") +"</t>"),"smelt\smelt_tent.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_tent;
		s_player_smelt_tent = -1;
	};
	// Smelt Wheel
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_wheel < 0) then {
			s_player_smelt_wheel = player addAction[("<t color=""	#FF9999"">" + ("Smelt Wheel") +"</t>"),"smelt\smelt_wheel.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_wheel;
		s_player_smelt_wheel = -1;
	};
	// Smelt Wind Screen Glass
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_windscreenglass < 0) then {
			s_player_smelt_windscreenglass = player addAction[("<t color=""	#FF9999"">" + ("Smelt Wind Screen Glass") +"</t>"),"smelt\smelt_windscreenglass.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_windscreenglass;
		s_player_smelt_windscreenglass = -1;
	};
	// Smelt Wire Kit
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_wirekit < 0) then {
			s_player_smelt_wirekit = player addAction[("<t color=""	#FF9999"">" + ("Smelt Wire Kit") +"</t>"),"smelt\smelt_wirekit.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_wirekit;
		s_player_smelt_wirekit = -1;
	};
// ------------------------------------------------------------------------Piggd Smelt Scrap Metal ver 2.2 End------------------------------------------------------------------------

	
At The bootom of the file find :
	player removeAction s_player_cook;
	s_player_cook = -1;
Add this after these two lines.

// ------------------------------------------------------------------------Piggd Smelt Scrap Metal ver 2.2------------------------------------------------------------------------
	player removeAction s_player_smelt_engineparts;
	s_player_smelt_engineparts = -1;

	player removeAction s_player_smelt_fueltank;
	s_player_smelt_fueltank = -1;

	player removeAction s_player_smelt_heatpack;
	s_player_smelt_heatpack = -1;

	player removeAction s_player_smelt_jerrycan;
	s_player_smelt_jerrycan = -1;

	player removeAction s_player_smelt_mainrotoraryparts;
	s_player_smelt_mainrotoraryparts = -1;

	player removeAction s_player_smelt_sandbag;
	s_player_smelt_sandbag = -1;

	player removeAction s_player_smelt_scrapmetal;
	s_player_smelt_scrapmetal = -1;

	player removeAction s_player_smelt_tanktrap;
	s_player_smelt_tanktrap = -1;

	player removeAction s_player_smelt_tent;
	s_player_smelt_tent = -1;

	player removeAction s_player_smelt_wheel;
	s_player_smelt_wheel = -1;

	player removeAction s_player_smelt_windscreenglass;
	s_player_smelt_windscreenglass = -1;

	player removeAction s_player_smelt_wirekit;
	s_player_smelt_wirekit = -1;
// ------------------------------------------------------------------------Piggd Smelt Scrap Metal ver 2.2 End------------------------------------------------------------------------


Repack your PBO and upload it to the sever.