/**
                    * ExileServer_system_database_query_fireAndForget
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

                    private["_parameters","_query"];
_parameters = _this;
_query = [1, ExileServerDatabaseSessionId, _parameters] joinString ":";
"extDB3" callExtension _query;
true