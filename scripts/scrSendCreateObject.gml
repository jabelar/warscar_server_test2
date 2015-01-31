// argument[0] is object_type constant
// argument[1] is instance of local object
buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, OBJ_CREATE)
buffer_write(global.tx_buff_server, buffer_u8, argument[0])
buffer_write(global.tx_buff_server, buffer_u32, argument[1].id)
buffer_write(global.tx_buff_server, buffer_s32, argument[1].x)
buffer_write(global.tx_buff_server, buffer_s32, argument[1].y)
buffer_write(global.tx_buff_server, buffer_s32, argument[1].speed)
buffer_write(global.tx_buff_server, buffer_s32, argument[1].direction)
buffer_write(global.tx_buff_server, buffer_u8, argument[1].image_index)
buffer_write(global.tx_buff_server, buffer_u8, argument[1].image_speed)
buffer_write(global.tx_buff_server, buffer_u8, argument[1].image_alpha)

show_debug_message("Sending create object packet to all clients")
scrSendPacketToAll(global.tx_buff_server)

