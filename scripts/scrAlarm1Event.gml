// check remote clients are still connected and not timed out
for (i=1; i<global.num_players; i+=1)
{
    if not global.client_connected[i]
    {
        show_debug_message("Player "+string(i+1)+" dropped")
        scrClientDisconnected(i) 
    }
}

// reset all remaining client watchdogs
for (i=1; i<global.num_players; i+=1)
{
    global.client_connected[i] = false
}

alarm[1] = CLIENT_TIMEOUT

