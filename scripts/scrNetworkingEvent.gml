// https://www.yoyogames.com/tech_blog/11 for tutorial

// show_debug_message("Networking event occurred")

var socket_id = ds_map_find_value( async_load, "id" );
var network_event_type = ds_map_find_value(async_load, "type");
var port = ds_map_find_value(async_load, "port");
var ip_addr_rx = ds_map_find_value(async_load, "ip");
var rx_buff = ds_map_find_value(async_load, "buffer");

// show_debug_message("Packet received from ip ="+string(ip_addr_rx)+", socket id ="+string(socket_id)+", port ="+string(port))

if network_event_type == network_type_connect
{
    scrNetworkConnect(ip_addr_rx, rx_buff)
}
else if network_event_type == network_type_disconnect
{
    scrClientDisconnected(ip_addr_rx)
}
else // network_event_type == network_type_data
{
    if is_undefined(rx_buff)
    {
        show_debug_message("Packet contents undefined")
    }
    else
    {
        if socket_id == global.socket_server_udp // received UDP broadcast packet
        {
            scrReceivedUDPPacket(rx_buff, ip_addr_rx)
        }
        else // received TCP data packet
        {
            scrReceivedDataPacket(rx_buff, socket_id)
        }
    }
}

// show_debug_message("Finished networking event")