#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir = 0
force = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_angle = dir * image_xscale

x += image_xscale * lengthdir_x(force, image_angle)
y += image_xscale * lengthdir_y(force, image_angle)
