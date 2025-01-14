/**
                    * ExilelifeClient_system_keybinding_initialize
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_shiftState"];
ExileLifeStringedDiks =
[
	["-1", ""],
	["0", ""],
	["1", "Esc"],
	["2", "1"],
	["3", "2"],
	["4", "3"],
	["5", "4"],
	["6", "5"],
	["7", "6"],
	["8", "7"],
	["9", "8"],
	["10", "9"],
	["11", "0"],
	["12", "-"],
	["13", "="],
	["14", "Backspace"],
	["15", "Tab"],
	["16", "Q"],
	["17", "W"],
	["18", "E"],
	["19", "R"],
	["20", "T"],
	["21", "Y"],
	["22", "U"],
	["23", "I"],
	["24", "O"],
	["25", "P"],
	["26", "["],
	["27", "]"],
	["28", "Enter"],
	["29", "LCtrl"],
	["30", "A"],
	["31", "S"],
	["32", "D"],
	["33", "F"],
	["34", "G"],
	["35", "H"],
	["36", "J"],
	["37", "K"],
	["38", "L"],
	["39", ";"],
	["40", "'"],
	["41", "`"],
	["42", "LShift"],
	["43", "\"],
	["44", "Z"],
	["45", "X"],
	["46", "C"],
	["47", "V"],
	["48", "B"],
	["49", "N"],
	["50", "M"],
	["51", ","],
	["52", "."],
	["53", "/"],
	["54", "RShift"],
	["55", "NumPad *"],
	["56", "LAlt"],
	["57", "Space"],
	["58", "CapsLock"],
	["59", "F1"],
	["60", "F2"],
	["61", "F3"],
	["62", "F4"],
	["63", "F5"],
	["64", "F6"],
	["65", "F7"],
	["66", "F8"],
	["67", "F9"],
	["68", "F10"],
	["69", "NumLock"],
	["70", "ScrollLock"],
	["71", "NumPad 7"],
	["72", "NumPad 8"],
	["73", "NumPad 9"],
	["74", "NumPad -"],
	["75", "NumPad 4"],
	["76", "NumPad 5"],
	["77", "NumPad 6"],
	["78", "NumPad +"],
	["79", "NumPad 1"],
	["80", "NumPad 2"],
	["81", "NumPad 3"],
	["82", "NumPad 0"],
	["83", "NumPad ."],
	["84", ""],
	["85", ""],
	["86", "OEM 102"],
	["87", "F11"],
	["88", "F12"],
	["100", "F13"],
	["101", "F14"],
	["102", "F15"],
	["112", "Kana"],
	["115", "/?"],
	["121", "Convert"],
	["123", "NoConvert"],
	["125", "Yen"],
	["126", "NumPad ."],
	["141", "NumPad ="],
	["144", "Prev"],
	["145", "@"],
	["146", ":"],
	["147", "_"],
	["148", "Kanji"],
	["149", "Stop"],
	["150", "AX"],
	["153", "Next"],
	["156", "NumPad Enter"],
	["157", "RCtrl"],
	["160", "Mute"],
	["161", "Calculator"],
	["162", "Play/Pause"],
	["164", "Stop"],
	["174", "Volume -"],
	["176", "Volume +"],
	["178", "Web Home"],
	["179", "NumPad ,"],
	["181", "NumPad /"],
	["183", "SysRq"],
	["184", "RAlt"],
	["197", "Pause"],
	["199", "Home"],
	["200", "Up"],
	["201", "Page Up"],
	["203", "Left"],
	["205", "Right"],
	["207", "End"],
	["208", "Down"],
	["209", "Page Down"],
	["210", "Insert"],
	["211", "Delete"],
	["219", "Left Windows"],
	["220", "Right Windows"],
	["221", "App Menu"],
	["222", "Power"],
	["223", "Sleep"],
	["227", "Wake"],
	["229", "Search"],
	["230", "Favorites"],
	["231", "Refresh"],
	["232", "Stop"],
	["233", "Forward"],
	["234", "Back"],
	["235", "My Computer"],
	["236", "Mail"],
	["237", "Media"],
	["327680", "Controller Button 1"],
	["327681", "Controller Button 2"],
	["327682", "Controller Button 3"],
	["327683", "Controller Button 4"],
	["327690", "Controller Button 5"],
	["327691", "Controller Button 6"],
	["327689", "Controller Button 7"],
	["327688", "Controller Button 8"],
	["327694", "Controller Button 9"],
	["327695", "Controller Button 10"],
	["327684", "Controller Direction Up"],
	["327685", "Controller Direction Down"],
	["327686", "Controller Direction Left"],
	["327687", "Controller Direction Right"]
];
ExileLifeForbiddenStringedDiks = ["327693","327692","327699","327703","327702","327698","327697","327701","327700","327696","327788"];
ExileLifeKeybindsUp = createLocation ["ExileLife_Dummy", [-5000,-5000,0], 0, 0];
ExileLifeKeybindsDown = createLocation ["ExileLife_Dummy", [-5000,-5000,0], 0, 0];
[
	"General",
	"OpenXM8",
	"Open XM8",
	"Opens the XM8 if you have it in your inventory. <br /><t size='0.7'>Default Key: 6</t>",
	{},
	{
		if !(ExileClientIsInConstructionMode) then
		{
			if !(ExileClientXM8IsVisible) then
			{
				if ("Exile_Item_XM8" in (assignedItems player)) then
				{
					if (alive player) then
					{
						[] call ExileClient_gui_xm8_show;
					};
				};
			};
		};
		true
	},
	[
		0x07,
		[
			false,
			false,
			false
		]
	]
]
call ExileLifeClient_system_keybinding_add;
[
	"General",
	"Holster",
	"Holster your weapon",
	"Puts your weapon away so you aren't armed. <br /><t size='0.7'>Default Key: 4</t>",
	{},
	{
		if !(ExileClientIsHandcuffed || ExileIsPlayingRussianRoulette) then
		{
			if !(ExileClientIsInConstructionMode) then
			{
				if (!(currentWeapon player isEqualTo "")) then
				{
					[true] call ExileLifeClient_object_player_action_holsterweapon;
				}
				else
				{
					if (player hasWeapon ExileLifeCurrentWeapon) then
					{
						[false] call ExileLifeClient_object_player_action_holsterweapon;
					};
				};
			};
		};
		true
	},
	[
		0x05,
		[
			false,
			false,
			false
		]
	]
]
call ExileLifeClient_system_keybinding_add;
[
	"HUD",
	"ToggleStat",
	"Switch Hud Stats",
	"Switches your stats hud between Health, Temperature and Hunger/Thirst <br /><t size='0.7'>Default Key: ` (Grave)</t>",
	{},
	{
		call ExileClient_gui_hud_toggleStatsBar;
		true
	},
	[
		0x29,
		[
			false,
			false,
			false
		]
	]
]
call ExileLifeClient_system_keybinding_add;
[
	"HUD",
	"InteractionMenu",
	"Show 3D Interaction Menu",
	"While pressed, this will show the 3D interaction menu with Vehicles, Houses, and more!<br /><t size='0.7'>Default Key: Left Windows Key</t>",
	{
		ExileLifeActionMenu = true;
		true
	},
	{
		ExileLifeActionMenu = false;
		if (!(ExileClientIsHandcuffed) || !(((locked ExileClientInteractionObject) isEqualTo 2))) then
		{
			if !(ExileLifeFruitTree isEqualto []) then
			{
				call ExileLifeClient_resources_pickfruitRequest;
			}
			else
			{
				if ((ExileClientInteractionObject isKindOf "Car") || (ExileClientInteractionObject isKindOf "Air") || (ExileClientInteractionObject isKindOf "Ship") || (ExileClientInteractionObject isKindOf "Motorcycle") || (ExileClientInteractionObject isKindOf "A3L_Tahoe_Base")) then
				{
					call ExileLifeClient_gui_hud_VehicleActionFind;
				};
			};
		};
		true
	},
	[
		0xDB,
		[
			false,
			false,
			false
		]
	]
]
call ExileLifeClient_system_keybinding_add;
[
	"HUD",
	"PartyESPMode",
	"Switch Party ESP Mode",
	"Switches the options in Party ESP mode. <br /><t size='0.7'>Default Key: Right Windows Key</t>",
	{
	},
	{
		switch (ExilePartyEspMode) do
		{
			case 0: 		{ ExilePartyEspMode = 1; };
			case 1: 		{ ExilePartyEspMode = 2; };
			case 2: 		{ ExilePartyEspMode = 0; };
		};
		true
	},
	[
		0xDC,
		[
			false,
			false,
			false
		]
	]
]
call ExileLifeClient_system_keybinding_add;
[
	"General",
	"ToggleEarplugs",
	"Toggles Earplugs",
	"Toggles Earplugs off and on <br /><t size='0.7'>Default Key: 5</t>",
	{
	},
	{
		if (!_shiftState) then
		{
			if !(ExileClientIsInConstructionMode) then
			{
				call ExileClient_system_music_earplugs_toggle;
			};
		};
		true
	},
	[
		0x06,
		[
			false,
			false,
			false
		]
	]
]
call ExileLifeClient_system_keybinding_add;
[
	"General",
	"ToggleAutoRun",
	"Toggles Auto Run",
	"Toggles Auto Run off and on <br /><t size='0.7'>Default Key: 0</t>",
	{
	},
	{
		if !(ExileClientIsHandcuffed) then
		{
			call ExileClient_system_autoRun_toggle;
		};
		true
	},
	[
		0x0B,
		[
			false,
			false,
			false
		]
	]
]
call ExileLifeClient_system_keybinding_add;
