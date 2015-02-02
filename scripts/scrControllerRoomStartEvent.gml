if room == room0
{
    obj_instances_number[OBSTACLE] = 0
    obj_instances_number[FLAG] = 0
    
    // populate obstacles
    randomize()
    var i
    for (i=0; i<10; i++)
    {
        var new_instance = instance_create(irandom(room_width), irandom(room_height), objObstacle);
        with new_instance
        {
            while not place_free(x, y)
            {
                x = irandom(room_width)
                y = irandom(room_height)
            }
        }
        // send packet to create obstacle on remote client
        scrSendCreateObject(OBSTACLE, new_instance)
    }
    
    // populate players
    randomize()
    var i
    for (i=0; i<global.max_num_players; i++)
    {
        if global.player_object[i] == 0 // connected but not previous instantiatd
        {
            global.player_object[i] = instance_create(irandom(room_width), irandom(room_height), objPlayer)
            with global.player_object[i]
            {
                while not place_free(x, y)
                {
                    x = irandom(room_width)
                    y = irandom(room_height)
                }
                image_blend = global.player_color[i]
            }
            // send packet to create obstacle on remote client
            scrSendCreateObject(PLAYER, global.player_object[i])
        }
        else if global.player_object[i] > 0 // object already instantiated
        {
            show_debug_message("Trying to create player object that already exists")
        }
    }

    scrSendHUD()
}