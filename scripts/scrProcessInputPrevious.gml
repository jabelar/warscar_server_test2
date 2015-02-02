/// scrProcessInputPrevious
var player_id = argument[0];

// show_debug_message("Processing input for player "+string(player_id)+" with instance id = "+string(global.player_object[player_id]))

// need to use with so that instance_place works with correct collision mask
with global.player_object[player_id]
{
    var dist_x = lengthdir_x(8, image_angle);
    var dist_y = lengthdir_y(8, image_angle);
    if other.key_down[player_id]
    {
        if not instance_place(x-dist_x/2, y-dist_y/2, objObstacle)
        {
            x -= dist_x/2
            y -= dist_y/2
        }
    }
    if other.key_up[player_id]
    {
        if not instance_place(x+dist_x, y+dist_y, objObstacle) 
        {
            x += dist_x
            y += dist_y
        }
    }
    if other.key_right[player_id]
    {
        direction -= 5
        image_angle = direction
    }
    if other.key_left[player_id]
    {
        direction += 5
        image_angle = direction
    }

    if x < 0 then x = room_width
    if x > room_width then x = 0
    if y < 0 then y = room_height
    if y > room_height then y = 0

    if other.key_weapon[player_id] and global.player_ammo[player_id] > 0
    {
        scrDecrementAmmo(player_id)
        new_instance = instance_create(x, y, objBullet)
        new_instance.speed = 32
        new_instance.direction = direction // irandom(360)
        new_instance.image_angle = new_instance.image_angle
        new_instance.fired_by_id = id
        show_debug_message("Creating bullet at x = "+string(new_instance.x)+" y = "+string(new_instance.y)+" speed = "+string(new_instance.speed)+" direction = "+string(new_instance.direction))
        scrSendCreateObject(BULLET, new_instance)
        audio_play_sound_at(sndMainGun, x, y, 0, room_width*1.5, room_width*2, 1, false, 100)
        scrSendPlaySound(MAIN_GUN, x, y)
    }
}