for(var _x = 0; _x < 16; _x++) {
	for(var _y = 0; _y < 16; _y++) {
		draw_sprite_ext(spr_gridspace, 0, (_x * 32) + 224, (_y * 32) + 32, 1, 1, 0, make_color_rgb(obj_image.pixel[_x + 7][_y + 1][0], obj_image.pixel[_x + 7][_y + 1][1], obj_image.pixel[_x + 7][_y + 1][2]), 1);
		draw_set_halign(fa_middle)
		draw_set_valign(fa_center)
		draw_text(((_x * 32) + 224) + 16, ((_y * 32) + 32) + 16, round(obj_image.pixel[_x + 7][_y + 1][0] / 2.55) - 50)
	}
}
with(obj_image) {
	if(sprite_exists(sprite))
		draw_sprite_ext(sprite, 0, x, y, imgscalex / sprite_get_width(sprite), imgscaley / sprite_get_height(sprite), imgangle, c_white, .35);
}
draw_surface_stretched(obj_image.imgsurf, 2, 2, surface_get_width(obj_image.imgsurf) * 2, surface_get_height(obj_image.imgsurf) * 2)