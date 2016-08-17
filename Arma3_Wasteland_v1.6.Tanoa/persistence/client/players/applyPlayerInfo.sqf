// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: applyPlayerInfo.sqf
//	@file Author: AgentRev

// This is where you load custom player variables that must persist between deaths

private _data = _this;

{
	_x params ["_name", "_value"];

	switch (_name) do
	{
		case "Donator": { player setVariable ["Donator", _value > 0] }; // not used in vanilla
	};
} forEach _data;
