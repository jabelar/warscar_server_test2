// argument[0] is the instance id to destroy

// send packet to destroy remote client objects
buffer_seek(tx_buff_server, buffer_seek_start, 0)
buffer_write(tx_buff_server, buffer_u8, OBJ_DESTROY)
buffer_write(tx_buff_server, buffer_u32, argument[0])
network_send_packet( socket_client, tx_buff_server, buffer_tell(tx_buff_server) )

// keep track of instances
ds_map_delete(object_map, argument[0])

with argument[0]
{
    instance_destroy()
}
