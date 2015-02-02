show_debug_message("Controller create event started")

scrConstants()
scrInitializeNetworkGameVariables()
scrInitializeNetworking()

gamepad_set_axis_deadzone(1, 0.2);
gamepad_set_axis_deadzone(2, 0.2);

show_debug_message("Controller create event finished")
