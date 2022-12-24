#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
active = false
visible = false
shielded = true

baseX = x
baseY = y
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(image_index < 3){
    image_index += 1
    alarm[0] = 15
}else{
    image_index = 3
    wingL = instance_create( bbox_left - 16, y, Wing)
    wingR = instance_create(bbox_right + 16, y, Wing)
    shield = instance_create(x, y, Shield)
    with(shield){
        visible =  false
    }
    numWings = 2
    with(wingL){
        max_hp = 10
        hp = max_hp
    }
    with(wingR){
        max_hp = 10
        hp = max_hp
        image_xscale = -1
    }

    t = 0
    active = true
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!active) exit

t += 1

image_index = 3 + (floor(t/15) mod 4)

x = baseX + (200 * sin((t * (3 - numWings)) /50))
y = baseY + (50 * cos((t * (3 - numWings)) /25))

with(wingL){
    x = other.bbox_left - 16
    y = other.y

    image_angle = 45 * sin((other.t * (5 - (other.numWings * 2))) / 50)

    if(instance_place(x, y, Spear) && iframes <= 0){
        hp -= 1
        if(hp == 0){
            instance_destroy()
            other.numWings -= 1
        }
        iframes = 50
    }
}

with(wingR){
    x = other.bbox_right + 16
    y = other.y

    image_angle = -45 * sin((other.t * (5 - (other.numWings * 2))) / 50)
    if(instance_place(x, y, Spear) && iframes <= 0){
        hp -= 1
        if(hp == 0){
            instance_destroy()
            other.numWings -= 1
        }
        iframes = 50
    }

}

with(shield){
    x = other.x
    y = other.y
}

d = direction_to_object(Player)
if(d < 80 || d > 280){
    image_xscale = -1
}else if(d >= 100 && d <= 260){
    image_xscale = 1
}
#define Collision_Spear
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(active && shielded && other.moving){
    sound_play("sndTing")
    with(shield){
        visible = true
        alarm[0] = 30
    }
    with(other){
        instance_destroy()
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

if(!active) exit

with(wingL){

    hp_percent = hp/max_hp
    draw_set_color(c_green)
    draw_rectangle(x - 64, y + 96, (x - 64) + (64 * hp_percent), y + 100, false)
    if(hp < max_hp){
        draw_set_color(c_red)
        draw_rectangle((x - 64) + (64 * hp_percent) + 1, y + 96, x, y + 100, false)
    }
}

with(wingR){

    hp_percent = hp/max_hp
    draw_set_color(c_green)
    draw_rectangle(x, y + 96, (x) + (64 * hp_percent), y + 100, false)
    if(hp < max_hp){
        draw_set_color(c_red)
        draw_rectangle((x) + (64 * hp_percent) + 1, y + 96, x + 64, y + 100, false)
    }
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible = true
alarm[0] = 15
sound_play("sndTear")
