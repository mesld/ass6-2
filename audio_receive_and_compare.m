function audio_receive_and_compare(aTextMessage,aSoundFile)

pkg load signal

disp (' ');
disp ('=======================================');
disp ('Mobile Computing: Audiocom receiver.   ');
disp ('---------------------------------------');

cd Transform

extract_recorded('message',aTextMessage, 'theSoundFile',aSoundFile, 'redundancy_coding',true,'redundancy_factor',3)

cd ..

end

