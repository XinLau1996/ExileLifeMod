/**
                    * ExileServer_system_territory_network_payTerritoryProtectionMoneyRequest
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_sessionID","_parameters","_flagNetID","_playerObject","_flagObject","_flagStolen","_territoryDatabaseID","_radius","_level","_objectsInTerritory","_popTabAmountPerObject","_popTabAmountForSleepingBag","_totalPopTabAmount","_playerPopTabs","_currentTimestamp","_gangBankName","_territoryGang","_gangBankBalance","_newgangBankBalance","_territoryPrice","_logging","_territoryLog"];
_sessionID = _this select 0;
_parameters = _this select 1;
_flagNetID = _parameters select 0;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Invalid player object";
	};
	_flagObject = objectFromNetId _flagNetID;
	if (isNull _flagObject) then
	{
		throw "Invalid flag object";
	};
	_flagStolen = _flagObject getVariable ["ExileFlagStolen", 0];
	if (_flagStolen isEqualTo 1) then
	{
		throw "Flag stolen!";
	};
	_territoryDatabaseID = _flagObject getVariable ["ExileDatabaseID", 0];
	_radius = _flagObject getVariable ["ExileTerritorySize", 15];
	_level = _flagObject getVariable ["ExileTerritoryLevel", 1];
	_objectsInTerritory = _flagObject getVariable ["ExileTerritoryNumberOfConstructions", 0];
	_popTabAmountPerObject = getNumber (missionConfigFile >> "CfgTerritories" >> "popTabAmountPerObject");
	_popTabAmountForSleepingBag = getNumber (missionConfigFile >> "CfgTerritories" >> "minPopTabAmount");
	_totalPopTabAmount = _level * _popTabAmountPerObject * _objectsInTerritory + _popTabAmountForSleepingBag;
	_playerPopTabs = _playerObject getVariable ["ExileMoney", 0];
	if (_playerPopTabs < _totalPopTabAmount) then
	{
		throw "You do not have enough pop tabs!";
	};
	_playerPopTabs = _playerPopTabs - _totalPopTabAmount;
	_playerObject setVariable ["ExileMoney", _playerPopTabs, true];
	format["setPlayerMoney:%1:%2", _playerPopTabs, _playerObject getVariable ["ExileLifePID", -1]] call ExileServer_system_database_query_fireAndForget;
	_currentTimestamp = call ExileServer_util_time_currentTime;
	_flagObject setVariable ["ExileTerritoryLastPayed", _currentTimestamp];
	_flagObject call ExileServer_system_territory_maintenance_recalculateDueDate;
	format["maintainTerritory:%1", _territoryDatabaseID] call ExileServer_system_database_query_fireAndForget;
	_gangBankName = format ["ExileLifeGangBank:%1",_territoryGang];
	_gangBankBalance = missionNamespace getVariable [_gangBankName,-1];
	_newgangBankBalance = _gangBankBalance + _territoryPrice;
	missionNamespace setVariable [_gangBankName,_newgangBankBalance];
	format["updateGangBank:%1:%2",_newgangBankBalance,_territoryGang] call ExileServer_system_database_query_fireAndForget;
	[_sessionID, "toastRequest", ["SuccessTitleOnly", ["Protection money paid!"]]] call ExileServer_system_network_send_to;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "territoryLogging");
	if (_logging isEqualTo 1) then
	{
		_territoryLog = format ["PLAYER ( %1 ) %2 PAID %3 POP TABS TO PROTECT TERRITORY #%4 | PLAYER TOTAL POP TABS: %5",getPlayerUID _playerObject,_playerObject,_totalPopTabAmount,_territoryDatabaseID,_playerPopTabs];
		[_territoryLog,"Territory"] call ExileLifeServer_util_A3Log;
	};
	_flagObject call ExileServer_system_xm8_sendProtectionMoneyPaid;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Failed to pay!", _exception]]] call ExileServer_system_network_send_to;
	_exception call ExileServer_util_log;
};
