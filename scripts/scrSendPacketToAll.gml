/// scrSendPacketToAll(tx_buff)
var tx_buff = argument[0];

var socket_id;

for (var i=1; i<global.max_num_players; i++)
{
    if global.player_object[i] >=0
    {
        scrSendPacketToPlayer(tx_buff, i)
        // show_debug_message("Sending packet to player "+string(i+1))
    }
}