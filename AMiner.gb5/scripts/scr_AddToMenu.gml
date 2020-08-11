/// Add a button to a linked list menu or start a new menu list
//addtomenu(button, prevbutton, nextbutton, x, y, autoxmargin, autoymargin, isDefault)
{
	button = argument0;
	prevbutton = argument1;
	nextbutton = argument2;
	button.x = argument3;
	button.y = argument4;
 	button.autoxmargin = argument5; // how much to space from previous button x axis
 	button.autoymargin = argument6; // how much to space from previous button y axis
 	global.menu_button = (argument7) == true ? button : global.menu_button;
	button.oprevbtn = prevbutton;
	button.onextbtn = nextbutton;
	
	if(prevbutton != noone)
	{
		if(prevbutton.onextbtn != noone)
			{ /* log button relationship previosly set */ }
	}
	
	if(nextbutton != noone)
	{
		if(nextbutton.oprevbtn != noone)
			{ /* log  button relationship previously set */ }
	}
	
	prevbutton.onextbtn = button;
	nextbutton.oprevbtn = button;
	return 0;
}
