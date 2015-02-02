/// scrNextOpenPlayerID() returns -1 if no id available

for (i=0; i<global.max_num_players; i+=1)
{
    if global.player_object[i] < 0
    {
        show_debug_message("Slot "+string(i)+" available for player connection")
        return i
    }
}
show_debug_message("Slot not available for player connection")
return -1;
