switch room
{
    case roomLAN:
    {
        draw_set_font(font0)
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_text(room_width/2, room_height/2, "My IP Address = "+string(global.my_ip_address))
        break;
    }
    case room0:
    {
        break;
    }
}
