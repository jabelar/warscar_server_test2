/// scrSendHUD()

buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, NF_HUD)
buffer_write(global.tx_buff_server, buffer_u8, global.max_num_players)
for (var i=0; i<global.max_num_players; i++)
{
    buffer_write(global.tx_buff_server, buffer_bool, (global.player_object[i]>=0))
    buffer_write(global.tx_buff_server, buffer_u32, global.player_score[i])
    buffer_write(global.tx_buff_server, buffer_u32, global.player_health[i])
    buffer_write(global.tx_buff_server, buffer_u32, global.player_ammo[i])
}

show_debug_message("Sending HUD packet to all clients")
scrSendPacketToAll(global.tx_buff_server)