#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed = 1/15

spd = 3
rspd = 2

dir = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

dir = inch_angle(dir, direction_to_object(Player), rspd)
image_angle = dir

x += lengthdir_x(spd, dir)
y += lengthdir_y(spd, dir)
#define Collision_Spear
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!other.moving){
    exit
}


sound_play("sndBossHit")
instance_destroy()
