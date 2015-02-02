/// scrSendPacketToPlayer(tx_buff, socket_id)
var tx_buff = argument[0];
var socket_id = argument[1];

if socket_id >= 0
{
    network_send_packet(socket_id, tx_buff, buffer_tell(tx_buff)) 
    // show_debug_message("Sending packet to socket "+string(argument[1]+1))
}
