/// scr_Globals

// Used in scr_CheckInput
/*
	scr_CheckInput will check for keyboard and gamepad input, if gp_device > -1,
	otherwise it will only check the keyboard. This makes checking input easier,
	instead of having to check two inputs in the code, you run scr_CheckInput
	which does it for you.
*/
globalvar global.in_up = 0;
globalvar global.in_down = 1;
globalvar global.in_left = 2;
globalvar global.in_right = 3;
globalvar global.in_accept = 4;
globalvar global.in_back = 5;
globalvar global.in_check = 0;
globalvar global.in_pressed = 1;
globalvar global.in_released = 2;

// default gamepad controls
globalvar global.gp_device		= -1;
globalvar global.gp_up 			= 0;
globalvar global.gp_down 		= 0;
globalvar global.gp_left 		= 0;
globalvar global.gp_right 		= 0;
globalvar global.gp_accept 		= 0;
globalvar global.gp_back 		= 0;


// default keyboard controls
globalvar global.key_up 		= vk_up;
globalvar global.key_down 		= vk_down;
globalvar global.key_left 		= vk_left;
globalvar global.key_right 		= vk_right;
globalvar global.key_accept 	= vk_enter;
globalvar global.key_back 		= vk_esc;

// Set this to true to trigger the game to close
globalvar global.ExitGame = false;

////////////////////////////////////////////////////////////////////////////////////////
// LINKED-LIST STYLE BUTTON MENU
////////////////////////////////////////////////////////////////////////////////////////
// this gets set to whatever button is selected by default or by the user
// You create your buttons, derived from obj_menu_button
// The create event needs to be overriden if you want to use it, 
// all other events are safe to use.
// When you instance_create your buttons you set their onextbtn and oprevbtn variables
// to the next and previous buttons for your button menu.
// After that, you set global.menu_button to your default selected button and 
// call scr_UpdateMenuButtons inside your room's step event.
////////////////////////////////////////////////////////////////////////////////////////
globalvar global.menu_button = noone;

// gameplay 
globalvar global.bdeathscene = false;
globalvar global.total_nugs_found = 0;
globalvar global.total_crys_found = 0;
globalvar global.level = 1;
globalvar global.level_rocks_left = 0;
globalvar global.level_nugs_total = 0;
globalvar global.level_nugs_found = 0;
globalvar global.level_crys_total = 0;
globalvar global.level_crys_found = 0;
globalvar global.level_waterchance_mod = 20;  // waterchance = irandom(level_waterchance_mod-global.level); see obj_mine:room_start
globalvar global.level_waterrocks = 0;		 // the number of water rocks in a mine.
globalvar global.level_odoorexit = noone;	// should be set and cleared by obj_mine instance
globalvar global.level_odoorhome = noone;	// should be set and cleared by obj_mine instance

// Define play area
// This reserves two sections, one above and one below the play area for stats & options
globalvar global.mine_topy = 16 * 2;
globalvar global.mine_boty = 240 - (global.mine_topy);

//////////////////////////////////////////////////////////////////////////////////
// global.oplayer: persistant player object instance
//////////////////////////////////////////////////////////////////////////////////
// this helps access the player object instance in the game whenever we want to.
//////////////////////////////////////////////////////////////////////////////////
globalvar global.oplayer = instance_create(-32,-32, obj_p1);
global.oplayer.visible = false;

// DO LAST
globalvar global.globals_init = true;