/// scrGetPlayerFromInstance(inst_id)
var inst_id = argument[0];

var player_id = -1;

show_debug_message("scrGetPlayerFromInstance for instance = "+string(inst_id))

for (var i=0; i<global.max_num_players; i++)
{
    show_debug_message("Player object "+string(i)+" is instance "+string(global.player_object[i])+" compared to instance "+string(instance_id))
    if global.player_object[i] == inst_id
    {
        player_id = i
    }
}

return player_id