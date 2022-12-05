//draw_polygon(points, fillColor, fillAlpha, borderColor, borderAlpha, borderThickness, borderOnly)
//points is the id of a list of two element lists [x, y]
//borderOnly is a boolean, if true it won't fill the polygon

//ahhh this is broken don't use it

points = argument0
fillColor = argument1
fillAlpha = argument2
borderColor = argument3
borderAlpha = argument4
borderThickness = argument5
borderOnly = argument6

length = ds_list_size(points)

//calculate center
sum_x = 0
sum_y = 0
for(i = 0; i < length; i += 1){
    p = ds_list_find_value(points, i)
    p_x = ds_list_find_value(p, 0)
    p_y = ds_list_find_value(p, 1)
    sum_x += p_x
    sum_y += p_y
}
avg_x = round(sum_x / length)
avg_y = round(sum_y / length)
center[0] = avg_x
center[1] = avg_y




//draw border

draw_set_color(borderColor)
draw_set_alpha(borderAlpha)

for(i = 0; i < length; i += 1){
    if( i == length - 1){
        p1 = ds_list_find_value(points, i)
        p2 = ds_list_find_value(points, 0)
        p1_x = ds_list_find_value(p1, 0)
        p1_y = ds_list_find_value(p1, 1)
        p2_x = ds_list_find_value(p2, 0)
        p2_y = ds_list_find_value(p2, 1)
    }else{
        p1 = ds_list_find_value(points, i)
        p2 = ds_list_find_value(points, i + 1)
        p1_x = ds_list_find_value(p1, 0)
        p1_y = ds_list_find_value(p1, 1)
        p2_x = ds_list_find_value(p2, 0)
        p2_y = ds_list_find_value(p2, 1)
    }

    draw_line(p1_x, p1_y, p2_x, p2_y)

    dx = p2_x - p1_x
    dy = p2_y - p1_y

    vertical = false
    if(dy > dx){
        vertical = true
    }

    for(j = 2; j < borderThickness; j+= 1){
        if(vertical){
            p1_x += 1
            p2_x += 1
        }else{
            p1_y += 1
            p2_y += 1
        }
        draw_line(p1_x, p1_y, p2_x, p2_y)
    }
}


/*
for(i = 0; i < borderThickness; i += 1){

    //nudge points
    if(i != 0){
        for(j = 0; j < length; j += 1){
            p = ds_list_find_value(points, i)
            p_x = ds_list_find_value(p, 0)
            p_y = ds_list_find_value(p, 1)

            v_x = center[0] - p_x
            v_y = center[1] - p_y

            nudge_x = round(clamp(v_x, -1, 1))
            nudge_y = round(clamp(v_y, -1, 1))

            n_x = p_x + nudge_x
            n_y = p_y + nudge_y

            ds_list_replace(p, 0, n_x)
            ds_list_replace(p, 1, n_y)

        }
    }

    //Draw lines
    draw_set_color(borderColor)
    draw_set_alpha(borderAlpha)



}

*/

//draw fill
if( !borderOnly){

}

draw_set_alpha(1)

for(i = 0; i < length; i += 1){
    p = ds_list_find_value(points, i)
    ds_list_destroy(p)
}

ds_list_destroy(points)
