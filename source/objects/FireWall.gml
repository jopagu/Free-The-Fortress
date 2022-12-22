#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
t = 0
visible = false
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
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(visible){
    kill_player()
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0] = 20
visible = true
