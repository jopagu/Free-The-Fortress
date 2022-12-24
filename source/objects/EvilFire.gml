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
max_hp = 10

iframes = 0

enrage = false

phase1 = true
phase2 = false
phase3 = false

portalExists = false
portal = noone

attacks = ds_list_create()
ds_list_add(attacks, "SplitSpit")
ds_list_add(attacks, "Summon")
ds_list_add(attacks, "Drop")
ds_list_add(attacks, "Laser")
ds_list_add(attacks, "Feathers")
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

if(phase1){
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
        case "Drop":
            dropCount = 0
            alarm[4] = 1
            break
        case "Laser":
            laserCount = 0
            alarm[5] = 1
            break
        case "Feathers":
            featherCount = 0
            alarm[6] = 1
            break
    }
}
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!phase1) exit

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
if(spitCount < 10){
    if(!enrage){
        alarm[2] = 15
    }else{
        alarm[2] = 9
    }
}else{
    alarm[1] = 100
}
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!phase1) exit

rx = x + random_range(-128, 128)
ry = y + random_range(-64, 0)
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
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!phase1) exit

repeat(2){
    instance_create(x + floor(random_range(-32, 32)), y + floor(random_range(-32, 32)), Fireball)
}

dropCount += 1
if(dropCount < 40){
    if(!enrage){
        alarm[4] = random_range(10, 16)
    }else{
        alarm[4] = random_range(4, 9)
    }
}else{
    alarm[1] = 100
}
#define Alarm_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!phase1) exit

sound_play("sndLaser")

if(!enrage){
    laserAccel = 0
}else{
    laserAccel = 0.1
}

l = instance_create(x, y, Laser)
with(l){
    dir = random_range(190, 351)
    spd = 3
    accel = other.laserAccel
}

laserCount += 1
if(laserCount < 80){
    alarm[5] = random_range(2, 5)
}else{
    alarm[1] = 100
}
#define Alarm_6
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!phase1) exit
if(!enrage){
    reps = 2
}else{
    reps = 4
}

sound_play("sndWhoosh")

with(wingL){
    dx = x + lengthdir_x(-76, image_angle)
    dy = y + lengthdir_y(-76, image_angle)
    repeat(other.reps){
        f = instance_create(dx, dy, Feather)
        with(f){
            dir = direction_to_object(Player) + random_range(-45, 46)
            image_angle = dir
            hspeed = lengthdir_x(4, dir)
            vspeed = lengthdir_y(4, dir)
        }
    }
}
with(wingR){
    dx = x + lengthdir_x(76, image_angle)
    dy = y + lengthdir_y(76, image_angle)
    repeat(other.reps){
        f = instance_create(dx, dy, Feather)
        with(f){
            dir = direction_to_object(Player) + random_range(-45, 46)
            image_angle = dir
            hspeed = lengthdir_x(4, dir)
            vspeed = lengthdir_y(4, dir)
        }
    }
}

featherCount += 1
if(featherCount < 8){
    alarm[6] = 25
}else{
    alarm[1] = 100
}
#define Alarm_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

r = floor(random(101))

if(r >= 0 && r <= 50){
    sound_play("sndLaser")
    l = instance_create(x, y, Laser)
    with(l){
        dir = direction_to_object(Player) + random_range(-30, 11)
        hspeed = lengthdir_x(5, dir)
        vspeed = lengthdir_y(5, dir)
        accel = 0.2
    }
}else if(r <= 70){
    sound_play("sndWarp")
    repeat(random_range(5, 11)){
        rx = random_range(view_xview + 200, view_xview + 701)
        ry = random_range(100, 251)
        s = instance_create(rx, ry, Fireball)

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
    }
}else if(r <= 90){
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
}else if(r <= 95){
    rx = random_range(view_xview + 200, view_xview + 701)
    ry = random_range(100, 251)
    s = instance_create(rx, ry, Biter)
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
}else{
    rx = random_range(view_xview + 200, view_xview + 701)
    ry = random_range(100, 251)
    s = instance_create(rx, ry, Shooter)
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
}

alarm[7] = 10
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


if(iframes > 0){
    iframes -= 1
    image_alpha = 0.5
}else{
    image_alpha = 1
}

if(!enrage){
    image_index = 3 + (floor(t/15) mod 4)
}else{
    image_index = 7 + (floor(t/15) mod 4)
}

if(phase1){
    event_user(0)
}else if(phase2){
    event_user(1)
}else if(phase3){
    event_user(2)
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
}else if(active && other.moving && iframes <= 0){
    sound_play("sndBossHit")
    hp -= 1
    if(hp <= 0){
        instance_destroy()
    }
    iframes = 50
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(!enrage){

    x = baseX + (200 * sin(t /50))
    y = baseY + (50 * cos(t /25))
}else{

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

if(numWings <= 0){
    sound_play("sndRoar")
    phase1 = false
    phase2 = true
    if(x - xprevious >= 0){
        hspeed = 1
    }else{
        hspeed = -1
    }
    vspeed = 3
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!instance_place(x, y, Block)) exit

vspeed = 0
hspeed = 0

if(!portalExists){
    portalExists = true
    portal = instance_create(view_xview + (global.width / 2), 160, Portal)
    with(portal){
        summon = Fireball
        xoffset = 254
        summon_interval = 4
        max_hp = 10
        event_user(0)
    }
}

if(!instance_exists(portal)){
    portalExits = false
    phase2 = false
    phase3 = true
    sound_play("sndRoar")
}

if(t mod 12 == 0){
    sound_play("sndLaser")
    l = instance_create(x, y, Laser)
    with(l){
        dir = direction_to_object(Player) + random_range(-30, 11)
        hspeed = lengthdir_x(5, dir)
        vspeed = lengthdir_y(5, dir)
    }
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(shielded){
    shielded = false
    sound_play("sndShatter")
    with(Shield){
        instance_destroy()
    }
    repeat(10){
        s = instance_create(x + random_range(-48, 49), y + random_range(-48, 49), ShieldShard)
        with(s){
            image_angle = random(361)
            hspeed = random_range(-4, 5)
            vspeed = random_range(0, -3)
            vaccel = random_range(0.05, 0.1)
        }
    }
    alarm[7] = 1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

if(!active) exit

if(phase3){
    hp_percent = hp/max_hp
    draw_set_color(c_green)
    draw_rectangle(x - 64, y - 48, (x - 64) + (128 * hp_percent), y - 52, false)
    if(hp < max_hp){
        draw_set_color(c_red)
        draw_rectangle((x - 64) + (128 * hp_percent) + 1, y - 48, x + 64, y - 52, false)
    }
}

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
hp = max_hp
