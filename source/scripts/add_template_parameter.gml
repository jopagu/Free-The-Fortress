//add_template_parameter(templateName, parameter, value)

templateName = argument0
parameter = argument1
value = argument2

t = ds_map_find_value(global.dialogueTemplates, templateName)

ds_map_add(t, parameter, value)
