// argument[0] is player constant (to allow multiple local controllers as well)
buffer_seek(global.tx_buff_local_client, buffer_seek_start, 0)
buffer_write(global.tx_buff_local_client, buffer_u8, NF_INPUT) // send input
buffer_write(global.tx_buff_local_client, buffer_bool, key_up[argument[0]])
buffer_write(global.tx_buff_local_client, buffer_bool, key_down[argument[0]])
buffer_write(global.tx_buff_local_client, buffer_bool, key_right[argument[0]])
buffer_write(global.tx_buff_local_client, buffer_bool, key_left[argument[0]])
buffer_write(global.tx_buff_local_client, buffer_bool, key_weapon[argument[0]])

network_send_packet( global.socket_local_client_side, global.tx_buff_local_client, buffer_tell(global.tx_buff_local_client) )

// show_debug_message("Sending player input packet")
