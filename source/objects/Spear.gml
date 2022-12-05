#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir = 0
force = 0
moving = true
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


if(!moving) exit

image_angle = dir * image_xscale

x += image_xscale * lengthdir_x(force, image_angle)
y += image_xscale * lengthdir_y(force, image_angle)

b = instance_place(x, y, Block)
if(b){
    moving = false
    alarm[0] = 200
    mask_index = sprSpear
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
