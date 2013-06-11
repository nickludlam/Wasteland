sleep 3;
player globalchat "Loading...";
//Requests info from server in order to download stats
_donation = getPlayerUID player + "_donation";
[_donation, _donation, "ComputedMoney", "NUMBER"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "Weapons", "ARRAY"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "SecondaryWeapon", "STRING"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "HandgunWeapon", "STRING"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "Goggles", "STRING"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "Position", "ARRAY"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "Direction", "NUMBER"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "Outfit", "STRING"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "HeadGear", "STRING"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "Backpack", "STRING"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "Vest", "STRING"] call sendToServer;
//[getPlayerUID player, getPlayerUID player , "Money", "NUMBER"] call sendToServer;
//sleep .1;
[getPlayerUID player, getPlayerUID player, "CanFood", "NUMBER"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "Medkits", "NUMBER"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "Water", "NUMBER"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "Fuel", "NUMBER"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "RepairKits", "NUMBER"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "FuelFull", "NUMBER"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "FuelEmpty", "NUMBER"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "SpawnBeacon", "NUMBER"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "Camonet", "NUMBER"] call sendToServer;
//[getPlayerUID player, getPlayerUID player, "Magazines", "ARRAY"] call sendToServer;
//sleep .15;
[getPlayerUID player, getPlayerUID player, "Health", "NUMBER"] call sendToServer;


//wait until everything has loaded in to add items
waitUntil {!isNil "primaryLoaded"};
waitUntil {!isNil "secondaryLoaded"};
waitUntil {!isNil "outfitLoaded"};
waitUntil {!isNil "vestLoaded"};
waitUntil {!isNil "backpackLoaded"};
[getPlayerUID player, getPlayerUID player, "Items", "ARRAY"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "PrimaryItems", "ARRAY"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "SecondaryItems", "ARRAY"] call sendToServer;
[getPlayerUID player, getPlayerUID player, "HandgunItems", "ARRAY"] call sendToServer;
//===========================================================================

//END
statsLoaded = 1;
titleText ["","BLACK IN",4];
player globalchat "Player loaded.";