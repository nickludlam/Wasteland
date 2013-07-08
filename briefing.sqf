waitUntil {!isNull player && isPlayer player};

player createDiarySubject ["changelog", "Changelog"];
player createDiarySubject ["Info", "Info"];

player createDiaryRecord["changelog",
[
"1.0 His_Shadow -",
"<br/><br/>
- Code optimazition and readability modifications.<br/>
- Lowered number of vehicles on map.<br/>
- Enabled purchasing of vehicles in gun store.<br/>
- Varioius other tweaks and additions.<br/>"
]
];

player createDiaryRecord["changelog",
[
"1.1 His_Shadow -",
"<br/><br/>
- Increased number of random vehicle spawns and decreased probability of 'placed' vehicles to spawn.<br/>
- Added a 'Promote' button in group management.<br/>
- Added new side and main mission for added variety.<br/>
- Increased purchase price of Ka-60.<br/>
- Set the start time of the mission to 4:15 A.M.<br/>
- Edited some poor grammar and wording throughout the mission.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.2 His_Shadow -",
"<br/><br/>
- Ka-60 can now pick up AH-9 and MH-9.<br/>
- Helicopters can now pick up barriers and other objects.<br/>
- Increased the number of vehicles that spawn on the map.<br/>
- Added two new missions Mob Money and Money Shipment.<br/>
- Added the ability to lock/unlock vehicles purchased from the gun store. Random vehicles can not be locked for balancing reasons.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.3 His_Shadow -",
"<br/><br/>
- You can not change squad leader to someone who is within 80 meters of an enemy player.<br/>
- Mob Money mission now ends when all money bags have been picked up.<br/>
- Added Kabita ammo to the Gun Store (FINALLY!).<br/>
- Money Shipment starting point moved. The mission now gives the three AI $10,000 each. The mission doesn't end until all of the bags have been picked up. If the Hunter has been destroyed it is removed. If it has not been destroyed it remains as a reward.<br/>
- Players now spawn with a backpack.<br/>
- Added the ability to tow boats.<br/>
- Small boats can be moved.<br/>
- All boats now have load in option.<br/>
- Added diving goggles to the Gun Store.<br/>
- Boats can now tow objects.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.4 His_Shadow -",
"<br/><br/>
- Broke out a separate section for apparel and added more items to the gun store.<br/>
- When purchasing an item from the gun store it no longer tells you to drop what you are wearing. It assumes you mean to buy it and removes what you are wearing.<br/>
- Red wetsuit is fixed.<br/>
- Mob money now has a wider range of areas to spawn in.<br/>
- Added a new side mission called 'Sunken Treasure' in which money spawns at the bottom of the ocean.<br/>
- Vehicles now have color options in the Gun Store. (O)=Orange (Y)=Yellow (R)=Red (P)=Pink.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.5 His_Shadow -",
"<br/><br/>
- Prices adjusted in gun store.<br/>
- Adjusted mission start time to 4:00 P.M.<br/>
- Sunken treasure now spawns farther and deeper and the amount given has been increased.<br/>
- New Main Mission called Sea Convoy. Two armed ships are patrolling the seas. Defeat them and get $5,000 and greate weapons.<br/>
- Sunken Treasure mission now has an armored boat as well as AI guarding it. If all AI are killed when the money is picked up weapons crates will spawn.<br/>
- Main buildings now re-construct themselves every 30 minutes.<br/>
- Guns laid around the map now respawn after 45 mins.<br/>
- EBR ammo is fixed. They changed class name.<br/>
- Enemies are now searching for the sunken treasure.<br/>
- New capture points at the two new towns on the map.<br/>
- Vehicles now clear their dead selves after 5 minutes.<br/>
- Cleanup will process dead bodies strewn about the map on an interval.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.6 His_Shadow -",
"<br/><br/>
- Backpacks taken away and drasctically reduced in price at the gun store to give more incentive for earning and using money.<br/>
- Independents now spawn with random civi clothes.<br/>
- Watch towers will now repair along with buildings.<br/>
- Buying items from the gun store now properly analyzes available space in inventory and places it accordingly.<br/>
- Buying a primary weapon in the gun store will now replace the gun you currently have equipped instead of telling you cannot equip. It assumes that you know your current weapon will be replaced. If you want to keep it you should place it in your backpack before buying or sell it.<br/>
- Kill Farm expanded.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.7 His_Shadow -",
"<br/><br/>
- Selling a gun in the gun store will now net you half of it's buying price.
- Positions of Gun Runners and Gun Store owners changed. Every 30 minutes when buildings repair gun store owners will also be moved back into their respective buildings.<br/>
- Killing AI will give neither positive nor negative aggregate score. The total isn't reflected in the first column, but the aggregate overall score is properly adjusted.<br/>
- Number of player and vehicle spawn locations upped.<br/>
- Number of vehicles spawned initially upped slightly.<br/>
- Only civilian vehicles spawn initially with a few military with a reduced chance to spawn in and inability to respawn. All other military vehicles must be purchased.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.7.1 His_Shadow -",
"<br/><br/>
- Number of player and vehicle spawn locations upped.<br/>
- Number of vehicles spawned initially upped slightly.<br/>
- Only civilian vehicles spawn initially with a few military with a reduced chance to spawn in and inability to respawn. All other military vehicles must be purchased.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.7.2 His_Shadow -",
"<br/><br/>
- Independent players now can't spawn if there are other independent players nearby. It ignores players in their group.<br/>
- Gun Store building now no longer take damage.<br/>
- Gun Store owners return to their starting position on an interval.<br/>
- Backpacks have been added as thier own category in the gun store. More backpacks have been added.<br/>
- Vehicles have been broken out into Land, Sea, and Air in the gun store. This will make things a little more organized when more vehicles are released.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.7.3 His_Shadow -",
"<br/><br/>
- Initial saving/loading functionality.<br/>
- Gun Runner on east side moved to west side.<br/>
- When a missile has been fired from a lock on a notification now appears.<br/>
- Upped server capacity to 72 people.<br/>
- Sights and things are now loading in, but must be taken off weapons and into your gear inventory.<br/>
- Chapels now heal and restore food and water.<br/>
- Gun Store moved.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.7.4 His_Shadow -",
"<br/><br/>
- Donation awards are now active. If you donate on our website at www.the501stelite.com every time you spawn you will spawn with 5 times the amount you donated. When you die that amount will be removed from the sack you drop to reduce inflation.<br/>
- Saving now happens in the background. Before disconnecting be sure to move ammo and attachments from weapons in to your inventory.<br/>
- Vehicle spawns for gun stores now are done with markers to make moving easire.<br/>
- Armed chopper missions now spawn random chopper types.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.7.5 His_Shadow -",
"<br/><br/>
- Sniper pack update.<br/>
- Added gun store.<br/>
- Moved the gun stores around.<br/>
- Other various improvements.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.7.6 His_Shadow -",
"<br/><br/>
- If you're indi people in your group are no longer enemy at the gunstores.<br/>
- Money no longer saves because people were abusing it.<br/>
- Donation awards are now 25 times the amount donated.<br/>
- Other minor changes.<br/>
- New general store.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.1 His_Shadow -",
"<br/><br/>
- KoS migration.<br/>
- Vehicle Stores.<br/>
- Revamped Gun Store.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"1.2 His_Shadow -",
"<br/><br/>
- Bounty Hunt mission added.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.0 Bewilderbeest & His_Shadow -",
"<br/><br/>
- Incorporated all Beta content.<br/>
- Rearmed the Mob Money and Serial Killer missions.<br/>
- You can no longer spawn on yourself as group leader.<br/>
- New mission involving the APCs.<br/>
- New choppers incorporated into chopper missions.<br/>
- Bounty Hunt time increased to 30 minutes.<br/>
- Gun store price adjustment.<br/>
- Audible sound when missile is fired at vehicle.<br/>
- 5.56 supressor in gun store.<br/>
"
]
];

