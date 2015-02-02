/// scrSendObjectUpdate(inst_id)
var inst_id = argument[0];
 
buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, NF_OBJ_UPDATE) // send object positions
buffer_write(global.tx_buff_server, buffer_u32, inst_id.id)
buffer_write(global.tx_buff_server, buffer_s32, inst_id.x)
buffer_write(global.tx_buff_server, buffer_s32, inst_id.y)
buffer_write(global.tx_buff_server, buffer_s32, inst_id.speed)
buffer_write(global.tx_buff_server, buffer_s32, inst_id.direction)
buffer_write(global.tx_buff_server, buffer_u8, inst_id.image_index)
buffer_write(global.tx_buff_server, buffer_u8, inst_id.image_speed)
buffer_write(global.tx_buff_server, buffer_u8, inst_id.image_alpha)
buffer_write(global.tx_buff_server, buffer_u32, inst_id.image_blend)

scrSendPacketToAll(global.tx_buff_server)

// show_debug_message("Sending packet to update instance "+string(inst_id))
