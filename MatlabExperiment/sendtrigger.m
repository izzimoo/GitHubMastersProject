function sendtrigger(trg,port,ioObj)

    io64(ioObj,port,trg);
    WaitSecs(0.005); 
    io64(ioObj,port,0);

end  