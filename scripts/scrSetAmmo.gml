/// scrSetAmmo(player_id, value)
var player_id = argument[0]
var value = argument[1];

global.player_ammo[player_id]=value
scrSendHUD()
