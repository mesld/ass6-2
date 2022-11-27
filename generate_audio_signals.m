function generate_audio_signals ()
  
  warning ("off", "Octave:future-time-stamp")
  pkg load signal;

  example_data00 = -1 + 2 * [1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ...
  0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0  ...
  0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ...
  0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1];
  
  example_data01 = -1 + 2 * [0 1 0 0 1 0 0 1 0 0 1 0 0 0 0 0 0 1 1 0 0 0 0 1 0 1 1 0 1 1 0 1 0 0 1 0 0 0 0 0 0 1 1 1 0 1 1 1 0 1 1 0 0 0 0 1 0 ...
  1 1 0 1 1 0 0 0 1 1 0 1 0 1 1 0 1 1 0 1 0 0 1 0 1 1 0 1 1 1 0 0 1 1 0 0 1 1 1 0 0 1 0 0 0 0 0 0 1 1 0 1 1 1 1 0 1 1 0 1 1  ...
  1 0 0 0 1 0 0 0 0 0 0 1 1 1 0 0 1 1 0 1 1 1 0 1 0 1 0 1 1 0 1 1 1 0 0 1 1 1 0 0 1 1 0 1 1 0 1 0 0 0 0 1 1 0 1 0 0 1 0 1 1 0 ...
  1 1 1 0 0 1 1 0 0 1 0 1 0 0 1 0 0 0 0 1];
  
  example_data02 = -1 + 2 * [0 1 0 0 0 0 0 1 0 1 1 0 1 1 1 0 0 1 1 0 0 1 0 0 0 0 1 0 0 0 0 0 0 1 1 0 0 1 0 0 0 1 1 0 1 1 1 1 0 1 1 0 0 1 0 1 0 ...
  1 1 1 0 0 1 1 0 1 1 0 1 1 1 0 0 0 1 0 0 1 1 1 0 1 1 1 0 1 0 0 0 0 1 0 0 0 0 0 0 1 1 0 1 0 0 1 0 1 1 1 0 1 0 0 0 0 1 0 0 0  ...
  0 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 0 1 0 1 1 0 0 1 0 1 0 1 1 0 1 1 0 0 0 0 1 0 0 0 0 0 0 1 1 0 0 1 1 1 0 1 1 0 1 1 1 1 0 1 1 0 ...
  1 1 1 1 0 1 1 0 0 1 0 0 0 0 1 0 0 0 0 1];
  
  example_data03 = ones (size(example_data01,2),1)';

  theNumOfBits = 10000;
  data = example_data01(1:min(theNumOfBits,size(example_data01,2))); 
  
  fs = 44100;
  bit_duration = 0.1;
  centerfreq_1kHz = 1000;
  centerfreq_2kHz = 2000;
  centerfreq_3kHz = 3000;
  centerfreq_4kHz = 4000;
  centerfreq_5kHz = 5000;
  centerfreq_6kHz = 6000;
  centerfreq_7kHz = 7000;
  centerfreq_8kHz = 8000;
  baseband_amplitude = 0.5;
  
  samples_per_bit = bit_duration * fs ;
  data_samples =  kron (data,ones(1,samples_per_bit));
  
  N_total = size(data,2);         % number of bits
  M_total = size(data_samples,2); % number of samples

  signal_baseband_carrier_1kHz = sin((1:M_total)/fs*2*pi*centerfreq_1kHz) * baseband_amplitude;
  signal_baseband_carrier_2kHz = sin((1:M_total)/fs*2*pi*centerfreq_2kHz) * baseband_amplitude;
  signal_baseband_carrier_3kHz = sin((1:M_total)/fs*2*pi*centerfreq_3kHz) * baseband_amplitude;
  signal_baseband_carrier_4kHz = sin((1:M_total)/fs*2*pi*centerfreq_4kHz) * baseband_amplitude;
  signal_baseband_carrier_5kHz = sin((1:M_total)/fs*2*pi*centerfreq_5kHz) * baseband_amplitude;
  signal_baseband_carrier_6kHz = sin((1:M_total)/fs*2*pi*centerfreq_6kHz) * baseband_amplitude;
  signal_baseband_carrier_7kHz = sin((1:M_total)/fs*2*pi*centerfreq_7kHz) * baseband_amplitude;
  signal_baseband_carrier_8kHz = sin((1:M_total)/fs*2*pi*centerfreq_8kHz) * baseband_amplitude;
  signal_baseband_carrier_1kHz_2kHz = signal_baseband_carrier_1kHz + signal_baseband_carrier_2kHz;
  signal_baseband_carrier_1to8kHz = signal_baseband_carrier_1kHz + signal_baseband_carrier_2kHz + signal_baseband_carrier_3kHz + signal_baseband_carrier_4kHz + signal_baseband_carrier_5kHz + signal_baseband_carrier_6kHz + signal_baseband_carrier_7kHz + signal_baseband_carrier_8kHz;
  signal_silence = zeros(1,M_total);

  
  audiowrite ("baseband_carrier_1kHz.wav", signal_baseband_carrier_1kHz,fs)
  audiowrite ("baseband_carrier_2kHz.wav", signal_baseband_carrier_2kHz,fs)
  audiowrite ("baseband_carrier_1kHz_2kHz.wav", signal_baseband_carrier_1kHz_2kHz,fs)
  audiowrite ("baseband_carrier_1to8.wav", signal_baseband_carrier_1to8kHz,fs)
  audiowrite ("silence.wav", signal_silence,fs)

  signal_baseband_carrier = signal_baseband_carrier_1kHz_2kHz;
  
  % modulation:
  
  signal_modulated = signal_baseband_carrier(1); % initial, first sample

  for cnt = 2:M_total
    if data_samples(cnt) == 1
      signal_modulated = [signal_modulated signal_baseband_carrier(cnt)];
    else
      signal_modulated = [signal_modulated -signal_baseband_carrier(cnt)];      
    endif
  endfor
    
  noise = .05*rand(1,M_total)-0.025;
  
  signal_received = signal_modulated +  noise;

  audiowrite ("noise.wav", noise,fs)
  audiowrite ("signal_tx.wav", signal_modulated,fs)
  audiowrite ("signal_rx.wav", signal_received,fs)
  
  return
  
  
  % --- plotting .... -------------------------------------------   
  
  theFontSize = 20;
  
  theNumOfBitsPlotted = 25;
  
  M = theNumOfBitsPlotted * samples_per_bit;
  newfigure("Modulated Signal in T");
  hold on
  plot(1:M,signal_received(1:M))
  plot(1:M,noise(1:M))
  set(gca, "xtick",       round((0:.2:1) * M));
  set(gca, "xticklabel", (round((0:.2:1) * M) / fs));
  xlim([0 M]);
  ylim ([-1.01 1.01]);

  fft_size = 64;

  newfigure("Signal Spectrum");
  specgram(signal_received(1:M),fft_size,fs)
  xlabel('Time [s]')
  ylabel('Frequency [Hz]')
  box on; h = colorbar;
  set(h,'FontSize',theFontSize);
  set(h,'FontName','Roboto');
  ylabel(h, 'Magnitude [dB]');
  set(gca,'FontSize',theFontSize);
  set(gca,'FontName','Roboto');

  newfigure("Noise Spectrum");
  specgram(noise(1:M),fft_size,fs)
  xlabel('Time [s]')
  ylabel('Frequency [Hz]')
  box on; h = colorbar;
  set(h,'FontSize',theFontSize);
  set(h,'FontName','Roboto');
  ylabel(h, 'Magnitude [dB]');
  set(gca,'FontSize',theFontSize);
  set(gca,'FontName','Roboto');
  
  function aHandle = newfigure(aTitle)
    aHandle = figure('NumberTitle', 'on', 'Name', aTitle,'PaperPositionMode', 'auto','Position', [20 40 1200 700],'Pointer', 'arrow');
    box on;
    set(gcf, 'color', 'white');
    set(gcf, 'InvertHardCopy', 'off');
    set(gca,'Position',[0.1,0.14,0.82,0.82]);
    grid on;
    xlabel('Time [s]');
    ylabel('signal amplitute');
  endfunction
  
  endfunction