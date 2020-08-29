if (global.menu_button != noone)
{
	if (global.menu_button.state == global.menu_button.state_edit)
		return 0;
		
	global.menu_button.image_blend = make_color_rgb(255,255,255);
	if( scr_isinpressed(global.in_down) || scr_isinpressed(global.in_right))
	{
		global.menu_button.image_blend = make_color_rgb(128,128,128);	
		next = global.menu_button.onextbtn;
		next.image_blend = make_color_rgb(255,255,255);
		global.menu_button = next;
	}
	
	if( scr_isinpressed(global.in_up) || scr_isinpressed(global.in_left) )
	{
		global.menu_button.image_blend = make_color_rgb(128,128,128);
		prev = global.menu_button.oprevbtn;
		prev.image_blend = make_color_rgb(255,255,255);
		global.menu_button = prev;
	}	
	
	if( scr_isinpressed(global.in_accept) )
	{
		global.menu_button.perform_accept = true;
	}	
	
}
