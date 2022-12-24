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
xoffset = 96
yoffset = 128

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
    alarm[0] = 20
}else{
    alarm[1] = summon_interval
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rx = x + random_range(-xoffset, xoffset)
ry = y + random_range(-yoffset, 0)
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
            image_xscale = scale
            image_yscale = scale
        }
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(savedata("clear")){
    instance_destroy()
}


if(iframes > 0){
    iframes -= 1
    image_alpha = 0.5
}else{
    image_alpha = 1
}

if(image_index >= 2){
    t += 1
    image_index = 2 + (floor(t/20) mod 2)
}
#define Collision_Spear
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(other.moving && iframes == 0 && visible){
    hp -= 1
    iframes = 50
    sound_play("sndBossHit")
}
if(hp == 0){
    instance_deactivate_object(id)
    if(!instance_exists(Portal) && !instance_exists(EvilFire)){
        with(FireWall){
            if(inside_view()){
                instance_destroy()
            }
        }
    }
    instance_activate_object(id)
    sound_play("sndBossDeath")
    repeat(random_range(150, 250)){
        rx = random_range(bbox_left, bbox_right)
        ry = random_range(bbox_top, bbox_bottom)
        p = instance_create(rx, ry, ParticleDark)
        with(p){
            dir = random(361)
            spd = random(3)
            hspeed = lengthdir_x(spd, dir)
            vspeed = lengthdir_y(spd, dir)
            scale = random_range(0.7, 1)
            image_xscale = scale
            image_yscale = scale
        }
    }
    repeat(random_range(150, 250)){
        rx = random_range(bbox_left, bbox_right)
        ry = random_range(bbox_top, bbox_bottom)
        p = instance_create(rx, ry, Particle)
        with(p){
            dir = random(361)
            spd = random(3)
            hspeed = lengthdir_x(spd, dir)
            vspeed = lengthdir_y(spd, dir)
            scale = random_range(0.7, 1)
            image_xscale = scale
            image_yscale = scale
        }
    }
    instance_destroy()
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndTear")
visible = true
alarm[0] = 20
alarm[1] = summon_interval
hp = max_hp
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
event_user(0)
