#define Collision_Spear
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
yes =false
with(other){
    other.yes = moving
}
if (yes){
    instance_destroy()
    sound_play(global.break_sfx)
}
