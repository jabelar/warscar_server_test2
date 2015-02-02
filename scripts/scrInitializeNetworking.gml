show_debug_message("Running server side")

global.my_ip_address = "127.0.0.1" // will update when self-check actual IP address

scrInitializeMaps()
scrInitializeSockets() 
scrInitializeBuffers()

// start server broadcast alarm
global.broadcast_alarm = room_speed * 3
