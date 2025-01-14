/**
                    * ExileServer_object_player_network_beginTakeAllRequest
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

                    private["_sessionID","_parameters","_objectNetID","_object"];
_sessionID = _this select 0;
_parameters = _this select 1;
_objectNetID = _parameters select 0;
_object = objectFromNetId _objectNetID;
if !(isNull _object) then
{
	if ((_object getVariable ["ExileTakeAllLock", ""]) isEqualTo "") then
	{
		_object setVariable ["ExileTakeAllLock", _sessionID];
		[_sessionID, "beginTakeAllResponse", [_objectNetID]] call ExileServer_system_network_send_to;
	};
};