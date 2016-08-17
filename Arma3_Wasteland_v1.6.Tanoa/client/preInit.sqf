// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: preInit.sqf
//	@file Author: AgentRev

if (!hasInterface) exitWith {};

0 spawn
{
	waitUntil {!isNull player};
	[player, didJIP, hasInterface] remoteExecCall ["A3W_fnc_initPlayerServer", 2];

	// Disable side chat for indies
	if (playerSide == INDEPENDENT) then
	{
		1 enableChannel true;
	};
};

// skip Continue button if briefing = 0 in description.ext, courtesy of Killzone Kid
0 spawn
{
	_briefing = missionConfigFile >> "briefing";
	if (!isNumber _briefing || round getNumber _briefing > 0) exitWith {};

	waitUntil
	{
		if (getClientStateNumber > 9) exitWith {true};

		if (!isNull findDisplay 53) exitWith // RscDisplayClientGetReady
		{
			ctrlActivate (findDisplay 53 displayCtrl 1);
			findDisplay 53 closeDisplay 1;
			true
		};

		false
	};
};
