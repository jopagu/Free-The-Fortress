#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Make sure BoxYPosition is set to "OnObject"
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

moving = false
counter = 0

event_inherited()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

//Increment/decrement the counter based on if the box is moving up/down
if(moving){
    if(vspeed > 0){
        counter += 1
    }else{
        counter -= 1
    }
}

//Switch direction after the counter reaches a certain point.
if (counter > 30){
    vspeed = -1
}else if (counter < -30){
    vspeed = 1
}

event_inherited()
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

vspeed = -1
moving = true

event_inherited()
