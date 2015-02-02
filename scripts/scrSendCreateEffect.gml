/// scrSendCreateEffect(effect_type, effect_x, effect_y, effect_size, effect_color)
var effect_type = argument[0]
var effect_x = argument[1]
var effect_y = argument[2]
var effect_size = argument[3]
var effect_color = argument[4]

buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, NF_EFFECT_CREATE)
buffer_write(global.tx_buff_server, buffer_u32, effect_type)
buffer_write(global.tx_buff_server, buffer_u32, effect_x)
buffer_write(global.tx_buff_server, buffer_u32, effect_y)
buffer_write(global.tx_buff_server, buffer_u32, effect_size)
buffer_write(global.tx_buff_server, buffer_u32, effect_color)

scrSendPacketToAll(global.tx_buff_server)
