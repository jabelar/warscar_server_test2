// argument[0] is player constant
scrClearInput(argument[0])

if gamepad_button_check(1, gp_padd) then key_down[argument[0]] = true
if gamepad_button_check(1, gp_padu) then key_up[argument[0]] = true
if gamepad_button_check(1, gp_padr) then key_right[argument[0]] = true 
if gamepad_button_check(1, gp_padl) then key_left[argument[0]] = true

if gamepad_button_check_pressed(1, gp_shoulderr) or gamepad_button_check_pressed(1, gp_shoulderrb) then key_weapon[argument[0]] = true