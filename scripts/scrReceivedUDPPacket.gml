/// scrReceivedUDPPacket(rx_buff, ip_addr_rx)
var rx_buff = argument[0];
var ip_addr_rx = argument[1];

var packet_type = buffer_read(rx_buff, buffer_u8);
switch packet_type
{
    case NF_SERVER_ANNOUNCE:
    {
        global.my_ip_address = ip_addr_rx
        // show_debug_message("My IP address = "+global.my_ip_address+", my server name = "+buffer_read(rx_buff, buffer_string))
        break;
    }
    case NF_CLIENT_ANNOUNCE:
    {
        show_debug_message("There is  client at "+ip_addr_rx)
        
        // clear watchdog timer for client connection
        var client_socket;
        client_socket = ds_map_find_value(global.ip_socket_map, ip_addr_rx)
        global.client_connected[ds_map_find_value(global.socket_client_map, client_socket)] = true
        break;
    }
    default:
    {
        show_debug_message("Unrecognized broadcast packet received")
        break;
    }
}
