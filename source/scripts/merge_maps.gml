//merge_maps(m1, m2)
//merges m2 into m1. Keys already present in m1 won't be copied from m2.


m1 = argument0
m2 = argument1

if(!ds_map_empty(m2)){
    key = ds_map_find_first(m2)
    value = ds_map_find_value(m2, key)
    if(!ds_map_exists(m1, key)){
        ds_map_add(m1, key, value)
    }

    for(j = 1; j < ds_map_size(m2); j += 1){

        key = ds_map_find_next(m2, key)
        value = ds_map_find_value(m2, key)
        if(!ds_map_exists(m1, key)){
            ds_map_add(m1, key, value)
        }
    }
}
