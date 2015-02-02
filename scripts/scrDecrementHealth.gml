/// scrDecrementHealth(player_id, value)
var player_id = argument[0]
var value = argument[1];

global.player_health[player_id] -= value
if global.player_health[player_id] < 0 then global.player_health[player_id] = 0

scrSendHUD()