/// scrServerBroadcastAlarm()

// broadcast server info

// only broadcast when slots are free for players to join
if scrGetNumPlayers() < global.max_num_players
{
    show_debug_message("Sending broadcast message")
    
    buffer_seek(global.tx_buff_broadcast, buffer_seek_start, 0)
    buffer_write(global.tx_buff_broadcast, buffer_u8, NF_SERVER_ANNOUNCE)
    buffer_write(global.tx_buff_broadcast, buffer_string, "WarScar Server #1")
    network_send_broadcast( global.socket_broadcast, 6512, global.tx_buff_broadcast, buffer_tell(global.tx_buff_broadcast) )
}
alarm[11] = room_speed * 3
