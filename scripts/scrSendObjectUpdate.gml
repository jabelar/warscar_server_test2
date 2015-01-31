// argument[0] is the object id
buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, OBJ_UPDATE) // send object positions
buffer_write(global.tx_buff_server, buffer_u32, argument[0].id)
buffer_write(global.tx_buff_server, buffer_s32, argument[0].x)
buffer_write(global.tx_buff_server, buffer_s32, argument[0].y)
buffer_write(global.tx_buff_server, buffer_s32, argument[0].speed)
buffer_write(global.tx_buff_server, buffer_s32, argument[0].direction)
buffer_write(global.tx_buff_server, buffer_u8, argument[0].image_index)
buffer_write(global.tx_buff_server, buffer_u8, argument[0].image_speed)
buffer_write(global.tx_buff_server, buffer_u8, argument[0].image_alpha)

scrSendPacketToAll(global.tx_buff_server)

// show_debug_message("Sending packet to update instance "+string(argument[0]))

