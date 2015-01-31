// https://www.yoyogames.com/tech_blog/11 for tutorial

// show_debug_message("Networking event occurred")

var socket_id = ds_map_find_value( async_load, "id" )
var network_event_type = ds_map_find_value(async_load, "type")
var port = ds_map_find_value(async_load, "port")
var ip_addr_rx = ds_map_find_value(async_load, "ip")
var rx_buff = ds_map_find_value(async_load, "buffer")

// show_debug_message("Packet received from ip ="+string(ip_addr_rx)+", socket id ="+string(socket_id)+", port ="+string(port))

if network_event_type == network_type_connect
{
    added_socket_id = ds_map_find_value(async_load, "socket")
    ds_map_replace(global.socket_ip_map, added_socket_id, ip_addr_rx)
    ds_map_replace(global.ip_socket_map, ip_addr_rx, added_socket_id)
    if ip_addr_rx != global.ip_addr_server // remote connection
    {
        show_debug_message("Remote network type connect received on socket = "+string(added_socket_id)+", ip address ="+ip_addr_rx)
        global.socket_client = added_socket_id
        global.server_state = CONNECTED
        show_debug_message("Players before connect = "+string(global.num_players)+" and max num players = "+string(global.max_num_players))
        if global.num_players < global.max_num_players // let client connect
        {
            global.num_players++
            show_debug_message("Assigning socket to Player "+string(global.num_players))
            ds_map_replace(global.client_socket_map, global.num_players-1, added_socket_id)
            ds_map_replace(global.socket_client_map, added_socket_id, global.num_players-1)
            // if room != roomLobby then scrSendCreateAll()
        }
        else
        {
            show_debug_message("Game already has enough players")
            scrSendKickToSocket(added_socket_id)
            // TO DO
            // Should probably put a kick plus network destroy here?
        }
        if global.num_players >= global.max_num_players // all players here so start
        {
                    if room != room0 then room_goto(room0)
        }

    }
    else // local connection
    {
        show_debug_message("Local network type connect received on socket = "+string(added_socket_id)+", ip address ="+ip_addr_rx)
        global.socket_local_server_side = added_socket_id
        if global.num_players < global.max_num_players
        {
            global.num_players++
            show_debug_message("Assigning socket to Player "+string(global.num_players))
            ds_map_replace(global.client_socket_map, global.num_players-1, added_socket_id)
            ds_map_replace(global.socket_client_map, added_socket_id, global.num_players-1)
        }
        else
        {
            show_debug_message("Game already has enough players")
            // TO DO
            // Should probably put a kick plus network destroy here?
        }
    }
}
else if network_event_type == network_type_disconnect
{
    show_debug_message("Network disconnected from IP address = "+string(ip_addr_rx)+" socket ID = "+string(socket_id))
    scrClientDisconnected(ip_addr_rx)
}
else if ip_addr_rx == global.ip_addr_server // local
{
    if is_undefined(rx_buff)
    {
        show_debug_message("Packet contents undefined")
    }
    else
    {
        packet_type = buffer_read(rx_buff, buffer_u8)
        switch packet_type
        {
            case INPUT:
            {
                // show_debug_message("Local player input packet received")
                
                key_up[0] = buffer_read(rx_buff, buffer_bool)
                key_down[0] = buffer_read(rx_buff, buffer_bool)
                key_right[0] = buffer_read(rx_buff, buffer_bool)
                key_left[0] = buffer_read(rx_buff, buffer_bool)
                key_weapon[0] = buffer_read(rx_buff, buffer_bool)
                break;
            }
            default: // unrecognized packet type
            {
                show_debug_message("Unrecognized packet type")
            }
        }
    }
}
else // from remote
{
    if is_undefined(rx_buff)
    {
        show_debug_message("Packet contents undefined")
    }
    else
    {
        if socket_id == global.socket_server_udp
        {
            packet_type = buffer_read(rx_buff, buffer_u8)
            switch packet_type
            {
                case SERVER_ANNOUNCE:
                {
                    global.my_ip_address = ip_addr_rx
                    // show_debug_message("My IP address = "+global.my_ip_address+", my server name = "+buffer_read(rx_buff, buffer_string))
                    break;
                }
                case CLIENT_ANNOUNCE:
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
        }
        else
        {
            packet_type = buffer_read(rx_buff, buffer_u8)
            var player_id ;
            for (var i=0; i<global.max_num_players; i++)
            {
                if ds_map_find_value(global.client_socket_map, i) == socket_id
                {
                    player_id = i
                    // show_debug_message("Packet from player = "+string(player_id+1))
                }
            }
            switch packet_type
            {
                case INPUT:
                {
                    // show_debug_message("Remote input packet received")
                    key_up[player_id] = buffer_read(rx_buff, buffer_bool)
                    key_down[player_id] = buffer_read(rx_buff, buffer_bool)
                    key_right[player_id] = buffer_read(rx_buff, buffer_bool)
                    key_left[player_id] = buffer_read(rx_buff, buffer_bool)
                    key_weapon[player_id] = buffer_read(rx_buff, buffer_bool)
                    // show_debug_message("key_up ="+string(key_up[1]))
                    break;
                }
                default: // unrecognized packet type
                {
                    show_debug_message("Unrecognized packet type")
                }
            }
        }
    }
}
