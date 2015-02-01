/// scrSendCreateObject(obj_type, instance_id)
var obj_type = argument[0];
var inst_id = argument[1];

buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, OBJ_CREATE)
buffer_write(global.tx_buff_server, buffer_u8, obj_type)
buffer_write(global.tx_buff_server, buffer_u32, inst_id.id)
buffer_write(global.tx_buff_server, buffer_s32, inst_id.x)
buffer_write(global.tx_buff_server, buffer_s32, inst_id.y)
buffer_write(global.tx_buff_server, buffer_s32, inst_id.speed)
buffer_write(global.tx_buff_server, buffer_s32, inst_id.direction)
buffer_write(global.tx_buff_server, buffer_u8, inst_id.image_index)
buffer_write(global.tx_buff_server, buffer_u8, inst_id.image_speed)
buffer_write(global.tx_buff_server, buffer_u8, inst_id.image_alpha)
buffer_write(global.tx_buff_server, buffer_u32, inst_id.image_blend)

show_debug_message("Sending create object packet to all clients")
scrSendPacketToAll(global.tx_buff_server)
