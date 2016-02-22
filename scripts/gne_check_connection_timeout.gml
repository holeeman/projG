///gne_check_connection_timeout()
return (((current_time - CONNECT_START_TIME) > CONNECT_TIMEOUT) && (SOCKET_ID < 0));
