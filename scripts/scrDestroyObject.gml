/// scrDestroyObject(obj_id)
var obj_id = argument[0];
var obj_x = obj_id.x;
var obj_y = obj_id.y;

// send packet to destroy remote client objects
buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, NF_OBJ_DESTROY)
buffer_write(global.tx_buff_server, buffer_u32, obj_id)

scrSendPacketToAll(global.tx_buff_server)
with obj_id
{
    instance_destroy()
}
show_debug_message("Sending destroy object for object at x = "+string(obj_x)+" y = "+string(obj_y))
