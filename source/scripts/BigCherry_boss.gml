if (event="create") {
    name="Big Cherry"
    sur="Celebrate100"

    hp=100
    instance_create(0,0,BigCherryHealthbar)

    cutscene=true

    image_speed=0
    image_xscale=4
    image_yscale=4
    exit
}

if (event="draw") {
    draw_self()
    exit
}

if (event="destroy") {
    instance_destroy_id(BigCherryHealthbar)
    exit
}

t+=dt

if (state="won") {
    path_speed=0
    exit
}

//die
if (hp<=0) {
    sound_play("sndDeath")
    instance_destroy()
    exit
}

//first state
if (state="begin") {
    if (once_every(60)) {
        cutscene=false
        play_bg_music("ddplastboss",1)
        path_start(pBoss10F,2*dt,path_action_restart,true)
        t=0
        state="active"
    }
}

//checks to get hit
with (instance_place(x,y,Bullet)) with (other) {
    if (!flash) {
        flash=10
        flashtime=6
        sound_play("sndBossHit")
        hp-=10
        if (hp<=50) {
            state="pinch"
        }
    }
    instance_destroy_id(other)
}

//flash
if (flash) {
    flashtime-=dt
    if (flashtime<=0) {
        flashtime=6
        if (visible) {
            visible=false
        } else {
            visible=true
            flash-=1
        }
    }
}

//attack!
if (state="active") {
    if (once_every(90)) {
        o=instance_create(x,y,Cherry)
        o.speed=5*dt
        o.direction=point_direction(x,y,Player.x,Player.y)
    }
}

//pinch mode
if (state="pinch") {
    if (once_every(90)) {
        o=instance_create(x,y,Cherry)
        o.speed=5*dt
        o.direction=point_direction(x,y,Player.x,Player.y)
        o=instance_create(x,y,BigCherryBlue2)
        o.speed=1*dt
        o.direction=random(360)
    }
}
