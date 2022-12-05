if (keyboard_check_pressed(vk_f3)) {
    if (instance_exists(global.profiler_manager)) {
        instance_destroy_id(global.profiler_manager)
    } else {
        instance_create(0,0,global.profiler_manager)
    }
}

if (keyboard_check_pressed(vk_backspace)) {
    global.debug_overlay=!global.debug_overlay
}

target_speed=global.game_speed
dx8_set_vsync(true)

if (keyboard_check(ord("G"))) {
    target_speed=global.game_speed/5
    dx8_set_vsync(false)
} else if (keyboard_check(ord("F"))) {
    target_speed=global.game_speed*5
    dx8_set_vsync(false)
}

if (current_speed!=target_speed) {
    current_speed=target_speed
    room_speed=target_speed
    sound_kind_pitch(0,room_speed/global.game_speed)
    sound_kind_pitch(1,room_speed/global.game_speed)
    sound_kind_pitch(3,room_speed/global.game_speed)
}

if (is_ingame()) {
    if (keyboard_check(vk_tab)) {
        move_player(mouse_x,mouse_y,0)
        show_message_right("player to cursor")
        Player.speed=0
    }

    if (keyboard_check_pressed(vk_insert)) {
        savedata_save(true,"debug save")
        show_message_right("debug save")
    }

    if (keyboard_check_pressed(vk_delete)) {
        global.debug_hitbox=!global.debug_hitbox
        if (!global.debug_hitbox) {
            with (all) {
                visible=object_get_visible(object_index)
            }
            show_message_right("hitboxes off")
        } else show_message_right("hitboxes on")
    }

    if (keyboard_check_pressed(vk_home)) {
        global.debug_god=!global.debug_god
        if (global.debug_god) show_message_right("god mode on")
        else {
            show_message_right("god mode off")
            //clear up death list
            with (Player) deathlist[0]=0
        }
    }

    if (keyboard_check_pressed(vk_end)) {
        global.debug_jump=!global.debug_jump
        if (global.debug_jump) show_message_right("infinite jump on")
        else show_message_right("infinite jump off")
    }

    if (keyboard_check_pressed(vk_pageup) && room!=room_last) {
        instance_activate_all()
        show_message_right("next room")
        warp_to(room_next(room))
    }

    if (keyboard_check_pressed(vk_pagedown) && room!=global.first_room) {
        instance_activate_all()
        show_message_right("previous room")
        warp_to(room_previous(room))
    }

    if (mouse_check_button_pressed(mb_right)) {
        func=show_menu("Debug Menu|-|Go to...|Infinite Jump|Godmode|Hitboxes|Autofire|Save Here",0)
        if (func=1) {
            s="Select room:|-"
            r=global.first_room
            do {
                s+="|"+room_get_name(r)
                r=room_next(r)
            } until (r=-1)
            goto=show_menu(s,0)
            if (goto) {
                r=global.first_room
                repeat (goto-1) r=room_next(r)
                instance_activate_all()
                warp_to(r)
            }
        }
        if (func=2) {global.debug_jump=!global.debug_jump}
        if (func=3) {global.debug_god=!global.debug_god}
        if (func=4) {
            global.debug_hitbox=!global.debug_hitbox
            if (!global.debug_hitbox) {
                with (all) visible=object_get_visible(object_index)
            }
        }
        if (func=5) {global.debug_autofire=!global.debug_autofire}
        if (func=6) {savedata_save(true,"debug")}
    }

    if (global.debug_hitbox) all.visible=1
}
