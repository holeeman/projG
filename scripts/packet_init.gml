///packet_init(buffer, message_id)
buffer_seek(argument0, buffer_seek_start, 0);
buffer_write(argument0, buffer_u8, HEADER)
for (i = 0; i < 11; i++){
    buffer_write(argument0, buffer_u8, 0)
}
buffer_write(argument0, buffer_u16, argument1)
