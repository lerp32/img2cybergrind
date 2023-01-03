// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_image(path){
	sprite_delete(obj_image.sprite)
	obj_image.sprite = sprite_add(string(path), 0, false, false, 0, 0)
	sprite_set_offset(obj_image.sprite, sprite_get_width(obj_image.sprite) / 2,  sprite_get_height(obj_image.sprite) / 2)
}