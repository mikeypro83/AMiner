if (global.menu_button != noone)
{
	if( keyboard_check_pressed(global.key_down) ||
		keyboard_check_pressed(global.key_right) ||
		( (global.gp_device > -1) && (
		gamepad_button_check(global.gp_device, global.gp_down) ||
		gamepad_button_check(global.gp_device, global.gp_right) ) )
		)
	{
		global.menu_button.image_blend = make_color_rgb(128,128,128);	
		next = global.menu_button.onextbtn;
		next.image_blend = make_color_rgb(255,255,255);
		global.menu_button = next;
	}
	
	if( keyboard_check_pressed(global.key_up) ||
		keyboard_check_pressed(global.key_left) ||
		( (global.gp_device > -1) && (
		gamepad_button_check(global.gp_device, global.gp_up) ||
		gamepad_button_check(global.gp_device, global.gp_left) ) )
		)
	{
		global.menu_button.image_blend = make_color_rgb(128,128,128);
		prev = global.menu_button.oprevbtn;
		prev.image_blend = make_color_rgb(255,255,255);
		global.menu_button = prev;
	}	
	
	if( keyboard_check_pressed(global.key_accept) ||
		( (global.gp_device > -1) && (
		joystick_check_button(global.gp_device, global.gp_accept) ) )
		)
	{
		global.menu_button.perform_accept = true;
	}	
	
}
