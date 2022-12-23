#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 1/20

hspeed = floor(random_range(1, 3))
vspeed = floor(random_range(1, 2))

alarm[0] = floor(random_range(25, 150))
alarm[1] = floor(random_range(20, 40))

flip = false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

hspeed = -sign(hspeed) * floor(random_range(1, 3))
vspeed = -sign(vspeed) * floor(random_range(1, 2))

alarm[0] = floor(random_range(25, 150))
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndSpit")
shot = instance_create(x, y, Shot)
with(shot){
    dir = direction_to_object(Player)
    image_angle = dir
    hspeed = lengthdir_x(4, dir)
    vspeed = lengthdir_y(4, dir)
}


alarm[1] = floor(random_range(40, 70))
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
while((instance_place(x, y, Block) || instance_place(x, y, Bound)) && alarm[0] > 1){
    x += -sign(hspeed)
    y += -sign(vspeed)
    flip = true
}
if(flip){
    flip = false
    hspeed = -hspeed
    vspeed = -vspeed
}
#define Collision_Spear
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(other.moving){
    sound_play("sndBossHit")
    instance_destroy()
}
