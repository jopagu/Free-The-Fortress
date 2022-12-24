
add_message()
add_parameter("template", "Kid")
add_parameter("message", "Ugh, the captain set up a training course #again. I'll have to destroy these targets #before I can get to the mess hall.")

add_message()
add_parameter("template", "Kid")
add_parameter("message", "This is what I get for sleeping in. #Luckily, I just have to press " + key_get_name(key_X) + " to raise #the spear, and then use " + key_get_name(key_up) + " and")

add_message()
add_parameter("template", "Kid")
add_parameter("message", "" + key_get_name(key_down) + " to aim. Finally, I can hold down #" + key_get_name(key_shoot) + " to charge a shot, and release #to fire!")

flagSet = "training"
saveFlagSet = true
add_required_false_flag("training")
