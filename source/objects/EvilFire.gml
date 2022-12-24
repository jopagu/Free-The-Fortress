#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
active = false
visible = false
shielded = true
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(image_index < 3){
    image_index += 1
    alarm[0] = 15
}else{
    image_index = 3
    wingL = instance_create( bbox_left - 16, y, Wing)
    wingR = instance_create(bbox_right + 16, y, Wing)
    shield = instance_create(x, y, Shield)
    with(shield){
        visible =  false
    }
    with(wingR){
        image_xscale = -1
    }

    t = 0
    active = true
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!active) exit

t += 1

image_index = 3 + (floor(t/15) mod 4)

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

d = direction_to_object(Player)
if(d < 80 || d > 280){
    image_xscale = -1
}else if(d >= 100 && d <= 260){
    image_xscale = 1
}
#define Collision_Spear
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(visible && shielded){
    sound_play("sndTing")
    with(shield){
        visible = true
        alarm[0] = 30
    }
    with(other){
        instance_destroy()
    }
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible = true
alarm[0] = 15
sound_play("sndTear")
