#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

messages = ds_list_create()

messageIndex = -1
totalMessages = 0

instructionMode = global.defaultDialogueInstructionMode

startSound = global.defaultDialogueStartSound
endSound = global.defaultDialogueEndSound

skippable = global.defaultDialogueSkippable

startTrigger = global.defaultDialogueStartTrigger
endTrigger = global.defaultDialogueEndTrigger

startSoundPlayed = false
startTriggerActivated = false

freezeTime = global.defaultDialogueFreezeTime
freezer = noone

initialized = false
okay = true

requiredFlags = ds_list_create()
requiredFalseFlags = ds_list_create()

flagSet = ""
flagUnset = ""
saveFlagSet = false
saveFlagUnset = false

movePlayerX = global.defaultDialogueMovePlayerX
movePlayerY = global.defaultDialogueMovePlayerY

startMusic = global.defaultDialogueStartMusic
endMusic = global.defaultDialogueEndMusic
loopStartMusic = global.defaultDialogueLoopStartMusic
loopEndMusic = global.defaultDialogueLoopEndMusic
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

event_user(0)

//free memory
for(i = 0; i < totalMessages; i += 1){
    m = ds_list_find_value(messages, i)
    ds_map_destroy(m)
}

ds_list_destroy(messages)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//progress dialogue
if (global.key_pressed[key_shoot] && messageIndex >= 0 && messageIndex <= totalMessages) {
    //play transitionSound
    if(sound != "no_sound" && messageIndex != totalMessages -1){
        sound_play(sound)
    }
    //activate transitionTrigger
    if(trigger != noone){
        instance_create(0, 0, trigger)
        with(trigger){
            event_user(0)
        }
    }

    if(messageIndex != -1){
        messageIndex += 1;
    }
    if (messageIndex == totalMessages){
        event_user(0)
    }
}

