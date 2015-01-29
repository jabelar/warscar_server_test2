// argument0 is effect type constant
// argument1 is effect x position
// argument2 is effect y position
// argument3 is effect size
// argument4 is effect color constant
buffer_seek(tx_buff_server, buffer_seek_start, 0)
buffer_write(tx_buff_server, buffer_u8, EFFECT_CREATE)
buffer_write(tx_buff_server, buffer_u32, argument[0])
buffer_write(tx_buff_server, buffer_u32, argument[1])
buffer_write(tx_buff_server, buffer_u32, argument[2])
buffer_write(tx_buff_server, buffer_u32, argument[3])
network_send_packet( socket_client, tx_buff_server, buffer_tell(tx_buff_server) )