player createDiaryRecord["changelog",
[
"2.1 Bewilderbeest & His_Shadow -",
"<br/><br/>
- Sprint meter added.<br/>
- Running exhaustion mechanic added.<br/>
- Moved Airfield spawn.<br/>
- Added persistent gun store markers so for when the gun store circles disappear.<br/>
- General Store updated.<br/>
- RPG AA taken out because 1) AA for RPG isn't ubiquitously thought of to exist. 2) Forces Titan usage.<br/>
"
]
];

player createDiaryRecord["Info",
[
"The Basics -",
"
<br/>
* Bags are for sale in the Gun Store.<br/><br/>
* Yellow territories can be captured by staying in them for 5 consecutive minutes.<br/><br/>
* There are a total of 5 treasure hunts.<br/><br/>
* Vehicles are harder to find to encourage player killing as well as territory capturing.<br/><br/>
* Access the general store via the scroll menu.<br/><br/>
* To use the fuel truck go in an non full of fuel vehicle and approach the fuel truck and use the scroll option refuel.<br/><br/>
* You can refuel 10 times then the truck cannot refuel anymore (destroy it or use it as transport).<br/><br/>
* If you cannot pick up an item place it on the ground then pick it up or place it in your backpack then pick it up.<br/><br/>
* Cousin Romans Garage and Palmbeatz Impoundlot have a repair-refuel-rearm station<br/><br/>
* Medical Supply buildings and churchs will heal you fully when inside them for 30 seconds.<br/><br/>
* You can manually remove all the dead bodies on the server by pressing 0, 0, 1.<br/><br/>
* Capping the airfield will give you twice as much money but it is much harder to hold.<br/><br/>
* Drive inside open garages in Civilian Villages like agia and Girna to heal-refuel.<br/><br/>
	<br/>
"
]
];

player createDiaryRecord["Info",
[
"Server Admin info -",
"
<br/>
	contact us at www.kosclan.org  <br/>
	Or email us at kosclan@gmail.com  <br/>
	Admins:<br/>
	His_Shadow<br/>
	Bewilderbeest<br/>
	Davis<br/>
	CrossOps<br/>
	GodMode<br/>
	<br/>
"
]
];

player createDiaryRecord["Info",
[
"Credits -",
"
<br/>
	Based off of Fussion Wasteland by Fackstah.<br/>
	Contact: fussion-networks.com/desolate  <br/>
	Email: arma3@fussion-networks.com  <br/>
	Danny<br/>
	Fackstah/Cousin Roman<br/>
	Palmbeatz<br/>
	TheC1aw <br/><br/><br/>
	Original base wasteland by 404games<br/>
	404 Team:<br/>
	Deadbeat<br/>
	Costlyy<br/>
	Pulse<br/>
	Domuk<br/>
	<br/>
	For GOT wasteland please visit:https://github.com/JoSchaap/GoT_Wasteland-Stratis-full<br/><br/>
	Some building layouts via Stratis Enhanced by afroVoodoo<br/><br/>
	Big thanks to Fackstah for allowing me to use his build as a base."
]
];
