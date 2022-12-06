#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir = 0
force = 0
moving = true

grav = 0.2

init = false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_alpha -= 0.05

if(image_alpha <= 0){
    instance_destroy()
}
alarm[0] = 5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!init){
    init = true
    hspeed = image_xscale * lengthdir_x(force, image_angle)
    vspeed = image_xscale * lengthdir_y(force, image_angle)

    image_angle = dir * image_xscale
}

if(!moving) exit



if(vspeed <= 10){
    vspeed += grav
}

image_xscale = 1
image_angle = point_direction(x, y, x + hspeed, y + vspeed)

if(image_angle > 90 && image_angle < 270){
    image_yscale = -1
}


b = instance_place(x, y, Block)
if(b){
    moving = false
    alarm[0] = 200
    mask_index = sprSpear
    hspeed = 0
    vspeed = 0
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
