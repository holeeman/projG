///gne_connect(socket, url, port)
network_connect_raw(argument0, argument1, argument2);

var b = buffer_create(1, buffer_grow, 1);
packet_init(b, 1);
network_send_raw(argument0, b, buffer_tell(b));
