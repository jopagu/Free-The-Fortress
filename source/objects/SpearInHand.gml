#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


baseX = 0
baseY = 0

with(Player){
    other.image_xscale = image_xscale
    other.baseX = x - (5 * image_xscale) + (2 * input_h)
    other.baseY = y - 1

}

x = baseX
y = baseY

change_skin(skin_noarm)

throwing = false
force = 0
dir = 0
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
    other.baseX = x - (5 * image_xscale) + (2 * input_h)
    other.baseY = y - 1
}

x = baseX
y = baseY


if(!throwing && global.key_pressed[key_X]){
    throwing = true
    image_yscale = -1
}

if(throwing && global.key_released[key_X]){
    throwing = false
    image_yscale = 1
    image_angle = 0
    dir = 0
    force = 0
    x = baseX
    y = baseY
}

if(throwing && global.key[key_up] && dir <= 45){
    dir += 2
}

if(throwing && global.key[key_down] && dir >= -45){
    dir -= 2
}

image_angle = dir * image_xscale

if(throwing && global.key[key_shoot]){
    if(force <= 10){
        force += 0.1
    }
    dx = -image_xscale * lengthdir_x(force, image_angle)
    dy = -image_xscale * lengthdir_y(force, image_angle)
    x += dx
    y += dy
}

if(throwing && global.key_released[key_shoot]){
    throwing = false
    image_yscale = 1
    image_angle = 0
    dir = 0
    force = 0
    x = baseX
    y = baseY
}
