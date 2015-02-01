/// scrReceivedDataPacket(rx_buff, socket_id)
var rx_buff = argument[0];
var socket_id = argument[1];

var rx_buff = argument[0];

var packet_type = buffer_read(rx_buff, buffer_u8);

var player_id = ds_map_find_value(global.socket_client_map, socket_id);

if not is_undefined(player_id)
{
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
else
{
    show_debug_message("Received packet from unmapped socket "+string(socket_id))
    scrShowMapContents(global.socket_client_map)
}
