// show_debug_message("Starting step event")

switch room
{
    case roomLobby:
    {
        // check if all players have joined and start game
        if global.wait_for_full_lobby
        {
            if scrGetNumPlayers() >= global.max_num_players
            {
                        if room != room0 then room_goto(room0)
            }
        }
        else
        {
            if scrGetNumPlayers() >= global.min_num_players
            {
                        if room != room0 then room_goto(room0)
            }
        }
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
        
        // destroy bullets that go outside the room
        with objBullet
        {
            if (x < 0) or (x > room_width) or (y < 0) or (y > room_height) 
            {
                scrDestroyObject(id)
            }     
        }    
        break;
    }
}

