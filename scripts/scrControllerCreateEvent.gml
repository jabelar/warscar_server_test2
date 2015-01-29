show_debug_message("Controller create event started")
show_debug_message("Running server side")

scrConstants()

alarm[0] = room_speed * 3

global.server_state = DISCONNECTED

scrInitializeNetworking()

scrClearInput(PLAYER1)
scrClearInput(PLAYER2)

global.object_map = ds_map_create() // will contain list of all objects by id and type
