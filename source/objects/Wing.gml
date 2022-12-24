#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
iframes = 0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dx = x + lengthdir_x(-image_xscale * 76, image_angle)
dy = y + lengthdir_y(-image_xscale * 76, image_angle)
sound_play("sndWhoosh")

repeat(40){
    rx = random_range(x, dx)
    ry = random_range(y, dy)
    f = instance_create(rx, ry, Feather)
    with(f){
        dir = random(361)
        image_angle = dir
        hspeed = lengthdir_x(4, dir)
        vspeed = lengthdir_y(4, dir)
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(iframes > 0){
    iframes -= 1
    image_alpha = 0.5
}else{
    image_alpha = 1
}
