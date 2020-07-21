// 320 / 16 = 20
// 240 / 16 = 15 

tile_size = 16;

tile_black_X = 16 * 2;
tile_black_Y = 16 * 2;

for(yy = 0; yy < 15; ++yy)
	for(xx = 0; xx < 20; ++xx)	
	{
		room_tile_add(rm_mine, bkg_tileset0, tile_black_X, tile_black_Y, tile_size, tile_size, xx, yy, 10);
		i = instance_create(xx*16, yy*16, obj_p1);
	}