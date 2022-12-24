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

wingMaxHP = 10

enrage = false

attacks = ds_list_create()
ds_list_add(attacks, "SplitSpit")
ds_list_add(attacks, "Summon")
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
        max_hp = other.wingMaxHP
        hp = max_hp
    }
    with(wingR){
        max_hp = other.wingMaxHP
        hp = max_hp
        image_xscale = -1
    }

    t = 0
    active = true
    alarm[1] = 50
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

r = floor(random(ds_list_size(attacks)))
attack = ds_list_find_value(attacks, r)

switch attack{
    case "SplitSpit":
        spitCount = 0
        alarm[2] = 1
        break
    case "Summon":
        summonCount = 0
        alarm[3] = 1
        break
}
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("sndSpit")
s1 = instance_create(x,y, Shot)
with(s1){
    dir = direction_to_object(Player)
    image_angle = dir
    hspeed = lengthdir_x(4, dir)
    vspeed = lengthdir_y(4, dir)
}
s2 = instance_create(x,y, Shot)
with(s2){
    dir = direction_to_object(Player) + 20
    image_angle = dir
    hspeed = lengthdir_x(4, dir)
    vspeed = lengthdir_y(4, dir)
}
s3 = instance_create(x,y, Shot)
with(s3){
    dir = direction_to_object(Player) - 20
    image_angle = dir
    hspeed = lengthdir_x(4, dir)
    vspeed = lengthdir_y(4, dir)
}
if(enrage){
    s4 = instance_create(x,y, Shot)
    with(s4){
        dir = direction_to_object(Player) + 40
        image_angle = dir
        hspeed = lengthdir_x(4, dir)
        vspeed = lengthdir_y(4, dir)
    }
    s4 = instance_create(x,y, Shot)
    with(s4){
        dir = direction_to_object(Player) - 40
        image_angle = dir
        hspeed = lengthdir_x(4, dir)
        vspeed = lengthdir_y(4, dir)
    }
}

spitCount += 1
if(spitCount < 5){
    alarm[2] = 25
}else{
    alarm[1] = 100
}
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rx = x + random_range(-128, 128)
ry = y + random_range(-128, 0)
s = instance_create(rx, ry, choose(Biter, Shooter))

sound_play("sndWarp")

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

summonCount += 1
if(!enrage){
    if(summonCount < 3){
        alarm[3] = 15
    }else{
        alarm[1] = 200
    }
}else{
    if(summonCount < 5){
        alarm[3] = 15
    }else{
        alarm[1] = 250
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!active) exit

t += 1
if(enrage){
    t2 += 0.5
}


if(!enrage){
    image_index = 3 + (floor(t/15) mod 4)
    x = baseX + (200 * sin(t /50))
    y = baseY + (50 * cos(t /25))
}else{
    image_index = 7 + (floor(t/15) mod 4)
    x = baseX + (200 * sin(((t + t2) /50)))
    y = baseY + (50 * cos(((t + t2) /25)))
}

wingHP = 0
with(wingL){
    x = other.bbox_left - 16
    y = other.y

    image_angle = 45 * sin((other.t * (5 - (other.numWings * 2))) / 50)

    if(instance_place(x, y, Spear) && iframes <= 0){
        hp -= 1
        sound_play("sndBossHit")
        if(hp == 0){
            instance_destroy()
            other.numWings -= 1
        }
        iframes = 50
    }
    other.wingHP += hp
}

with(wingR){
    x = other.bbox_right + 16
    y = other.y

    image_angle = -45 * sin((other.t * (5 - (other.numWings * 2))) / 50)
    if(instance_place(x, y, Spear) && iframes <= 0){
        hp -= 1
        sound_play("sndBossHit")
        if(hp == 0){
            instance_destroy()
            other.numWings -= 1
        }
        iframes = 50
    }
    other.wingHP += hp
}

if(wingHP <= wingMaxHP && !enrage){
    enrage = true
    t2 = 0
    sound_play("sndRoar")
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
