#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

with(Player){
    other.image_xscale = image_xscale
    other.x = x - (5 * image_xscale) + (2 * input_h)
    other.y = y - 1

}

change_skin(skin_noarm)

throwing = false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(Player.dead){
    instance_destroy()
}

with(Player){
    other.image_xscale = image_xscale
    other.x = x - (5 * image_xscale) + (2 * input_h)
    other.y = y - 1

}

if(!throwing && global.key_pressed[key_X]){
    throwing = true
    image_yscale = -1
    show_debug_message("press")
}

if(throwing && global.key_released[key_X]){
    throwing = false
    image_yscale = 1
    image_angle = 0
    show_debug_message("release")
}

if(throwing && global.key[key_up] && image_angle <= 45){
    image_angle += 2
}

if(throwing && global.key[key_down] && image_angle >= -45){
    image_angle -= 2
}
