shader_type canvas_item;

uniform float anchoLinea : hint_range(0.0,30.0);
uniform vec4 color_outline : hint_color;

void fragment(){
	
	float tamanio= anchoLinea * 1.0 / float (textureSize(TEXTURE,0).x);
	
	vec4 colortex=texture(TEXTURE,UV);
	float alfa=-8.0*colortex.a;
	
	for (int i=0;i<2;i++){
		alfa+=texture(TEXTURE,UV+ vec2(tamanio,0.0)).a;
		alfa+=texture(TEXTURE,UV+ vec2(-tamanio,0.0)).a;
		alfa+=texture(TEXTURE,UV+ vec2(0.0,tamanio)).a;
		alfa+=texture(TEXTURE,UV+ vec2(0.0,-tamanio)).a;
	}
	
	vec4 color_final=mix(colortex,color_outline,clamp(alfa,0.0,1.0));
	COLOR=vec4(color_final.rgb,clamp(abs(alfa)+colortex.a,0.0,1.0));
}
