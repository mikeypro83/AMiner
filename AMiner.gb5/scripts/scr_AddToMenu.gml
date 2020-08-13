/// Add a button to a linked list menu or start a new menu list
// scr_AddToMenu(x, y, buttontype, prevbutton, nextbutton, autoxmargin, autoymargin, isDefault)
{
	atm_buttontype = argument0;
	atm_button = instance_create(argument0, argument1, argument2);
	atm_button.oprevbtn = argument3;
	atm_button.onextbtn = argument4;
	atm_button.autoxmargin = argument5; // how much to space from previous button x axis
 	atm_button.autoymargin = argument6; // how much to space from previous button y axis
 	
 	if (argument7==true)
 	{
 		global.menu_button = atm_button;
 		
 	}

	if(atm_button.oprevbtn != noone)
	{
		atm_button.oprevbtn.onextbtn = atm_button;
	}
	
	if(atm_button.onextbtn != noone)
	{
		atm_button.onextbtn.oprevbtn = atm_button;
	}
	
	return atm_button;
}
