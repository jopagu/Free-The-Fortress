#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
summon = Biter
summon_interval = 75
max_hp = 8
hp = max_hp
iframes = 0

visible = false

t = 0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_index += 1

if(image_index < 2){
    alarm[0] = 15
}else{
    alarm[1] = summon_interval
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rx = x + random_range(-96, 96)
ry = y + random_range(-128, 128)
s = instance_create(rx, ry, summon)

sound_play("sndWarp")

alarm[1] = summon_interval

with(s){
    repeat(random_range(10, 21)){
        degree = random(361)
        dist = random(32)
        p = instance_create(x + lengthdir_x(dist, degree), y + lengthdir_y(dist, degree), ParticleDark)
        with(p){
            scale = random_range(0.7, 1)
            xscale = scale
            yscale = scale
        }
    }
    repeat(random_range(10, 21)){
        degree = random(361)
        dist = random(32)
        p = instance_create(x + lengthdir_x(dist, degree), y + lengthdir_y(dist, degree), Particle)
        with(p){
            scale = random_range(0.7, 1)
            xscale = scale
            yscale = scale
        }
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t += 1
if(iframes > 0){
    iframes -= 1
    image_alpha = 0.5
}else{
    image_alpha = 1
}

if(image_index >= 2){
    image_index = 2 + (floor(t/15) mod 2)
}
#define Collision_Spear
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(other.moving && iframes == 0){
    hp -= 1
    iframes = 50
    sound_play("sndBossHit")
}
if(hp == 0){
    with(FireWall){
        instance_destroy()
    }
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

hp_percent = hp/max_hp

draw_set_color(c_green)
draw_rectangle(x - 64, y + 96, (x - 64) + (128 * hp_percent), y + 100, false)
if(hp < max_hp){
    draw_set_color(c_red)
    draw_rectangle((x - 64) + (128 * hp_percent) + 1, y + 96, x + 64, y + 100, false)
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndTear")
visible = true
alarm[0] = 15
alarm[1] = summon_interval
