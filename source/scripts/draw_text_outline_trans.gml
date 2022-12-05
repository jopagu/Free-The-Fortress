//draw_text_outline_alpha(dx, dy, msg, col, scale)
var dx,dy,msg,col, scale;

dx=argument0
dy=argument1
msg=argument2
col=argument3
scale=argument4

draw_set_color(0)
draw_text_transformed(dx-1,dy,msg,scale,scale,0)
draw_text_transformed(dx+1,dy,msg,scale,scale,0)
draw_text_transformed(dx,dy-1,msg,scale,scale,0)
draw_text_transformed(dx,dy+1,msg,scale,scale,0)
draw_set_color(col)
draw_text_transformed(dx,dy,msg,scale,scale,0)
draw_set_color($ffffff)
