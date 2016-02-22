///gne_disconnect(socket)
var _buf = buffer_create(1,buffer_grow,1);
packet_init(_buf, 101);
network_send_raw(s, _buf, buffer_tell(_buf));
network_destroy(argument0)
