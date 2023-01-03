//handle hotkeys

//scale hotkey
if(keyboard_check_pressed(ord("S")) && !scalemode && !movemode && !rotatemode) {
	distxold = point_distance(mouse_x, mouse_x, x, x);
	distyold = point_distance(mouse_y, mouse_y, y, y);
	imgsxold = imgscalex;
	imgsyold = imgscaley;
	scalemode = true;
}

//move hotkey
if(keyboard_check_pressed(ord("G")) && !scalemode && !movemode && !rotatemode) {
	xold = x;
	yold = y;
	mxold = mouse_x;
	myold = mouse_y;
	movemode = true;
}

//rotate hotkey
if(keyboard_check_pressed(ord("R")) && !scalemode && !movemode && !rotatemode) {
	angleold = imgangle;
	pangleold = point_direction(x, y, mouse_x, mouse_y)
	rotatemode = true;
}

if(scalemode) {
	//set scale
	if(mouse_check_button_pressed(mb_left))
		scalemode = false;

	//cancel scale
	if(mouse_check_button_pressed(mb_right)) {
		scalemode = false;
		imgscalex = imgsxold;
		imgscaley = imgsyold;
		return;
	}
	
	//scale image based on mouse distance shit
	if(keyboard_check(vk_shift)) {
		imgscalex = point_distance(mouse_x, mouse_x, x, x) - (distxold + imgsxold) + imgsxold * 2;
		imgscaley = imgscalex;
	}
	else {
		imgscalex = point_distance(mouse_x, mouse_x, x, x) - (distxold + imgsxold) + imgsxold * 2;
		imgscaley = point_distance(mouse_y, mouse_y, y, y) - (distyold + imgsyold) + imgsyold * 2;
	}
}

if(movemode) {
	//set position
	if(mouse_check_button_pressed(mb_left))
		movemode = false;

	//cancel movemode
	if(mouse_check_button_pressed(mb_right)) {
		movemode = false;
		x = xold;
		y = yold;
		return;
	}
	
	x = mouse_x - (mxold - xold);
	y = mouse_y - (myold - yold);
}

if(rotatemode) {
	//set rotation
	if(mouse_check_button_pressed(mb_left))
		rotatemode = false;

	//cancel movemode
	if(mouse_check_button_pressed(mb_right)) {
		rotatemode = false;
		imgangle = angleold;
		return;
	}
	
	imgangle = angleold + (point_direction(x, y, mouse_x, mouse_y) - pangleold);
}