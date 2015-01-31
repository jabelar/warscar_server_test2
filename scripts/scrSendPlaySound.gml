// argument0 is sound type constant
// argument1 is sound x position
// argument2 is sound y position

buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, SOUND_PLAY)
buffer_write(global.tx_buff_server, buffer_u8, argument[0])
buffer_write(global.tx_buff_server, buffer_u32, argument[1])
buffer_write(global.tx_buff_server, buffer_u32, argument[2])

scrSendPacketToAll(global.tx_buff_server)

