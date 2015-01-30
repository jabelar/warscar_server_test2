// argument[0] is player constant
// show_debug_message("Processing input for player "+string(argument[0])+" with instance id = "+string(global.player_object[argument[0]]))

if key_down[argument[0]]
{
    if not instance_place(global.player_object[argument[0]].x, global.player_object[argument[0]].y+8, objObstacle) then global.player_object[argument[0]].y += 8
}
if key_up[argument[0]]
{
    if not instance_place(global.player_object[argument[0]].x, global.player_object[argument[0]].y-8, objObstacle) then global.player_object[argument[0]].y -= 8
}
if key_right[argument[0]]
{
    if not instance_place(global.player_object[argument[0]].x+8, global.player_object[argument[0]].y, objObstacle) then global.player_object[argument[0]].x += 8
}
if key_left[argument[0]]
{
    if not instance_place(global.player_object[argument[0]].x-8, global.player_object[argument[0]].y, objObstacle) then global.player_object[argument[0]].x -= 8
}

with objPlayer
{
    if x < 0 then x = room_width
    if x > room_width then x = 0
    if y < 0 then y = room_height
    if y > room_height then y = 0
}

if key_weapon[argument[0]]
{
    new_instance = instance_create(global.player_object[argument[0]].x, global.player_object[argument[0]].y, objBullet)
    new_instance.speed = 32
    new_instance.direction = 0 // irandom(360)
    scrSendCreateObject(BULLET, new_instance)
}
