

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            sound_play_option("sndDJump")
            settings("simpleControls",!settings("simpleControls"))
        }
    }break
    case opt_text: {
        return "Simple Controls"
    }break
    case opt_value: {
        return pick(settings("simpleControls"),"Off","On")
    }break
}
