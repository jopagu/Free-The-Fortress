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
force = 3
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


if(global.key_pressed[key_X]){
    if(throwing){
        image_yscale = 1
        sprite_index = sprSpearHand
        dir = 0
        force = 3
        x = baseX
        y = baseY
    }else{
        image_yscale = -1
        sprite_index = sprSpearHandFlip
    }
    throwing = !throwing
}


if(throwing && global.key[key_up] && dir <= 70){
    dir += 2
}

if(throwing && global.key[key_down] && dir >= -45){
    dir -= 2
}

image_angle = dir * image_xscale

if(throwing && global.key[key_shoot]){
    if(force <= 10){
        force += 0.2
    }
    dx = -image_xscale * lengthdir_x(force - 3, image_angle)
    dy = -image_xscale * lengthdir_y(force - 3, image_angle)
    x += dx
    y += dy
}


if(throwing && global.key_released[key_shoot]){
    spear = instance_create(x + (7 * image_xscale), y + (6 * image_yscale), Spear)
    with(spear){
        dir = other.dir
        image_xscale = other.image_xscale
        image_angle = dir * image_xscale
        force = other.force
    }
    throwing = false
    image_yscale = 1
    sprite_index = sprSpearHand
    image_angle = 0
    dir = 0
    force = 3
    x = baseX
    y = baseY
}
