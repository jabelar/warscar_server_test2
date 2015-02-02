/// scrGetNumPlayers()

var num_players = 0;
for (i=0; i<global.max_num_players; i+=1)
{
    if global.player_object[i] >= 0
    {
        num_players++
    }
}
return num_players