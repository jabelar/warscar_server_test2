show_debug_message("Controller create event started")
show_debug_message("Running server side")

scrConstants()

alarm[0] = room_speed * 3

global.server_state = DISCONNECTED


global.max_num_players = 3
global.num_players = 0; // starts with none connected
global.client_socket_map = ds_map_create()

for (var i=0; i<global.max_num_players; i++)
{
    scrClearInput(i)
    ds_map_add(global.client_socket_map, i, -1) // start all clients as disconnected
}

scrInitializeNetworking()

show_debug_message("Controller create event finished")
