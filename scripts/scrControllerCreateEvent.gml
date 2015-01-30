show_debug_message("Controller create event started")
show_debug_message("Running server side")

scrConstants()

alarm[0] = room_speed * 3

global.server_state = DISCONNECTED

scrInitializeNetworking()

global.num_players = 2

for (var i=0; i<global.num_players; i++)
{
    scrClearInput(i)
}

