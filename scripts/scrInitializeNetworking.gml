global.my_ip_address = "127.0.0.1"

// Create TCP socket for server
global.socket_server = network_create_server(network_socket_tcp, 6511, 32)
if global.socket_server < 0
{
    show_debug_message("Network create for server socket failed")
}
else
{
    show_debug_message("Succesfully created server socket = "+string(global.socket_server))
}

// create UDP listener for broadcasts
global.socket_server_udp = network_create_server(network_socket_udp, 6512, 32)
if global.socket_server_udp < 0
{
    show_debug_message("Network create for broadcast listener failed")
}
else
{
    show_debug_message("Succesfully created broadcast listener = "+string(global.socket_server_udp))
}


// Create socket for broadcasts
global.socket_broadcast = network_create_socket(network_socket_udp)
if global.socket_broadcast < 0
{
    show_debug_message("Network create for broadcast socket failed")
}
else
{
    show_debug_message("Succesfully created broadcast socket = "+string(global.socket_broadcast))
}

// Create socket for local client
global.ip_addr_server = "127.0.0.1" // on server the server is local

global.socket_local_client_side = network_create_socket(network_socket_tcp)
while global.socket_local_client_side < 0
{
    show_debug_message("Network create for local client side socket failed")
}
show_debug_message("Successfully created local client side socket ="+string(global.socket_local_client_side))


// connect socket from local client to server
// socket will be assigned in the network event
global.socket_local_server_side = -1
var result = network_connect(global.socket_local_client_side, global.ip_addr_server, 6511);
if result < 0
{
    show_debug_message("Network connect from local client server side failed for socket = "+string(global.socket_local_client_side)+" and IP address = "+string(global.ip_addr_server))
    game_restart()
}

// create network buffer for sent messages
show_debug_message("Creating transmit buffer")
global.tx_buff_server = buffer_create( 256, buffer_grow, 1)
global.tx_buff_broadcast = buffer_create( 256, buffer_grow, 1)
global.tx_buff_client = buffer_create( 256, buffer_grow, 1)
global.tx_buff_local_client = buffer_create( 256, buffer_grow, 1)
