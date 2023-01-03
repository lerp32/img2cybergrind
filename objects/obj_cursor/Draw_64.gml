if(obj_image.scalemode) {
	draw_line(mouse_x, mouse_y, obj_image.x, obj_image.y)
	curangle = point_direction(mouse_x, mouse_y, obj_image.x, obj_image.y)
	draw_sprite_ext(spr_cursors, 0, mouse_x, mouse_y, 1, 1, curangle, c_white, 1)
	window_set_cursor(cr_none)
}
else if(obj_image.movemode) {
	draw_sprite(spr_cursors, 1, mouse_x, mouse_y)
	window_set_cursor(cr_none)
}
else if(obj_image.rotatemode) {
	draw_line(mouse_x, mouse_y, obj_image.x, obj_image.y)
	curangle = point_direction(mouse_x, mouse_y, obj_image.x, obj_image.y)
	draw_sprite_ext(spr_cursors, 0, mouse_x, mouse_y, 1, 1, curangle + 90, c_white, 1)
	window_set_cursor(cr_none)
}
else
	window_set_cursor(cr_default)