/// scr_Globals

// Create strings
scr_CreateGlobalStrings();



// default gamepad controls
globalvar global.bgp_found		= false;
globalvar global.gp_device		= -1;
globalvar global.gp_up 			= 0;
globalvar global.gp_down 		= 0;
globalvar global.gp_left 		= 0;
globalvar global.gp_right 		= 0;
globalvar global.gp_accept 		= 0;
globalvar global.gp_back 		= 0;

/*//////////////////////////////////////////////////////////////////////////////
	INPUT - Input Types - GamePad & Keyboard Mappings, Defaults, Setup
//////////////////////////////////////////////////////////////////////////////*/
// input is handled by types of input. Input type is defined as what the program
// expects of the input, IE. in_up would be some kind of Up command, either
// for a player, game object, menu item, etc. Those input types are then given
// a direct relationship to device input buttons/keys such as from a keyboard
// or a gamepad. 
////////////////////////////////////////////////////////////////////////////////

// input types
globalvar global.in_none 	= -1;
globalvar global.in_any 	= 0;
globalvar global.in_up 		= 1;
globalvar global.in_down 	= 2;
globalvar global.in_left 	= 3;
globalvar global.in_right 	= 4;
globalvar global.in_accept 	= 5;
globalvar global.in_back 	= 6;
globalvar global.in_fullscr = 7;
globalvar global.in_last	= 8;

/*
	Gamepad Button To Input Type -- Default Key Mappings
*/
global.gp_none = -1;
globalvar global.in_gp[global.in_none] = global.gp_none;
global.in_gp[global.in_any] = gp_any;
global.in_gp[global.in_up] = gp_padu;
global.in_gp[global.in_down] = gp_padd;
global.in_gp[global.in_left] = gp_padl;
global.in_gp[global.in_right] = gp_padr;
global.in_gp[global.in_accept] = gp_start;
global.in_gp[global.in_back	] = gp_face2;
global.in_gp[global.in_fullscr] = global.gp_select;

/*
	Keyboard Key To Input Type -- Default Key Mappings
*/
globalvar global.in_kb[global.in_none] = vk_none;
global.in_kb[global.in_any] = vk_any;
global.in_kb[global.in_up] = vk_up;
global.in_kb[global.in_down] = vk_down;
global.in_kb[global.in_left] = vk_left;
global.in_kb[global.in_right] = vk_right;
global.in_kb[global.in_accept] = vk_enter;
global.in_kb[global.in_back] = vk_escape;
global.in_kb[global.in_fullscr] = vk_f4;

// Init Gamepad / Key Stuff
scr_DetectGamepad();

////////////////////////////////////////////////////////////////////////////////////////

// Set this to true to trigger the game to close
globalvar global.ExitGame = false;

// OS Window Stuff
globalvar global.game_fullscreen = false;

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

////////////////////////////////////////////////////////////////////////////////////////
// Gameplay Data
////////////////////////////////////////////////////////////////////////////////////////
// All data that directly relates to gameplay function/statistic tracking.
// 
//
////////////////////////////////////////////////////////////////////////////////////////\
globalvar global.bdeathscene = false;		// lets rooms know the player has died if true
globalvar global.player_nuggets = 			// total nuggets retrieved for a level are added if the player makes it to the exit
globalvar global.player_crystals = 0;		// total crytals retrieved for a level are added if the player makes it to the exit
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

// if a text sign is being displayed this is set to true, when true we don't let the player move (TODO: should pause gameplay, actually)
globalvar global.bsignopen = false;

//////////////////////////////////////////////////////////////////////////////////
// global.oplayer: persistant player object instance
//////////////////////////////////////////////////////////////////////////////////
// this helps access the player object instance in the game whenever we want to.
//////////////////////////////////////////////////////////////////////////////////
globalvar global.oplayer = instance_create(-32,-32, obj_p1);
global.oplayer.visible = false;

// DO LAST
globalvar global.globals_init = true;