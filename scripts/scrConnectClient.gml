/// scrConnectClient(open_slot, added_socket_id)
var open_slot = argument[0];
var added_socket_id = argument[1];

global.player_object[open_slot]=0 // not valid id but helps indicate connection in non game room like 
show_debug_message("Assigning socket to Player "+string(open_slot+1)+" so number players = "+string(scrGetNumPlayers()))
ds_map_replace(global.client_socket_map, open_slot, added_socket_id)
ds_map_replace(global.socket_client_map, added_socket_id, open_slot)
// scrShowMapContents(global.socket_client_map)

if room != roomLobby // already in game
{
    global.player_object[open_slot] = instance_create(irandom(room_width), irandom(room_height), objPlayer)
    with global.player_object[open_slot] // find free random location
    {
        while not place_free(x, y)
        x = irandom(room_width)
        y = irandom(room_height)
    }
    scrSendCreateAll()
}
// scrShowPlayerArray() // just want to see debug output
