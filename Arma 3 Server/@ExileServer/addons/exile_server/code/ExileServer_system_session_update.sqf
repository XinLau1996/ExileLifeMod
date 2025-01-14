/**
                    * ExileServer_system_session_update
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

                    private["_sessionId","_player"];
_sessionId = _this select 0;
_player = _this select 1;
_player setVariable ["ExileSessionID", _sessionId];
missionNamespace setVariable [format["ExileSessionPlayerObject%1", _sessionId], _player];