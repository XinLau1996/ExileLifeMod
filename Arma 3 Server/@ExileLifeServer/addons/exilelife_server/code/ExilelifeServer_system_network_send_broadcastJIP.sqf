/**
                    * ExilelifeServer_system_network_send_broadcastJIP
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

                    private["_messageName","_messageParameters","_publicMessage"];
params ["_messageName", "_messageParameters"];
_publicMessage = [_messageName, _messageParameters];
_publicMessage remoteExecCall ["ExileClient_system_network_dispatchIncomingMessage", -2, true];
_publicMessage = nil;
