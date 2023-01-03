// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function export_to_cgp(){
	//path and file name
	var fname = string(current_hour) + "_" + string(current_minute) + " - " + string(current_day) + "_" + string(current_month) + "_" + string(current_year) + ".cgp";
	var path = get_save_filename_ext("File (*.cgp)", fname, working_directory, "Export your pattern:");
	
	if(path != "") {
		//final combined
		var data = "";
	
		//pattern
		var padata = "";
		for(var c = 0; c < 16; c++) {
			for(var r = 0; r < 16; r++) {
				if(r = 0 && c > 0) {
					if(string_length(string(round(obj_image.pixel[c + 7][r + 1][0] / 2.55) - 50)) > 1)
						padata += "\n(" + string(round(obj_image.pixel[c + 7][r + 1][0] / 2.55) - 50) + ")";
					else
						padata += "\n" + string(round(obj_image.pixel[c + 7][r + 1][0] / 2.55) - 50);
				}
				else {
					if(string_length(string(round(obj_image.pixel[c + 7][r + 1][0] / 2.55) - 50)) > 1)
						padata += "(" + string(round(obj_image.pixel[c + 7][r + 1][0] / 2.55) - 50) + ")";
					else
						padata += string(round(obj_image.pixel[c + 7][r + 1][0] / 2.55) - 50);
				}
			}
		}
		data += padata;
	
	
		//prefab
		var prdata = "\n";
		for(var c = 0; c < 16; c++) {
			for(var r = 0; r < 16; r++) {
				if(r = 0) {
					if(string_length(string(0)) > 1)
						prdata += "\n(" + string(0) + ")";
					else
						prdata += "\n" + string(0);
				}
				else {
					if(string_length(string(0)) > 1)
						prdata += "(" + string(0) + ")";
					else
						prdata += string(0);
				}
			}
		}
		data += prdata;
	
	
		//save
		var databuffer = buffer_create(string_byte_length(data) + 1, buffer_fixed, 1);
		buffer_write(databuffer, buffer_string, data);
		buffer_save(databuffer, path);
		buffer_delete(databuffer);
		
		obj_image.alarm[0] = 1;
	}
	else {
		obj_image.exporting = false;
		return;
	}
}