/// scrSendPacketToPlayer(tx_buff, player_id)
// argument[0[ is transmit buffer
// argument[1] is player index (0 is Player1, etc.)
if global.player_object[argument[1]] >= 0
{
    var socket_client;
    
    socket_client = ds_map_find_value(global.client_socket_map, argument[1])
    scrSendPacketToSocket(argument[0], socket_client)
    // show_debug_message("Sending packet to player "+string(argument[1]+1))
}
else
{
    show_debug_message("Trying to send packet to player that doesn't exist")
}

