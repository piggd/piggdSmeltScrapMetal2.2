// Script: smelt_scrapmetal.sqf
// Author: piggd
// Revision: 2.3
// Date: 09072013
//  Smelting is based on the boil code in standard dayz.  Modified by piggd to smelt cans into scrap metal. Modified to accomodate items in Chernaus.'
// Rev 2.3 
// Updated Can types

private["_hasboiledbottleitem","_hasbottleitem","_itemsremoved","_hastinitem","_bottletext","_parttext","_itemtext","_itemqty","_item1qty","_item2qty","_item3qty","_item4qty","_item5qty","_item6qty","_item7qty","_item8qty","_item9qty","_item10qty","_item11qty","_item12qty","_item13qty","_item14qty","_item15qty","_item16qty","_item17qty","_item18qty","_item19qty","_item20qty","_item21qty","_item22qty","_item23qty","_item24qty","_itemsreq","_dis","_sfx"];
player removeAction s_player_smelt_scrapmetal;
s_player_smelt_scrapmetal = -1;

_hasbottleitem = "ItemWaterbottle" in magazines player;
_hasboiledbottleitem = "ItemWaterbottleBoiled" in magazines player;
_hastinitem = false;
_item1qty = {_x == "ItemTrashRazor"} count magazines player;
_item2qty = {_x == "TrashTinCan"} count magazines player;
_item3qty = {_x == "ItemSodaEmpty"} count magazines player;
_item4qty = {_x == "ItemSodaCokeEmpty"} count magazines player;
_item5qty = {_x == "ItemSodaPepsiEmpty"} count magazines player;
_item6qty = {_x == "ItemSodaMdewEmpty"} count magazines player;
_item7qty = {_x == "ItemSodaClaysEmpty"} count magazines player;
_item8qty = {_x == "ItemSodaR4z0rEmpty"} count magazines player;
_item9qty = {_x == "ItemSodaMtngreenEmpty"} count magazines player;
_item10qty = {_x == "FoodCanUnlabeledEmpty"} count magazines player;
_item11qty = {_x == "FoodCanOrlokEmpty"} count magazines player;
_item12qty = {_x == "FoodCanBadguyEmpty"} count magazines player;
_item13qty = {_x == "FoodCanGriffEmpty"} count magazines player;
_item14qty = {_x == "FoodCanCurgonEmpty"} count magazines player;
_item15qty = {_x == "FoodCanTylersEmpty"} count magazines player;
_item16qty = {_x == "FoodCanBoneboyEmpty"} count magazines player;
_item17qty = {_x == "FoodCanPowellEmpty"} count magazines player;
_item18qty = {_x == "FoodCanHerpyEmpty"} count magazines player;
_item19qty = {_x == "FoodCanDemonEmpty"} count magazines player;
_item20qty = {_x == "FoodCanCornEmpty"} count magazines player;
_item21qty = {_x == "FoodCanFraggleosEmpty"} count magazines player;
_item22qty = {_x == "ItemSodaRabbitEmpty"} count magazines player;
_item23qty = {_x == "ItemSodaDrwasteEmpty"} count magazines player;
_item24qty = {_x == "ItemNails"} count magazines player;
_itemqty = _item1qty + _item2qty + _item3qty +_item4qty + _item5qty + _item6qty + _item7qty + _item8qty + _item9qty + _item10qty + _item11qty + _item12qty + _item13qty + _item14qty + _item15qty + _item16qty + _item17qty + _item18qty + _item19qty + _item20qty + _item21qty + _item22qty + _item23qty + _item24qty;
// The required can quanity must be between low enough to accomodate the invenotry max.
_itemsreq = 6;
_itemsremoved = 0;
if ( _hasboiledbottleitem ) then {
		_hasbottleitem = true;
};
 if (_itemqty >= _itemsreq) then {
    _hastinitem = true;
 };

_bottletext = getText (configFile >> "CfgMagazines" >> "ItemWaterbottle" >> "displayName");
_itemtext = format["%1 of %2 empty cans or razors required",_itemqty,_itemsreq];
_parttext = getText (configFile >> "CfgMagazines" >> "PartGeneric" >> "displayName");
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
				player removeMagazine "ItemTrashRazor";
				_itemsremoved = _itemsremoved + 1;
			};	
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item2qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "TrashTinCan";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item3qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item4qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaCokeEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item5qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaPepsiEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
		
			if (_x <= _item6qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaMdewEmpty";
				_itemsremoved = _itemsremoved + 1;
			};	
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item7qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaClaysEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item8qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaR4z0rEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item9qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaMtngreenEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item10qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanUnlabeledEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
		
			if (_x <= _item11qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanOrlokEmpty";
				_itemsremoved = _itemsremoved + 1;
			};	
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item12qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanBadguyEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item13qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanGriffEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item14qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanCurgonEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item15qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanTylersEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
		
			if (_x <= _item16qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanBoneboyEmpty";
				_itemsremoved = _itemsremoved + 1;
			};	
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item17qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanPowellEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item18qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanHerpyEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item19qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanDemonEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item20qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanCornEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item21qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanFraggleosEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item22qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "FoodCanFraggleosEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item23qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaDrwasteEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item24qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemNails";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		player addMagazine "ItemWaterbottleUnfilled";
        player addMagazine "PartGeneric";
        cutText [format[(localize  "str_build_01"),_parttext], "PLAIN DOWN"];
} else {
        cutText [format[(localize  "str_build_failed_01"),_parttext], "PLAIN DOWN"];
};