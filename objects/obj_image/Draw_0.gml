draw_set_colour(#211a19);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_colour(c_white);

if(!surface_exists(imgsurf)) imgsurf = surface_create(room_width / 32, room_height / 32);
else {
	surface_set_target(imgsurf);
	gpu_set_blendenable(false);
	draw_clear_alpha(c_white, 0);
	shader_set(shd_gamershader);
	draw_rectangle(0, 0, room_width / 32, room_height / 32, false);
	if(sprite_exists(sprite)) {
		if(exporting)
			draw_sprite_ext(sprite, 0, x / 32, y / 32, ((imgscalex / 32) / sprite_get_width(sprite)) * -1, (imgscaley / 32) / sprite_get_height(sprite), imgangle + 90, c_white, 1);
		else
			draw_sprite_ext(sprite, 0, x / 32, y / 32, (imgscalex / 32) / sprite_get_width(sprite), (imgscaley / 32) / sprite_get_height(sprite), imgangle, c_white, 1);
	}
	shader_reset();
	gpu_set_blendenable(true);
	surface_reset_target();
	
	//buffer stuff
	surfbuffer = buffer_create((surface_get_width(imgsurf) * surface_get_height(imgsurf)) * 4, buffer_grow, 1);
	buffer_get_surface(surfbuffer, imgsurf, 0);
	for (var _x = 0; _x < surface_get_width(imgsurf); _x++) {
	    for(var _y = 0; _y < surface_get_height(imgsurf); _y++) {
	        var offset = (_x + (_y * surface_get_width(imgsurf)))*4
			var r = buffer_peek(surfbuffer, offset, buffer_u8);
			var g = buffer_peek(surfbuffer, offset + 1, buffer_u8);
			var b = buffer_peek(surfbuffer, offset + 2, buffer_u8);
			
			pixel[_x][_y] = [r, g, b];
	    }
	}
	buffer_delete(surfbuffer);
}