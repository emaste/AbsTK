local abstk = require 'abstk'

abstk.set_mode(...)

-- Create wizard
local wizard = abstk.new_wizard("AbsTK Complete Test", 400, 300)

-- Create screens
local scr1 = abstk.new_screen("Labels Module")
local scr2 = abstk.new_screen("Buttons Module")
local scr3 = abstk.new_screen("Images Module")
local scr4 = abstk.new_screen("Lists Module")
local scr5 = abstk.new_screen("Text Input Module")

-- Fill the first screen
scr1:add_label('label1', 'Parameter 1:\t\t1234')
scr1:add_label('label2', 'Parameter 2:\t\tABCD')
scr1:add_label('label3', 'Parameter 3:\t\tWXYZ')

-- Fill the second screen
scr2:add_label('label1', 'Simple Buttons')
scr2:add_button('bt1', 'Button1')
scr2:add_button('bt2', 'Button2')
scr2:add_label('label2', 'ButtonBox')
scr2:create_button_box('bbox', {'A', 'B', 'C', 'D'}, 'SPREAD')
scr2:add_label('label3', 'ComboBox (Simple)')
scr2:create_combobox('cbox1', {'Label1', 'Label2', 'Label3'}, 'SIMPLE')
local t = {
  { name = "Parent1", "Leaf1", "Leaf2", "Leaf3"}, 
  { name = "Parent2", "Leaf4", "Leaf5", "Leaf6"},
  { name = "Parent3", "Leaf7", "Leaf8", "Leaf9"},
}
scr2:add_label('label4', 'ComboBox (Tree)')
scr2:create_combobox('cbox2', t, 'TREE')

-- Fill the third screen
scr3:add_image('lua_img', 'imgs/lua.png')
scr3:add_image('batman_img', 'imgs/batman.png', {512, 384})

-- Fill the fourth screen
scr4:add_label('label1', 'CheckBoxes')
scr4:create_checklist('chklist1', {'a', 'b', 'c'})
scr4:add_label('label2', 'RadioButtons')
scr4:create_radiolist('rdlist', {'x', 'y', 'z'})
scr4:add_label('label3', 'Grid')
scr4:create_list('list', {'q', 'w', 'e', 'r', 't', 'y'})
scr4:add_label('label4', 'CheckList (if larger than 3, turns into grid)')
scr4:create_checklist('chklist2', {'1', '2', '3', '4'})

-- Fill the fifth screen
scr5:add_text_input('input1', 'Username')
scr5:add_text_input('input2', 'Password', true)
scr5:add_text_input('input3')
scr5:add_label('label', 'TextBox')
scr5:add_textbox('box')

-- Add all screens to wizard
wizard:add_page('screen1', scr1, 'INTRO')
wizard:add_page('screen2', scr2, 'PROGRESS')
wizard:add_page('screen3', scr3, 'PROGRESS')
wizard:add_page('screen4', scr4, 'PROGRESS')
wizard:add_page('screen5', scr5, 'CONFIRM')

-- Run wizard
wizard:run()