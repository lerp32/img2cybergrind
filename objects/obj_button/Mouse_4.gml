if(image_index == 0) {
	var path = get_open_filename_ext("Image (*.png, *.jpg, etc.)", "", working_directory, "Import image:");
	
	if(path != "") {
		load_image(path);
	}
}
if(image_index == 1) {
	with(obj_image) {
		exporting = true;
		alarm[1] = 1;
	}
}