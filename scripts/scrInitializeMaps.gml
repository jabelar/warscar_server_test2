/// scrInitializeMaps()


global.client_socket_map = ds_map_create()
global.socket_client_map = ds_map_create()
global.socket_ip_map = ds_map_create()
global.ip_socket_map = ds_map_create()

// players to socket mapping
for (var i=0; i<global.max_num_players; i++)
{
    scrClearInput(i)
    ds_map_add(global.client_socket_map, i, -1) // start all clients as disconnected
    ds_map_add(global.socket_client_map, -1, i)
    global.player_object[i] = -1
}

