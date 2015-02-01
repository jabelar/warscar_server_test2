/// scrDecrementAmmo(player_id)
var player_id = argument[0]

global.player_ammo[player_id] -= 1
if global.player_ammo[player_id] < 0 then global.player_ammo[player_id] = 0

scrSendHUD()

