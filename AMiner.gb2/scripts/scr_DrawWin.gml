/// DrawWin(sprite,tile_size,x,y,width,height)
{
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

drawwin_TLEFT 	= 0;
drawwin_TMID 	= 1;
drawwin_TRIGHT 	= 2;
drawwin_BLEFT 	= 3;
drawwin_BMID 	= 4;
drawwin_BRIGHT 	= 5;
drawwin_MLEFT 	= 6;
drawwin_MMID 	= 7;
drawwin_MRIGHT 	= 8;
drawwin_ROWLEFT = 9;
drawwin_ROWMID  = 10;
drawwin_ROWRIGHT = 11;
drawwin_COLTOP = 12;
drawwin_COLMID = 13;
drawwin_COLBOT = 14;
drawwin_SINGLE = 15;

drawwin_sprspr = argument0;
drawwin_tile_size = argument1;
drawwin_win_x = argument2;
drawwin_win_y = argument3;
drawwin_win_w = argument4;	// in tiles
drawwin_win_h = argument5;	// in tiles

draw_set_color(self.image_blend);

for(j = 0; j < drawwin_win_h; ++j)
{
	for(i = 0; i < drawwin_win_w; ++i)
	{
	
		// SINGLE COLUMN 
		if((drawwin_win_w==1)&&(drawwin_win_h>1))
		{
			switch(j)
			{
				case 0:
					draw_sprite_ext(drawwin_sprspr, drawwin_COLTOP, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
					break;
				case drawwin_win_h-1:
					draw_sprite_ext(drawwin_sprspr, drawwin_COLBOT, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
					break;
				default:
					draw_sprite_ext(drawwin_sprspr, drawwin_COLMID, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
			}
			continue;
		}
		
		// SINGLE ROW 
		if((drawwin_win_h==1)&&(drawwin_win_w>1))
		{
			switch(i)
			{
				case 0:
					draw_sprite_ext(drawwin_sprspr, drawwin_ROWLEFT, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
					break;
				case drawwin_win_w-1:
						draw_sprite_ext(drawwin_sprspr, drawwin_ROWRIGHT, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
					break;
				default:
					draw_sprite_ext(drawwin_sprspr, drawwin_ROWMID, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
			}
			continue;		
		}
		
		// SINGLE TILE 
		if(drawwin_win_w==1&&drawwin_win_h==1)
		{
			draw_sprite_ext(drawwin_sprspr, drawwin_SINGLE, drawwin_win_x, drawwin_win_y, 1, 1, 0, self.image_blend, 1);
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
						draw_sprite_ext(drawwin_sprspr, drawwin_TLEFT, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
						break;
					case drawwin_win_w-1:	// e_tile.TRIGHT					
						draw_sprite_ext(drawwin_sprspr, drawwin_TRIGHT, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
						break;
					default:		// e_tile.TMID
						draw_sprite_ext(drawwin_sprspr, drawwin_TMID, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
				}
				break;	

			/// ROW LAST ///
			case (drawwin_win_h - 1):
				switch(i)	// depending on column, draw window sprite tiles
				{
					case 0:			// e_tile.BLEFT
						draw_sprite_ext(drawwin_sprspr, drawwin_BLEFT, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
						break;
					case drawwin_win_w-1:	// e_tile.BRIGHT
						draw_sprite_ext(drawwin_sprspr, drawwin_BRIGHT, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
						break;
					default:		// e_tile.BMID
						draw_sprite_ext(drawwin_sprspr, drawwin_BMID, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
				}			
				break;

			/// ROW MID ///
			default:
				switch(i)	// depending on column, draw window sprite tiles
				{
					case 0:			// e_tile.MLEFT
						draw_sprite_ext(drawwin_sprspr, drawwin_MLEFT, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
						break;
					case drawwin_win_w-1:	// e_tile.MRIGHT
						draw_sprite_ext(drawwin_sprspr, drawwin_MRIGHT, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
						break;
					default:		// e_tile.MMID				
						draw_sprite_ext(drawwin_sprspr, drawwin_MMID, drawwin_win_x+(i*drawwin_tile_size), drawwin_win_y+(j*drawwin_tile_size), 1, 1, 0, self.image_blend, 1);
				}
		}
	}
}

}