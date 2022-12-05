//set_dialogue_flag(flag, save)
//sets a flag to false
//save is a bool that determines if this flag will get saved

m = global.dialogueFlags
sm = global.savedDialogueFlags
flag = argument0
save = argument1

if(flag == ""){
    exit
}

if(ds_map_exists(m, flag)){
    ds_map_replace(m, flag, false)
}else{
    ds_map_add(m, flag, false)
}

if(save){
    if(ds_map_exists(sm, flag)){
        ds_map_replace(sm, flag, false)
    }else{
        ds_map_add(sm, flag, false)
    }
}
