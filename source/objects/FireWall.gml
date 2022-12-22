#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
t = 0
alarm[0] = 20
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_index += 1

if(image_index < 3){
    alarm[0] = 20
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

t += 1

if(image_index >= 3){
    image_index = 3 + ((t/20) mod 2)
}


/*
if(image_index == 4 && t == 20){
    image_index = 5
    t = 0
}else if(image_index == 5 && t == 20){
    image_index = 4
    t = 0
}
*/
