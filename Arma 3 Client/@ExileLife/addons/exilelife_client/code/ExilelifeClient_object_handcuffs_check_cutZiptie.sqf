/**
                    * ExilelifeClient_object_handcuffs_check_cutZiptie
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result","_pliers"];
_result = true;
try
{
    if !(alive player) then
    {
        throw false;
    };
    if !(alive ExileClientInteractionObject) then
    {
        throw false;
    };
    if (ExileClientIsHandcuffed) then
    {
        throw false;
    };
    if (ExileClientInteractionObject isEqualTo player) then
    {
        throw false;
    };
    if (ExileClientInteractionObject getVariable ['ExileLifeClientIncapacitated', false]) then
    {
            throw false;
    };
	if !(ExileClientInteractionObject getVariable ['ExileIsHandcuffed', false]) then
	{
		throw false;
	};
	if (ExileClientInteractionObject getVariable ['ExileLifeisEscorted', false]) then
	{
		throw false;
	};
	if (ExileClientInteractionObject getVariable ['ExileLifeCementShoes', false]) then
	{
		throw false;
	};
	_pliers = [player,"Exile_Item_Pliers"] call ExileLifeClient_util_playercargo_contains;
	if !(_pliers) then
	{
		throw false;
	};
    if ((player distance ExileClientInteractionObject) > 2) then
    {
        throw false;
    };
}
catch
{
	_result = _exception;
};
_result
