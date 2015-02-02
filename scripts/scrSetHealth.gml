/// scrSetHealth(player_id, value)
var player_id = argument[0]
var value = argument[1];

global.player_health[player_id]=value
scrSendHUD()
