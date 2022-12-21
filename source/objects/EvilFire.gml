#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed = 1/10
wingL = instance_create( bbox_left - 16, y, Wing)
wingR = instance_create(bbox_right + 16, y, Wing)
with(wingR){
    image_xscale = -1
}

t = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t += 1


with(wingL){
    x = other.bbox_left - 16
    y = other.y

    image_angle = 45 * sin(other.t / 50)
}

with(wingR){
    x = other.bbox_right + 16
    y = other.y

    image_angle = -45 * sin(other.t / 50)
}
