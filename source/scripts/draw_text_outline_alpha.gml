//draw_text_outline_alpha(dx, dy, msg, col, alpha)

var dx,dy,msg,col, alpha;

dx=argument0
dy=argument1
msg=argument2
col=argument3
alpha=argument4


draw_set_color(0)
draw_set_alpha(alpha)
draw_text(dx-1,dy,msg)
draw_text(dx+1,dy,msg)
draw_text(dx,dy-1,msg)
draw_text(dx,dy+1,msg)
draw_set_color(col)
draw_text(dx,dy,msg)
draw_set_color($ffffff)
draw_set_alpha(1)
