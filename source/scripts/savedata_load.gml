//loads the game from memory
//the game works in memory during gameplay, occasionally writing to disk.
//if you need to reload from disk for whatever reason, look up savedata_read().
var i;

instance_destroy_id(Player)

if (savedata("diff")==3) {
    savedata_default()
    savedata("diff",3)
}

if (savedata("saved")) {
    global.player_skin=savedata("skin")
    global.player_weapon=savedata("weapon")

    i=instance_create(savedata("x"),savedata("y"),savedata("obj"))
    i.image_xscale=savedata("width")
    i.image_yscale=savedata("height")
    i.facing=savedata("facing")
    i.vflip=savedata("vflip")

    //gimmicks
    i.slomo=savedata("slomo")
    i.dot_hitbox=savedata("whitedot")
    i.dotkid=savedata("dotkid")
    i.shootkid=savedata("shootkid")
    i.maxjumps=savedata("numjumps")
    i.vvvvvv=savedata("vvvvvv")
    i.beamstate=savedata("beamstate")
    global.bgm = savedata("bgm")

    global.redBG = savedata("redbg")
    global.oldBG = savedata("oldbg")

    ds_map_read(global.savedDialogueFlags , savedata("dialogueFlags"))
    ds_map_clear(global.dialogueFlags)
    merge_maps(global.dialogueFlags, global.savedDialogueFlags)

    difficulty=savedata("diff")


}

global.warp_id=""
room_goto(savedata("room"))
