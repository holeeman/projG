///write_string(buffer, string)
buffer_write(argument0, buffer_u16, 0)
buffer_write(argument0, buffer_string, argument1)
buffer_poke(argument0, buffer_tell(argument0)- string_byte_length(argument1) -2,buffer_u8, string_byte_length(argument1))
