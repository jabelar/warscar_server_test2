/// scrProcessInputNew

scrClearInput(0)

key_up[0] = gamepad_button_check(1, gp_padu) or gamepad_axis_value(1, gp_axislv) < -0.05
key_down[0] = gamepad_button_check(1, gp_padd) or gamepad_axis_value(1, gp_axislv) > 0.05
key_right[0] = gamepad_button_check(1, gp_padr) or gamepad_axis_value(1, gp_axislh) > 0.05
key_left[0] = gamepad_button_check(1, gp_padl) or gamepad_axis_value(1, gp_axislh) < -0.05

key_weapon[0] = gamepad_button_check_pressed(1, gp_face1) or gamepad_button_check_pressed(1, gp_shoulderr) or gamepad_button_check_pressed(1, gp_shoulderrb)
