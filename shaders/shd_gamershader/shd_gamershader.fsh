//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	float newcol = (floor((((col.r + col.g + col.b) / 3.0) * 255.0) / 2.55) * 2.55) / 255.0;
    gl_FragColor = vec4(newcol, newcol, newcol, col.a);
}
