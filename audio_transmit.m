function audio_transmit(aTextMessage,aSoundFile)
%TRANSMIT embeds data into a song
%   
%   Example use:
%   >>  audio_transmit('message.txt','hello.wav')

disp (' ');
disp ('=======================================');
disp ('Mobile Computing: Audiocom transmitter.');
disp ('---------------------------------------');

cd Transform

embed_and_save('mono','message',aTextMessage, 'theSoundFile',cell2mat(strsplit (aSoundFile, ".wav")), 'redundancy_coding',true,'redundancy_factor',3)

%%
cd ..

end

