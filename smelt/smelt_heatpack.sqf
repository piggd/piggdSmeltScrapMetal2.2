// Script: smelt_heatpack.sqf
// Author: piggd
// Revision: 2.1
// Date: 04272013
//  Smelting is based on the boil code in standard dayz.  Modified by piggd to smelt cans into scrap metal.

private["_hasboiledbottleitem","_hasbottleitem","_itemsremoved","_hastinitem","_bottletext","_item1text","_item2text","_item3text","_item4text","_parttext","_itemtext","_itemqty","_item1qty","_item2qty","_item3qty","_item4qty","_itemsreq","_dis","_sfx"];
player removeAction s_player_smelt_heatpack;
s_player_smelt_heatpack = -1;


_hasbottleitem = "ItemWaterbottle" in magazines player;
_hasboiledbottleitem = "ItemWaterbottleBoiled" in magazines player;
_hastinitem = false;
_item1qty = {_x == "HandChemRed"} count magazines player;
_item2qty = {_x == "HandChemGreen"} count magazines player;
_item3qty = {_x == "HandChemBlue"} count magazines player;
_item4qty = {_x == "HandRoadFlare"} count magazines player;
_itemqty = _item1qty +_item2qty +_item3qty +_item4qty;
// The required can quanity must be between 1 to 11 due to inventory constraints. 1 WB and 11 cans is max.
_itemsreq = 2;
_itemsremoved = 0;
if ( _hasboiledbottleitem ) then {
		_hasbottleitem = true;
};
 if (_itemqty >= _itemsreq) then {
    _hastinitem = true;
 };

_bottletext = getText (configFile >> "CfgMagazines" >> "ItemWaterbottle" >> "displayName");
_item1text = getText (configFile >> "CfgMagazines" >> "HandChemGreen" >> "displayName");
_item2text = getText (configFile >> "CfgMagazines" >> "HandChemRed" >> "displayName");
_item3text = getText (configFile >> "CfgMagazines" >> "HandChemBlue" >> "displayName");
_item4text = getText (configFile >> "CfgMagazines" >> "HandRoadFlare" >> "displayName");
_itemtext = format["%1 of %2 %3 / %4 / %5 / %6 required",_itemqty,_itemsreq,_item1text,_item2text,_item3text,_item4text];
_parttext = getText (configFile >> "CfgMagazines" >> "ItemHeatPack" >> "displayName");
if (!_hasbottleitem) exitWith {cutText [format[(localize "str_player_31"),_bottletext,"smelt"] , "PLAIN DOWN"]};
if (!_hastinitem) exitWith {cutText [format[(localize "str_player_31"),_itemtext,"smelt"] , "PLAIN DOWN"]};

if (_hasbottleitem and _hastinitem) then {
        player playActionNow "Medic";
        sleep 1;
        _dis=10;
        _sfx = "cook";
        [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
        [player,_dis,true,(getPosATL player)] spawn player_alertZombies;

        sleep 5;
		if ( _hasboiledbottleitem ) then {
			player removeMagazine "ItemWaterbottleBoiled";
		 } else {
			player removeMagazine "ItemWaterbottle";
		};
		for "_x" from 1 to _itemsreq do {
		
			if (_x <= _item1qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "HandChemRed";
				_itemsremoved = _itemsremoved + 1;
			};	
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item2qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "HandChemGreen";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item3qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "HandChemBlue";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item4qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "HandRoadFlare";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		player addMagazine "ItemWaterbottleUnfilled";
        player addMagazine "ItemHeatPack";
        cutText [format[(localize  "str_build_01"),_parttext], "PLAIN DOWN"];
} else {
        cutText [format[(localize  "str_build_failed_01"),_parttext], "PLAIN DOWN"];
};