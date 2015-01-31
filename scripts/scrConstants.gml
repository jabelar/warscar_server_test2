// server state
globalvar DISCONNECTED, BROADCASTING, CONNECTED;
DISCONNECTED = 0
BROADCASTING = 1
CONNECTED = 2

// client monitoring
globalvar CLIENT_TIMEOUT;
CLIENT_TIMEOUT = room_speed * 60

// packet types to client
// ** THESE MUST BE SAME VALUES ON CLIENT SIDE
globalvar OBJ_CREATE, OBJ_POS, OBJ_DESTROY, SOUND_PLAY, EFFECT_CREATE, KICK;
OBJ_CREATE = 0
OBJ_UPDATE = 1
OBJ_DESTROY = 2
SOUND_PLAY = 3
EFFECT_CREATE = 4
KICK = 5

// broaccast packet types
globalvar SERVER_ANNOUNCE;
SERVER_ANNOUNCE = 0
CLIENT_ANNOUNCE = 1

// packet types from client
globalvar INPUT;
INPUT = 0

// object types
globalvar OBSTACLE, FLAG, BULLET, PLAYER;
OBSTACLE = 0
FLAG = 1
BULLET = 2
PLAYER = 3

// sound types
globalvar MAIN_GUN;
MAIN_GUN = 0
