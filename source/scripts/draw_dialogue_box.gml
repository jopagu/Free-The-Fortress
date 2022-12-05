
//draw_dialogue_box(img, name, msg, imgSide, locations, fonts, colors, alphas, instructions,
//                      drawImage, drawNameplate, nameplatePosition, boxYPosition, imagePosition, skippable)

img=argument0
name=argument1
msg=argument2
imgSide = argument3

locations = argument4
fonts = argument5
colors = argument6
alphas = argument7
instructions = argument8

drawImage = argument9
drawNameplate = argument10

nameplatePosition = argument11
boxYPosition = argument12
imagePosition = argument13

skippable = argument14

x1 = locations[0]
y1 = locations[1]
x2 = locations[2]
y2 = locations[3]

font = fonts[0]
fontName = fonts[1]
fontInstructions = fonts[2]

borderColor = colors[0]
txtColor = colors[1]
boxColor = colors[2]
imgBackgroundColor = colors[3]

borderAlpha = alphas[0]
txtAlpha = alphas[1]
boxAlpha = alphas[2]
imgBackgroundAlpha = alphas[3]
imageAlpha = alphas[4]

drawInstructions = instructions

imageBoxWidth = 139
imageBorderGap = 18
imageBorderWidth = 3

//Set up sprite position w/in image box
if(imagePosition == "Center"){
    imageXSpriteOffset = 2
    imageYSpriteOffset = 2
}else if(imagePosition == "Left" || imagePosition == "Right"){
    imageXSpriteOffset = 0
    imageYSpriteOffset = 2
}else if(imagePosition == "Top" || imagePosition == "Bottom"){
    imageXSpriteOffset = 2
    imageYSpriteOffset = 0
}else{
    imageXSpriteOffset = 0
    imageYSpriteOffset = 0
}

imageSpriteWidth = imageBoxWidth - (2 * imageBorderWidth) - (2 * imageXSpriteOffset) + 1
imageSpriteHeight = imageBoxWidth - (2 * imageBorderWidth) - (2 * imageYSpriteOffset) + 1

textImageGap = 22
textBorderGap = imageBorderGap + imageBoxWidth + textImageGap


sh = string_height(name)
sw = string_width(name)

//scooch box if the nameplate is on the side of the screen edge
if(nameplatePosition != "Top" && boxYPosition == "Bottom"){
    y1 = y1 - 7 - sh
    y2 = y2 - 7 - sh
}else if ( nameplatePosition == "Top" && boxYPosition == "Top"){
    y1 = y1 + 7 + sh
    y2 = y2 + 7 + sh
}



//Draw main box
draw_set_alpha(borderAlpha)
draw_set_color(borderColor)
draw_rectangle(x1, y1, x2, y2, true)
draw_rectangle(x1 + 1, y1 + 1, x2 - 1, y2 - 1, true)
draw_rectangle(x1 + 2, y1 + 2, x2 - 2, y2 - 2, true)

draw_set_alpha(boxAlpha)
draw_set_color(boxColor)
draw_rectangle(x1 + 3, y1 + 3, x2 - 3, y2 - 3, false)

//Scale Sprite
w = sprite_get_width(img)
h = sprite_get_height(img)
if (w > h){
    xscale = (imageSpriteWidth / w)
    yscale = (imageSpriteHeight / h) * (h / w)
}else{
    xscale = (imageSpriteWidth / w) * (w / h)
    yscale = (imageSpriteHeight / h)
}
w *= xscale
h *= yscale

//Further set up sprite position
if(imagePosition == "Right"){
    imageXSpriteOffset = imageSpriteWidth - w
}else if(imagePosition == "Bottom"){
    imageYSpriteOffset = imageSpriteHeight - h
}

draw_set_alpha(borderAlpha)
draw_set_color(borderColor)
draw_set_font(font)

