show_debug_message("Starting step event")

switch room
{
    case roomLobby:
    {
        global.server_state = BROADCASTING
        global.status_string = "Broadcasting from "+global.ip_addr_server
        
        break;
    }
    case room0:
    {

        // process new input
        scrProcessInputNew(0) // only player 1 because new input for other players comes through networking event
        
        // send local input to server
        scrSendLocalInput(0)
        
        // send position updates to remote client 
        // send player position updates
        for (var i=0; i<global.max_num_players; i++)
        {
            if global.player_object[i] >= 0 
            {
                // process previous input
                scrProcessInputPrevious(i)
                
                // update remote clients
                scrSendObjectUpdate(global.player_object[i])
            } 
        }    
        
        // process collisions
        scrCheckCollisions()
        
        break;
    }
}

