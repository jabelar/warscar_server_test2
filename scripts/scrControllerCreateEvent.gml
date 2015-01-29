show_debug_message("Controller create event started")

scrConstants()

alarm[0] = room_speed * 3

global.server_state = DISCONNECTED

show_debug_message("Running server side")

// Create socket for server
global.socket_server = network_create_server(network_socket_tcp, 6511, 3)
if global.socket_server < 0
{
    show_message("Network create for server socket failed")
}
else
{
    show_debug_message("Succesfully created server socket ="+string(global.socket_server))
}

// Create socket for broadcasts
global.socket_broadcast = network_create_socket(network_socket_udp)
if global.socket_broadcast < 0
{
    show_message("Network create for broadcast socket failed")
}
else
{
    show_debug_message("Succesfully created broadcast socket ="+string(global.socket_broadcast))
}

// Create socket for local client
global.ip_addr_server = "127.0.0.1" // on server the server is local

global.socket_local_client_side = network_create_socket(network_socket_tcp)
if global.socket_local_client_side < 0
{
    show_debug_message("Network create for local client socket failed")
}
else
{
    show_debug_message("Creating local client socket ="+string(global.socket_local_client_side))
}

// connect socket from local client to server
global.socket_local_server_side = network_connect(global.socket_local_client_side, global.ip_addr_server, 6511)
if global.socket_local_server_side < 0
{
    show_debug_message("Network connect from local client failed")
}
else
{
    show_debug_message("Network connect from local client succeeded")
}

// global.socket_client = network_create_socket(network_socket_tcp)

// create network buffer for sent messages
show_debug_message("Creating transmit buffer")
global.tx_buff_server = buffer_create( 256, buffer_grow, 1)
global.tx_buff_broadcast = buffer_create( 256, buffer_grow, 1)
// global.tx_buff_client = buffer_create( 256, buffer_grow, 1)
global.tx_buff_local_client = buffer_create( 256, buffer_grow, 1)

scrClearInput(PLAYER1)
scrClearInput(PLAYER2)

global.object_map = ds_map_create() // will contain list of all objects by id and type
