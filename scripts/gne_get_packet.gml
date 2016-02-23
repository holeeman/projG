if(ds_map_find_value(async_load,"type")==network_type_data){
    var r = ds_map_find_value(async_load, "buffer"), 
        size = ds_map_find_value(async_load, "size"),
        buf;
    ds_list_add(debug, "raw : "+packet_sniff(r))
    while(buffer_tell(r)<size){
        if(UNFINISHED_COUNT > 0){
            write_ubyte(UNFINISHED_MESSAGE, read_ubyte(r));
            UNFINISHED_COUNT --;
            if(UNFINISHED_COUNT == 0){
                ds_list_add(debug, "unf : "+packet_sniff(UNFINISHED_MESSAGE))
                buffer_seek(UNFINISHED_MESSAGE, buffer_seek_start, 0);
                ds_queue_enqueue(MESSAGE_QUEUE, UNFINISHED_MESSAGE);
                UNFINISHED_MESSAGE = noone;
            }
        }        
        else{
            header = read_ubyte(r);
            length = read_ushort(r);
            if(header == HEADER && length > 0){
                // header is valid
                buf = buffer_create(length, buffer_fixed, 1);
                for (i = 0; i < length; i++){
                    if(buffer_tell(r)==size){
                        // if packet is split
                        UNFINISHED_COUNT = length-i;
                        UNFINISHED_MESSAGE = buffer_create(length, buffer_fixed, 1);
                        buffer_copy(buf, 0, i+1, UNFINISHED_MESSAGE, 0);
                        buffer_seek(UNFINISHED_MESSAGE, buffer_seek_start, i);
                        buffer_delete(buf);
                        break;
                        }
                    write_ubyte(buf, read_ubyte(r))
                }
                if(UNFINISHED_COUNT == 0){
                    buffer_seek(buf, buffer_seek_start, 0);
                    ds_queue_enqueue(MESSAGE_QUEUE, buf);
                }
            }
        }
    }
}
