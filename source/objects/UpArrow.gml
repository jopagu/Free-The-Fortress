#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 1/5
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(!instance_exists(Player)){
    instance_destroy()
}else{
    x = Player.x - 4
    y = Player.y - 32
}
