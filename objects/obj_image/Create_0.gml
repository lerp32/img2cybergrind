sprite = spr_testspr;
imgscalex = 512;
imgscaley = 512;
imgangle = 0;

//old image x and y
xold = x;
yold = y;

//old image x scale and y scale
imgsxold = imgscalex;
imgsyold = imgscaley;

//old mouse x and y
mxold = mouse_x;
myold = mouse_y;

//old distance to mouse cursor
distxold = point_distance(mouse_x, mouse_x, x, x);
distyold = point_distance(mouse_y, mouse_y, y, y);

//old angle and old rotated angle
angleold = imgangle;
pangleold = point_direction(x, y, mouse_x, mouse_y);

//movemode, rotatemode and scalemode variables
movemode = false;
rotatemode = false;
scalemode = false;

//image surface stuff
imgsurf = surface_create(room_width / 32, room_height / 32);
surfbuffer = buffer_create((surface_get_width(imgsurf) * surface_get_height(imgsurf)) * 4, buffer_fixed, 1);
pixel[0] = [0];
exporting = false;