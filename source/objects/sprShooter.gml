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
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

hspeed = -sign(hspeed) * floor(random_range(1, 3))
vspeed = -sign(vspeed) * floor(random_range(1, 2))

alarm[0] = floor(random_range(25, 150))
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
while((instance_place(x, y, Block) || instance_place(x, y, Bound)) && alarm[0] > 1){
    x += -sign(hspeed)
    y += -sign(vspeed)
    hspeed = -hspeed
    vspeed = -vspeed
    alarm[0] = 1
}
