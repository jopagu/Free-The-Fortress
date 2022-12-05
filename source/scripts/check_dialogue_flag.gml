//set_dialogue_flag(flag)
//returns the value of a flag

m = global.dialogueFlags
flag = argument0

if(flag == ""){
    exit
}

if(ds_map_exists(m, flag)){
    v = ds_map_find_value(m, flag)
}else{
    v = false
}

return v
