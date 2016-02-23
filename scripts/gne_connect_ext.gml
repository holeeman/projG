///gne_connect_ext(socket, url, port, timeout)
network_connect_raw(argument0, argument1, argument2);
CONNECT_TIMEOUT = argument3

var b = buffer_create(1, buffer_grow, 1);
packet_init(b, 0);
network_send_raw(argument0, b, buffer_tell(b));
buffer_delete(b);
