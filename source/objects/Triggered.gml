#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeatable = false
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field repeatable : bool
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<gizmos;i+=1)
    with (gizmolist[i])
        if (instance_place(x,y,other.id))
            event_trigger(ev_traptriggered)

if(!repeatable){
    instance_destroy()
}
