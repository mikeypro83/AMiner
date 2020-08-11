/// DrawWin(sprite,tile_size,x,y,width,height)
/*
	DrawWin(sprite,tile_size,x,y,width,height)
	sprite 			= sprite that contains tiles to make window. 
					see further comments for subimage numbers.
	tile_size 		= size in pixels of tile, 16x16 = 16, 32x32 = 32, etc..
	x,y 			= pixel x and y position to begin drawing at.
	width, height 	= width and height of window in number of tiles.
	
	
	set the tile numbers to whatever your sprite tiles are for the corresponding tiles.
	
	tile image index for sprite:
	
	 top left 	- 0	
	 top mid 	- 1
	 top right 	- 2	 
	 bot left	- 3
	 bot mid 	- 4
	 bot right	- 5	 
	 left mid	- 6
	 mid mid    - 7
	 mid right  - 8
	 1.row left - 9
	 1.row mid  - 10
	 1.row right- 11
	 1.col left - 12
	 1.col mid  - 13
	 1.col right- 14
	 single tile- 15
*/

TLEFT 	= 0;
TMID 	= 1;
TRIGHT 	= 2;
BLEFT 	= 3;
BMID 	= 4;
BRIGHT 	= 5;
MLEFT 	= 6;
MMID 	= 7;
MRIGHT 	= 8;
ROWLEFT = 9;
ROWMID  = 10;
ROWRIGHT = 11;
COLTOP = 12;
COLMID = 13;
COLBOT = 14;
SINGLE = 15;

sprspr = argument0;
tile_size = argument1;
win_x = argument2;
win_y = argument3;
win_w = argument4;	// in tiles
win_h = argument5;	// in tiles

for(j = 0; j < win_h; ++j)
{
	for(i = 0; i < win_w; ++i)
	{
	
		// SINGLE COLUMN 
		if((win_w==1)&&(win_h>1))
		{
			switch(j)
			{
				case 0:
					draw_sprite(sprspr, COLTOP, win_x+(i*tile_size), win_y+(j*tile_size));
					break;
				case win_h-1:
					draw_sprite(sprspr, COLBOT, win_x+(i*tile_size), win_y+(j*tile_size));
					break;
				default:
					draw_sprite(sprspr, COLMID, win_x+(i*tile_size), win_y+(j*tile_size));
			}
			continue;
		}
		
		// SINGLE ROW 
		if((win_h==1)&&(win_w>1))
		{
			switch(i)
			{
				case 0:
					draw_sprite(sprspr, ROWLEFT, win_x+(i*tile_size), win_y+(j*tile_size));
					break;
				case win_h-1:
						draw_sprite(sprspr, ROWRIGHT, win_x+(i*tile_size), win_y+(j*tile_size));
					break;
				default:
					draw_sprite(sprspr, ROWMID, win_x+(i*tile_size), win_y+(j*tile_size));
			}
			continue;		
		}
		
		// SINGLE TILE 
		if(win_w==1&&win_h==1)
		{
			draw_sprite(sprspr, SINGLE, win_x,win_y);
			continue;
		}
			
		// MULTI-ROW & MULTI-COL 
		switch(j) // depending on row, draw window sprite tiles
		{
			/// ROW 0 ///
			case 0:
				switch(i)	// depending on column, draw window sprite tiles
				{
					case 0:			// e_tile.TLEFT
						draw_sprite(sprspr, TLEFT, win_x+(i*tile_size), win_y+(j*tile_size));
						break;
					case win_w-1:	// e_tile.TRIGHT					
						draw_sprite(sprspr, TRIGHT, win_x+(i*tile_size), win_y+(j*tile_size));
						break;
					default:		// e_tile.TMID
						draw_sprite(sprspr, TMID, win_x+(i*tile_size), win_y+(j*tile_size));
				}
				break;	

			/// ROW LAST ///
			case (win_h - 1):
				switch(i)	// depending on column, draw window sprite tiles
				{
					case 0:			// e_tile.BLEFT
						draw_sprite(sprspr, BLEFT, win_x+(i*tile_size), win_y+(j*tile_size));
						break;
					case win_w-1:	// e_tile.BRIGHT
						draw_sprite(sprspr, BRIGHT, win_x+(i*tile_size), win_y+(j*tile_size));
						break;
					default:		// e_tile.BMID
						draw_sprite(sprspr, BMID, win_x+(i*tile_size), win_y+(j*tile_size));
				}			
				break;

			/// ROW MID ///
			default:
				switch(i)	// depending on column, draw window sprite tiles
				{
					case 0:			// e_tile.MLEFT
						draw_sprite(sprspr, MLEFT, win_x+(i*tile_size), win_y+(j*tile_size));
						break;
					case win_w-1:	// e_tile.MRIGHT
						draw_sprite(sprspr, MRIGHT, win_x+(i*tile_size), win_y+(j*tile_size));
						break;
					default:		// e_tile.MMID				
						draw_sprite(sprspr, MMID, win_x+(i*tile_size), win_y+(j*tile_size));
				}
		}
	}
}