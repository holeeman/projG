if(ds_map_find_value(async_load,"type")==network_type_data){
    var r = ds_map_find_value(async_load, "buffer"), 
        size = ds_map_find_value(async_load, "size"),
        buf;
    while(buffer_tell(r)<size){
    if(read_ubyte(r) == HEADER)
    {
        length = read_ushort(r);
        buf = buffer_create(length, buffer_fixed, 1);
        for (i = 0; i < length; i++){
            if(buffer_tell(r)==size)
                show_message("Packet Split");
            write_ubyte(buf, read_ubyte(r))
        }
        buffer_seek(buf, buffer_seek_start, 0);
        ds_queue_enqueue(MESSAGE_QUEUE, buf);
        //show_message(string(buffer_tell(r))+"/"+string(size))
    }
    }
}
