/**
                    * ExileServer_util_time_addTime
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

                    private["_time1","_time2"];
_time1 = _this select 0;
_time2 = _this select 1;
(call compile ("extDB3" callExtension format ["9:TIMEDIFF:MINUTES:%1:%2",_time1,_time2])) select 1