if (imgSide == "Left"){
    //draw image box
    if(drawImage){

        draw_rectangle(x1 + imageBorderGap, y1 + imageBorderGap, x1 + imageBorderGap + imageBoxWidth, y2 - imageBorderGap, false)

        draw_set_color(imgBackgroundColor)
        draw_set_alpha(imgBackgroundAlpha)
        draw_rectangle(x1 + imageBorderGap + imageBorderWidth, y1 + imageBorderGap + imageBorderWidth,
            x1 + imageBorderGap + imageBoxWidth - imageBorderWidth, y2 - imageBorderGap - imageBorderWidth, false)


        if(imagePosition == "Center"){
            draw_sprite_ext(img, 0, x1 + imageBorderGap + imageBorderWidth + ((imageSpriteWidth + (2 * imageXSpriteOffset) - w) / 2),
                y1 + imageBorderGap + imageBorderWidth + ((imageSpriteWidth + (2 * imageYSpriteOffset) - h) / 2), xscale, yscale, 0, -1, imageAlpha )
        }else{
            draw_sprite_ext(img, 0, x1 + imageBorderGap + imageBorderWidth + imageXSpriteOffset,
                y1 + imageBorderGap + imageBorderWidth + imageYSpriteOffset, xscale, yscale, 0, -1, imageAlpha )
        }


    }else{
        textBorderGap = textImageGap
    }

    //draw message
    draw_text_outline_alpha(x1 + textBorderGap, y1 + imageBorderGap + imageBorderWidth, msg, txtColor, txtAlpha)

    //draw nameplate
    if(drawNameplate){

        draw_set_font(fontName)

        if(nameplatePosition = "Top"){
            draw_set_color(borderColor)
            draw_set_alpha(borderAlpha)
            draw_line(x1 + 21, y1 - 1, x1 + 27 + sh, y1 - 7 - sh)
            draw_line(x1 + 22, y1 - 1, x1 + 28 + sh, y1 - 7 - sh)
            draw_line(x1 + 23, y1 - 1, x1 + 29 + sh, y1 - 7 - sh)
            draw_rectangle(x1 + 27 + sh, y1 - 7 - sh, x1 + 27 + sh + sw, y1 - 4 - sh, false)
            draw_line(x1 + 25 + sh + sw, y1 - 7 - sh, x1 + 31 + sh + sw + sh, y1 - 1)
            draw_line(x1 + 26 + sh + sw, y1 - 7 - sh, x1 + 32 + sh + sw + sh, y1 - 1)
            draw_line(x1 + 27 + sh + sw, y1 - 7 - sh, x1 + 33 + sh + sw + sh, y1 - 1)

            draw_set_color(boxColor)
            draw_set_alpha(boxAlpha)
            draw_triangle(x1 + 23, y1, x1 + 27 + sh, y1, x1 + 27 + sh, y1 - 4 - sh, false)
            draw_rectangle(x1 + 27 + sh, y1 - 3 - sh, x1 + 27 + sh + sw, y1 - 1, false)
            draw_triangle(x1 + 28 + sh + sw, y1, x1 + 28 + sh + sw, y1 - 4 - sh, x1 + 33 + sh + sw + sh, y1, false)

            //draw name
            draw_text_outline_alpha(x1 + 27 + sh, y1 - 1 - sh, name, txtColor, txtAlpha)
        }else{
            draw_set_color(borderColor)
            draw_set_alpha(borderAlpha)
            draw_line(x1 + 21, y2 + 1, x1 + 27 + sh, y2 + 7 + sh)
            draw_line(x1 + 22, y2 + 1, x1 + 28 + sh, y2 + 7 + sh)
            draw_line(x1 + 23, y2 + 1, x1 + 29 + sh, y2 + 7 + sh)
            draw_rectangle(x1 + 27 + sh, y2 + 7 + sh, x1 + 27 + sh + sw, y2 + 4 + sh, false)
            draw_line(x1 + 25 + sh + sw, y2 + 7 + sh, x1 + 31 + sh + sw + sh, y2 + 1)
            draw_line(x1 + 26 + sh + sw, y2 + 7 + sh, x1 + 32 + sh + sw + sh, y2 + 1)
            draw_line(x1 + 27 + sh + sw, y2 + 7 + sh, x1 + 33 + sh + sw + sh, y2 + 1)

            draw_set_color(boxColor)
            draw_set_alpha(boxAlpha)
            draw_triangle(x1 + 23, y2 + 1, x1 + 27 + sh, y2 + 1, x1 + 27 + sh, y2 + 4 + sh, false)
            draw_rectangle(x1 + 27 + sh, y2 + 3 + sh, x1 + 27 + sh + sw, y2 + 1, false)
            draw_triangle(x1 + 28 + sh + sw, y2 + 1, x1 + 28 + sh + sw, y2 + 4 + sh, x1 + 31 + sh + sw + sh, y2 + 1, false)

            //draw name
            draw_text_outline_alpha(x1 + 27 + sh, y2 + 1, name, txtColor, txtAlpha)
        }
    }

}else{

    //draw image box
    if(drawImage){
        xscale = -xscale
        draw_rectangle(x2 - imageBorderGap - imageBoxWidth, y1 + imageBorderGap, x2 - imageBorderGap, y2 - imageBorderGap, false)

        draw_set_color(imgBackgroundColor)
        draw_set_alpha(imgBackgroundAlpha)
        draw_rectangle(x2 - imageBorderGap - imageBoxWidth + imageBorderWidth, y1 + imageBorderGap + imageBorderWidth,
            x2 - imageBorderGap - imageBorderWidth, y2 - imageBorderGap - imageBorderWidth, false)

        if(imagePosition == "Center"){
            draw_sprite_ext(img, 0, x2  + 1 - imageBorderGap - imageBorderWidth - ((imageSpriteWidth + (2 * imageXSpriteOffset) - w) / 2),
                y1 + imageBorderGap + imageBorderWidth + ((imageSpriteWidth + (2 * imageYSpriteOffset) - h) / 2), xscale, yscale, 0, -1, imageAlpha )
        }else{
            draw_sprite_ext(img, 0, x2  + 1 - imageBorderGap - imageBorderWidth - imageXSpriteOffset,
                y1 + imageBorderGap + imageBorderWidth + imageYSpriteOffset, xscale, yscale, 0, -1, imageAlpha )
        }

    }

    //draw message
    draw_text_outline_alpha(x1 + textImageGap, y1 + imageBorderGap + imageBorderWidth, msg, txtColor, txtAlpha)

    //draw nameplate
    if(drawNameplate){
        draw_set_font(fontName)

        if(nameplatePosition == "Top"){
            draw_set_color(borderColor)
            draw_set_alpha(borderAlpha)
            draw_line(x2 - 21, y1 - 1, x2 - 27 - sh, y1 - 7 - sh)
            draw_line(x2 - 22, y1 - 1, x2 - 28 - sh, y1 - 7 - sh)
            draw_line(x2 - 23, y1 - 1, x2 - 29 - sh, y1 - 7 - sh)
            draw_rectangle(x2 - 27 - sh, y1 - 7 - sh, x2 - 27 - sh - sw, y1 - 4 - sh, false)
            draw_line(x2 - 25 - sh - sw, y1 - 7 - sh, x2 - 31 - sh - sw - sh, y1 - 1)
            draw_line(x2 - 26 - sh - sw, y1 - 7 - sh, x2 - 32 - sh - sw - sh, y1 - 1)
            draw_line(x2 - 27 - sh - sw, y1 - 7 - sh, x2 - 33 - sh - sw - sh, y1 - 1)

            draw_set_color(boxColor)
            draw_set_alpha(boxAlpha)
            draw_triangle(x2 - 22, y1, x2 - 26 - sh, y1, x2 - 26 - sh, y1 - 4 - sh, false)
            draw_rectangle(x2 - 27 - sh, y1 - 3 - sh, x2 - 27 - sh - sw, y1 - 1, false)
            draw_triangle(x2 - 27 - sh - sw, y1, x2 - 27 - sh - sw, y1 - 4 - sh, x2 - 32 - sh - sw - sh, y1, false)

            //draw name
            draw_text_outline_alpha(x2 - 27 - sh - sw, y1 - 1 - sh, name, txtColor, txtAlpha)
        }else{
            draw_set_color(borderColor)
            draw_set_alpha(borderAlpha)
            draw_line(x2 - 21, y2 + 1, x2 - 27 - sh, y2 + 7 + sh)
            draw_line(x2 - 22, y2 + 1, x2 - 28 - sh, y2 + 7 + sh)
            draw_line(x2 - 23, y2 + 1, x2 - 29 - sh, y2 + 7 + sh)
            draw_rectangle(x2 - 27 - sh, y2 + 7 + sh, x2 - 27 - sh - sw, y2 + 4 + sh, false)
            draw_line(x2 - 25 - sh - sw, y2 + 7 + sh, x2 - 31 - sh - sw - sh, y2 + 1)
            draw_line(x2 - 26 - sh - sw, y2 + 7 + sh, x2 - 32 - sh - sw - sh, y2 + 1)
            draw_line(x2 - 27 - sh - sw, y2 + 7 + sh, x2 - 33 - sh - sw - sh, y2 + 1)

            draw_set_color(boxColor)
            draw_set_alpha(boxAlpha)
            draw_triangle(x2 - 22, y2 + 1, x2 - 26 - sh, y2 + 1, x2 - 26 - sh, y2 + 4 + sh, false)
            draw_rectangle(x2 - 27 - sh, y2 + 3 + sh, x2 - 27 - sh - sw, y2 + 1, false)
            draw_triangle(x2 - 27 - sh - sw, y2 + 1, x2 - 27 - sh - sw, y2 + 4 + sh, x2 - 31 - sh - sw - sh, y2 + 1, false)

            //draw name
            draw_text_outline_alpha(x2 - 27 - sh - sw, y2 + 1, name, txtColor, txtAlpha)
        }
    }


}

//draw instructions
instructions = "[" + key_get_name(key_shoot) + "] to advance"

if(skippable){
    instructions += ", [" + key_get_name(key_skip) + "] to skip."
}else{
    instructions += "."
}
draw_set_font(fontInstructions)

instSW = string_width(instructions)
instSH = string_height(instructions)
if(drawInstructions){
    if(imgSide = "Left"){
        draw_text_outline_alpha(x2 - 18 - instSW, y2 - 3 - instSH, instructions, txtColor, txtAlpha)
    }else{
        draw_text_outline_alpha(x1 + 18, y2 - 3 - instSH, instructions, txtColor, txtAlpha)
    }
}

draw_set_alpha(1)
