var str = "";
for(i = 0; i < buffer_get_size(argument0); i++)
    str += string(buffer_peek(argument0, i, buffer_u8)) + " ";
return str;
