// argument[0[ is transmit buffer
var socket_client;

for (var i=1; i<global.max_num_players; i++)
{
    socket_client = ds_map_find_value(global.client_socket_map, i);
    network_send_packet( global.socket_client, argument[0], buffer_tell(argument[0]) )
    // show_debug_message("Sending packet to player "+string(i+1))
}

