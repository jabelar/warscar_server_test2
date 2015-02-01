/// scrSendPacketToPlayer(tx_buff, player_id)
var tx_buff = argument[0];
var player_id = argument[1];

if global.player_object[player_id] >= 0
{
    var socket_id = ds_map_find_value(global.client_socket_map, player_id);
    if not is_undefined(socket_id)
    {
        scrSendPacketToSocket(tx_buff, socket_id)
        // show_debug_message("Sending packet to player "+string(player_id+1))
    }
    else
    {
        show_debug_message("The client socket map is undefined for socket = "+string(socket_id))
        scrShowMapContents(global.client_socket_map)
    }
}
else
{
    show_debug_message("Trying to send packet to player that doesn't exist")
}

