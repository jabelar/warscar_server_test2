/// scrNetworkConnect(ip_addr_rx, rx_buff)

var ip_addr_rx = argument[0];
var rx_buff = argument[1]

var added_socket_id = ds_map_find_value(async_load, "socket");

ds_map_replace(global.socket_ip_map, added_socket_id, ip_addr_rx)
ds_map_replace(global.ip_socket_map, ip_addr_rx, added_socket_id)

show_debug_message("Network type connect received on socket = "+string(added_socket_id)+", ip address ="+ip_addr_rx)
global.server_state = CONNECTED

show_debug_message("Trying to connect player")
// check if there is slot open for player
var open_slot = scrNextOpenPlayerID();
scrGetNumPlayers() // for debug output
if open_slot >= 0 // let client connect
{
    scrConnectClient(open_slot, added_socket_id)
}
else
{
    show_debug_message("Game already has enough players")
    // scrSendKickToSocket(added_socket_id)
    // TO DO
    // Should probably put a kick plus network destroy here?
}

// check if all players have joined and start game
if room == roomLobby
{
    if scrGetNumPlayers() >= global.max_num_players
    {
                if room != room0 then room_goto(room0)
    }
}