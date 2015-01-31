///scrDestroyObject(obj_id)
// argument[0] is the instance id to destroy

// send packet to destroy remote client objects
buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, OBJ_DESTROY)
buffer_write(global.tx_buff_server, buffer_u32, argument[0])

scrSendPacketToAll(global.tx_buff_server)

show_debug_message("Sending destroy object")

