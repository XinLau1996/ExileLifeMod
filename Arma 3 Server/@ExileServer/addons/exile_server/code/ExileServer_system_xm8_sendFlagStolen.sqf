/**
                    * ExileServer_system_xm8_sendFlagStolen
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

                    private["_recipients","_territoryName"];
_recipients = _this getVariable ["ExileTerritoryBuildRights", []];
_territoryName = _this getVariable ["ExileTerritoryName", ""];
["flag-stolen", _recipients, _territoryName] call ExileServer_system_xm8_send;