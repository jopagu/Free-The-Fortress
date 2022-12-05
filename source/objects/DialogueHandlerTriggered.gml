#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
okay = true

for (i = 0; i < ds_list_size(requiredFlags); i +=1 ){
    if(!check_dialogue_flag(ds_list_find_value(requiredFlags, i))){
        okay = false
    }
}

for (i = 0; i < ds_list_size(requiredFalseFlags); i +=1 ){
    if(check_dialogue_flag(ds_list_find_value(requiredFalseFlags, i))){
        okay = false
    }
}

if(okay){
    messageIndex = 0;
}
