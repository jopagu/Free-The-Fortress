#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

song = global.bgm
prevSong = ""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(savedata("clear")){
    instance_destroy()
}
song = global.bgm
if(song != prevSong){
    play_bg_music(song, true)
    prevSong = song
}
