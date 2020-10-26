shader_type canvas_item;

uniform vec2 dire=vec2(0.0,0.0);
uniform float vel=1;

void fragment(){
	vec2 uv=vec2(1,1);//dirección de la flecha y cantidad de flechas en eje Y
	vec2 movimiento=UV*(uv)+dire*TIME*vel;//movimiento y dirección de movimiento de las flechas
	COLOR=texture(TEXTURE,movimiento);
	  
}