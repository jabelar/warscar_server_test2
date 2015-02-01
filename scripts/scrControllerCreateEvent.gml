show_debug_message("Controller create event started")
show_debug_message("Running server side")

scrConstants()

alarm[0] = room_speed * 3

global.max_num_players = 4
global.min_num_players = 2
global.wait_for_full_lobby = false
global.allow_join_ingame = true

// initialize player attributes
for (var i=0; i<global.max_num_players; i++)
{
    global.player_score[i] = 0
    global.player_health[i] = 100
    global.player_ammo[i] = 10
}

// create maps
global.client_socket_map = ds_map_create()
global.socket_client_map = ds_map_create()
global.socket_ip_map = ds_map_create()
global.ip_socket_map = ds_map_create()

// initialize client maps
for (var i=0; i<global.max_num_players; i++)
{
    scrClearInput(i)
    ds_map_add(global.client_socket_map, i, -1) // start all clients as disconnected
    ds_map_add(global.socket_client_map, -1, i)
    global.player_object[i] = -1
}

scrInitializeNetworking()

gamepad_set_axis_deadzone(1, 0.2);
gamepad_set_axis_deadzone(2, 0.2);

show_debug_message("Controller create event finished")
