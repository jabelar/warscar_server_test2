switch room
{
    case roomLobby:
    {
        draw_set_font(font0)
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_text(room_width/2, room_height/2, "I'm a server at IP Address = "+string(global.my_ip_address))
        for (i=0; i<global.num_players; i++)
        {
            draw_text(room_width/2, room_height/2+100*(i+1), "Remote client connected with socket = "+string(ds_map_find_value(global.client_socket_map, i)))
        }
        break;
    }
    case room0:
    {
        break;
    }
}
