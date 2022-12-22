#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

alarm[0] = 2
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale -= 0.02
image_yscale -= 0.02

if(image_xscale <= 0.1){
    instance_destroy()
}else{
    alarm[0] = 2
}
