

add_message()
add_parameter("template", "Captain")
add_parameter("message", "ATTENTION! ALL SOLDIERS! WE #ARE BEING INVADED BY #EXTRADIMENSIONAL BEASTS!")
add_parameter("imageSide", "Right")

add_message()
add_parameter("template", "Kid")
add_parameter("message", "Well that can't be good!")

flagSet = "Invasion"
saveFlagSet = true
add_required_false_flag("Invasion")

endTrigger = Trigger1
