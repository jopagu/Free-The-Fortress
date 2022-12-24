#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(savedata("clear")){
    instance_destroy()
}

if(!instance_exists(Target) && vspeed == 0){
    sound_play("sndGate")
    depth = 1500
    vspeed = 2
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
