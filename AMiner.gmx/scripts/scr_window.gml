/// Draw a sprite-composed Window - Call from Draw Event ONLY

/*
	tile image index for spr_win:
	
	 top left 	- 0	
	 top mid 	- 1
	 top right 	- 2	 
	 bot left	- 3
	 bot mid 	- 4
	 bot right	- 5	 
	 mid mid	- 6
*/

tile_size = 16;
ind = 0;
win_x = argument[0];
win_y = argument[1];
win_w = (argument[2] / tile_size) * tile_size; 
win_h = (argument[3] / tile_size) * tile_size;
win_h = win_h < tile_size ? tile_size : win_h;
wtot = win_w / tile_size;
htot = win_h / tile_size;
hcnt = 0;
draw_sprite(spr_win, 0, win_x, win_y);
ind = 1;
for(x = 1; x < wtot - 1; ++x)
	draw_sprite(spr_win, ind, win_x + (x*tile_size), win_y);
draw_sprite(spr_win, 2, win_x + tile_size * (wtot-1), win_y);
hcnt=1;

draw_sprite(spr_win, 0, win_x, win_y + (hcnt*tile_size));
ind = 1;
for(x = 1; x < wtot - 1; ++x)
	draw_sprite(spr_win, ind, win_x + (x*tile_size), win_y);
draw_sprite(spr_win, 2, win_x + tile_size * (wtot-1), win_y);