/// scrShowPlayerArray()

for (i=0; i<global.max_num_players; i+=1)
{
    show_debug_message("Player object array index = "+string(i)+" has value = "+string(global.player_object[i]))
}