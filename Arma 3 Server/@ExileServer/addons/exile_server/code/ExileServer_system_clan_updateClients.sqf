/**
                    * ExileServer_system_clan_updateClients
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

                    private["_clanID","_hash","_members"];
_clanID = _this;
_hash = missionNameSpace getVariable [format["ExileServer_clan_%1",_clanID],[]];
if!(_hash isEqualTo [])then
{
	_members = _hash call ExileClient_util_clan_getClanMembers;
	if(!(_members isEqualTo []))then
	{
		{
			if(!(isNull _x))then
			{
				[_x,"updateClanInfoFull",_hash] call ExileServer_system_network_send_to;
			};		
		}
		forEach _members;
	};
};
true