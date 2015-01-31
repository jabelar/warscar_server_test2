///scrKickToSocket(socket_id)
// argument[0] is the player id (e.g. 0 is Player1, etc.)

// send packet to destroy remote client objects
buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, KICK)

scrSendPacketToSocket(global.tx_buff_server, argument[0])

with global.player_object[argument[0]]
{
    instance_destroy()
}