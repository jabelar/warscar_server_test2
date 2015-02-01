with objBullet
{
    // show_debug_message("Checking objBullet for collisions")
    collision_id = collision_line(x, y, x+speed, y, objPlayer, true, true);
    if collision_id > 0 and collision_id != id.fired_by_id // don't shoot self
    {
        show_debug_message("Bullet collision")
        effect_create_above(ef_explosion, x, y, 2, c_red)
        scrSendCreateEffect(ef_explosion, x, y, 2, c_red)
        with collision_id
        {
            x = irandom(room_width)
            y = irandom(room_height)
            while not place_free(x, y)
            {
                x = irandom(room_width)
                y = irandom(room_height)
            }
        }
        // send packet to create obstacle on remote client
        scrSendObjectUpdate(collision_id)
        scrDestroyObject(self.id)
    }
    collision_id = collision_line(x, y, x+speed, y, objObstacle, true, true);
    if collision_id > 0
    {
        show_debug_message("Bullet collision")
        effect_create_above(ef_explosion, x, y, 2, c_gray)
        scrSendCreateEffect(ef_explosion, x, y, 2, c_gray)
        scrDestroyObject(collision_id)
        scrDestroyObject(self.id)
    }
}