//skip dialogue
if (global.key_pressed[key_skip] && skippable && messageIndex >= 0){
    event_user(0)
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

initialized = false
messageIndex = -1

//play endSound
if(endSound != "no_sound"){
    sound_play(endSound)
}

//activate endTrigger
if(endTrigger != noone){
    instance_create(0, 0, endTrigger)
    with(endTrigger){
        event_user(0)
    }
}

//return control of player
frozen=false

//unfreeze time
with(freezer){
    instance_destroy()
}

//play end music
if(endMusic != ""){
    play_bg_music(endMusic, loopEndMusic)
}

//set flags
set_dialogue_flag(flagSet, saveFlagSet)
unset_dialogue_flag(flagUnset, saveFlagUnset)

//move player
with(Player){
    move_player(x + other.movePlayerX, y + other.movePlayerY, true)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

//initialize message parameters
if( !initialized){
    initialized = true

    for (i = 0 ; i < totalMessages; i += 1){
        m = ds_list_find_value(messages, i)

        //load template values into message map
        if(ds_map_exists(m, "template")){
            tName = ds_map_find_value(m, "template")
            t = ds_map_find_value(global.dialogueTemplates, tName)
            merge_maps(m, t)
        }


        //load message parameters from map
        if (ds_map_exists(m, "image")){
            image[i] = ds_map_find_value(m, "image")
        }else{
            image[i] = global.defaultDialogueImage
        }
        if (ds_map_exists(m, "name")){
            name[i] = ds_map_find_value(m, "name")
        }else{
            name[i] = global.defaultDialogueName
        }
        if (ds_map_exists(m, "message")){
            message[i] = ds_map_find_value(m, "message")
        }else{
            message[i] = global.defaultDialogueMessage
        }
        if (ds_map_exists(m, "imageSide")){
            imageSide[i] = ds_map_find_value(m, "imageSide")
        }else{
            imageSide[i] = global.defaultDialogueImageSide
        }
        if (ds_map_exists(m, "font")){
            font[i] = ds_map_find_value(m, "font")
        }else{
            font[i] = global.defaultDialogueFont
        }
        if (ds_map_exists(m, "nameFont")){
            nameFont[i] = ds_map_find_value(m, "nameFont")
        }else{
            nameFont[i] = global.defaultDialogueNameFont
        }
        if (ds_map_exists(m, "instructionsFont")){
            instructionsFont[i] = ds_map_find_value(m, "instructionsFont")
        }else{
            instructionsFont[i] = global.defaultDialogueInstructionsFont
        }
        if (ds_map_exists(m, "borderColor")){
            borderColor[i] = ds_map_find_value(m, "borderColor")
        }else{
            borderColor[i] = global.defaultDialogueBorderColor
        }
        if (ds_map_exists(m, "textColor")){
            textColor[i] = ds_map_find_value(m, "textColor")
        }else{
            textColor[i] = global.defaultDialogueTextColor
        }
        if (ds_map_exists(m, "boxColor")){
            boxColor[i] = ds_map_find_value(m, "boxColor")
        }else{
            boxColor[i] = global.defaultDialogueBoxColor
        }
        if (ds_map_exists(m, "imageBoxColor")){
            imageBoxColor[i] = ds_map_find_value(m, "imageBoxColor")
        }else{
            imageBoxColor[i] = global.defaultDialogueImageBoxColor
        }
        if (ds_map_exists(m, "borderAlpha")){
            borderAlpha[i] = ds_map_find_value(m, "borderAlpha")
        }else{
            borderAlpha[i] = global.defaultDialogueBorderAlpha
        }
        if (ds_map_exists(m, "textAlpha")){
            textAlpha[i] = ds_map_find_value(m, "textAlpha")
        }else{
            textAlpha[i] = global.defaultDialogueTextAlpha
        }
        if (ds_map_exists(m, "boxAlpha")){
            boxAlpha[i] = ds_map_find_value(m, "boxAlpha")
        }else{
            boxAlpha[i] = global.defaultDialogueBoxAlpha
        }
        if (ds_map_exists(m, "imageBoxAlpha")){
            imageBoxAlpha[i] = ds_map_find_value(m, "imageBoxAlpha")
        }else{
            imageBoxAlpha[i] = global.defaultDialogueImageBoxAlpha
        }
        if (ds_map_exists(m, "imageAlpha")){
            imageAlpha[i] = ds_map_find_value(m, "imageAlpha")
        }else{
            imageAlpha[i] = global.defaultDialogueImageAlpha
        }
        if (ds_map_exists(m, "transitionSound")){
            transitionSound[i] = ds_map_find_value(m, "transitionSound")
        }else{
            transitionSound[i] = global.defaultDialogueTransitionSound
        }
        if (ds_map_exists(m, "drawImage")){
            drawImage[i] = ds_map_find_value(m, "drawImage")
        }else{
            drawImage[i] = global.defaultDialogueDrawImage
        }
        if (ds_map_exists(m, "drawNameplate")){
            drawNameplate[i] = ds_map_find_value(m, "drawNameplate")
        }else{
            drawNameplate[i] = global.defaultDialogueDrawNameplate
        }
        if (ds_map_exists(m, "boxYPosition")){
            boxYPosition[i] = ds_map_find_value(m, "boxYPosition")
        }else{
            boxYPosition[i] = global.defaultDialogueBoxYPosition
        }
        if (ds_map_exists(m, "nameplatePosition")){
            nameplatePosition[i] = ds_map_find_value(m, "nameplatePosition")
        }else{
            nameplatePosition[i] = global.defaultDialogueNameplatePosition
        }
        if (ds_map_exists(m, "imagePosition")){
            imagePosition[i] = ds_map_find_value(m, "imagePosition")
        }else{
            imagePosition[i] = global.defaultDialogueImagePosition
        }
        if (ds_map_exists(m, "transitionTrigger")){
            transitionTrigger[i] = ds_map_find_value(m, "transitionTrigger")
        }else{
            transitionTrigger[i] = global.defaultDialogueTransitionTrigger
        }

    }

}

//draw current message
if( messageIndex >= 0 && totalMessages > 0 && messageIndex < totalMessages){

    //remove control of player
    frozen=true

    //stop timer
    if(freezeTime && freezer == noone){
        freezer = instance_create(0, 0, TimerFreeze)
    }

    i = messageIndex

    //set up position
    if(boxYPosition[i] == "Bottom"){
        x1 = view_xview + 25
        x2 = view_xview + global.width - 25
        y1 = view_yview + global.height - 200
        y2 = view_yview + global.height - 25
    }else if (boxYPosition[i] == "Center"){
        x1 = view_xview + 25
        x2 = view_xview + global.width - 25
        y1 = view_yview + (global.height div 2) - 90
        y2 = view_yview + (global.height div 2) + 85
    }else if (boxYPosition[i] == "OnObject"){
        x1 = view_xview + 25
        x2 = view_xview + global.width - 25
        y1 = y - 90
        y2 = y + 85
    }else{
        x1 = view_xview + 25
        x2 = view_xview + global.width - 25
        y1 = view_yview + 25
        y2 = view_yview + 200
    }


    locations[0] = x1
    locations[1] = y1
    locations[2] = x2
    locations[3] = y2

    img = image[i]
    nme = name[i]
    msg = message[i]
    imgSide = imageSide[i]

    fonts[0] = font[i]
    fonts[1] = nameFont[i]
    fonts[2] = instructionsFont[i]

    colors[0] = borderColor[i]
    colors[1] = textColor[i]
    colors[2] = boxColor[i]
    colors[3] = imageBoxColor[i]

    alphas[0] = borderAlpha[i]
    alphas[1] = textAlpha[i]
    alphas[2] = boxAlpha[i]
    alphas[3] = imageBoxAlpha[i]
    alphas[4] = imageAlpha[i]

    sound = transitionSound[i]

    dImage = drawImage[i]
    dNameplate = drawNameplate[i]

    bPos = boxYPosition[i]
    iPos = imagePosition[i]

    trigger = transitionTrigger[i]

    //determine nameplate position if opposite box
    if(nameplatePosition[i] == "OppositeBox"){
        if(bPos == "Top"){
            nPos = "Bottom"
        }else{
            nPos = "Top"
        }
    }else{
        nPos = nameplatePosition[i]
    }

    //play start sound and activate start trigger
    if(messageIndex == 0){
        if( startSound != "no_sound" && !startSoundPlayed){
            startSoundPlayed = true
            sound_play(startSound)
        }
        if( startTrigger != noone && !startTriggerActivated){
            startTriggerActivated = true
            instance_create(0, 0, startTrigger)
            with(startTrigger){
                event_user(0)
            }
        }
    }

    //play start music
    if(startMusic != ""){
        play_bg_music(startMusic, loopStartMusic)
    }

    //deterimine if instrucitons are shown
    if(instructionMode == "First" && messageIndex == 0){
        instructions = true
    }else if(instructionMode == "Always"){
        instructions = true
    }else{
        instructions = false
    }

    draw_dialogue_box(img, nme, msg, imgSide, locations, fonts, colors, alphas, instructions,
        dImage, dNameplate, nPos, bPos, iPos, skippable)


}
