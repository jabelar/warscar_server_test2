/// scrInitializeBuffers()

show_debug_message("Creating transmit buffer")
global.tx_buff_server = buffer_create( 256, buffer_grow, 1)
global.tx_buff_broadcast = buffer_create( 256, buffer_grow, 1)
global.tx_buff_client = buffer_create( 256, buffer_grow, 1)
global.tx_buff_local_client = buffer_create( 256, buffer_grow, 1)
