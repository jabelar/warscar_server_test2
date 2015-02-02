with objBullet
{
    // show_debug_message("Checking objBullet for collisions")
    // check for collisions with players
    collision_id = collision_line(x, y, x+speed, y, objPlayer, true, true);
    if collision_id > 0 and collision_id != id.fired_by_id // don't shoot self
    {
        show_debug_message("Bullet collision with player")
        scrIncrementScore(scrGetPlayerFromInstance(fired_by_id), 1)
        scrDecrementHealth(scrGetPlayerFromInstance(collision_id), 25)
        scrDestroyObject(self.id)
    }
    
    // check for collisions with obstacles
    collision_id = collision_line(x, y, x+speed, y, objObstacle, true, true);
    if collision_id > 0
    {
        show_debug_message("Bullet collision with obstacle")
        effect_create_above(ef_explosion, x, y, 2, c_gray)
        scrSendCreateEffect(ef_explosion, x, y, 2, c_gray)
        scrDestroyObject(collision_id)
        scrDestroyObject(self.id)
    }
}