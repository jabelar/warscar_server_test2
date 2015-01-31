///scrClientDisconnected(ip_addr)
// argument[0] is ip address

// show_debug_message("Logging out player from "+string(argument[0]))

// clear maps
var client_socket, client_id;
client_socket = ds_map_find_value(global.ip_socket_map, argument[0])
client_id = ds_map_find_value(global.socket_client_map, client_socket)

if client_socket > 0 // for some reason there can be disconnect from socket 0 (I think if no socket was created for ip sending disconnect)
{
    show_debug_message("Disconnecting player "+string(client_id+1)+" with IP address = "+string(argument[0])+" and socket = "+string(client_socket))

    ds_map_delete(global.client_socket_map, argument[0])
    ds_map_delete(global.socket_client_map, client_socket)
    ds_map_delete(global.socket_ip_map, client_socket)
    ds_map_delete(global.ip_socket_map, argument[0])
    
    if global.player_object[client_id] >= 0 and instance_exists(global.player_object[client_id])
    {
        // destroy the player object remotely
        scrDestroyObject(global.player_object[client_id])
        // destroy the player object locally
        show_debug_message("Destroying local object with id = "+string(global.player_object[client_id]))
        with global.player_object[client_id]
        {
            // instance_destroy()
        }
        global.player_object[client_id]=-1
    }
    // global.num_players--
}
else
{
    show_debug_message("Received IP address not associated to a socket")
}
scrGetNumPlayers() // for debug output
