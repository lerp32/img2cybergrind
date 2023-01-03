if(ds_map_find_value(async_load,"event_type") == "file_drop") {
	var path = ds_map_find_value(async_load,"filename");
	load_image(path)
}