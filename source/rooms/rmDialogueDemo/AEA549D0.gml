
//By using character templates, this much code...
add_message()
add_parameter("image", sprMadelineHead)
add_parameter("name", "Madeline Celeste")
add_parameter("message", "Hello Kid, it's me, Madeline Celeste. #I just want you to know that dialogue #customization is super easy!")
add_parameter("imageSide", "Right")
add_parameter("boxColor", make_color_rgb(245, 181, 225))
add_parameter("imageBoxColor", make_color_rgb(232, 67, 181))
add_parameter("imagePosition", "Fill")


//Can turn into this!
add_message()
add_parameter("template", "Madeline")
add_parameter("message", "This color change only required #two lines in the object's #creation code!")
add_parameter("imageSide", "Right")


add_message()
add_parameter("image", sprKidHeadBow)
add_parameter("name", "The Kid")
add_parameter("message", "Wow, Madeline Celeste! #That was proabably a lot of work #to implement!")
add_parameter("imageSide", "Left")

add_message()
add_parameter("template", "Madeline")
add_parameter("message", "Also, this dialogue isn't skippable!")
add_parameter("imageSide", "Right")



instructionMode = "Always"
skippable = false
