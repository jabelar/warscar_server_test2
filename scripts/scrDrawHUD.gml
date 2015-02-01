/// scrDrawHUD

draw_set_font(font1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
for (var i=0; i<global.max_num_players; i++)
{
    if global.player_object[i] >= 0
    {
        draw_text(10, 10+50*i, "P"+string(i+1)+" score = "+string(global.player_score[i]))
        draw_text(300, 10+50*i, "Health = "+string(global.player_health[i]))
        draw_text(600, 10+50*i, "Ammo = "+string(global.player_ammo[i]))
    }
    else
    {
        // draw_text(10, 10+50*i, "P"+string(i+1)+" not connected")
    }
}    

