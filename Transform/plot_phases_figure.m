function plot_phases_figure(phases, bands, N, Fs, filename)
  
  
  theFontSize = 20;
  
  phases = abs(phases);
  freq_axis = bands/N*Fs / 10000;
  num_time_frames = size(phases,2);
  if(num_time_frames == 1)
  msg = round(abs(phases/pi));
  code_len = 4;
  len = length(phases);
  msg = reshape(repmat(msg',code_len,1),1,len);
  newfigure(filename);
  %        subplot(2,1,1);
  stem(phases);
  hold on;
  plot(freq_axis,pi/2*ones(1,len),'r');
  plot(freq_axis,-pi/2*ones(1,len),'r');
  subplot(2,1,2);
  plot(freq_axis,msg);
  elseif(num_time_frames > 1)
  time_axis = (0:num_time_frames-1)/(Fs/N);
  newfigure(filename);
  imagesc(time_axis, freq_axis, phases);
  box on; h = colorbar;
  set(h,'FontSize',theFontSize);
  set(h,'FontName','Roboto');
  ylabel(h, 'Phase');
  set(gca,'FontSize',theFontSize);
  set(gca,'FontName','Roboto');
  set(gca,'YDir','normal');
  ylabel('Frequency [kHz]');
  xlabel('Time [s]');
  %saveas(gcf,filename,'epsc');
  %saveas(gcf,filename,'fig');
end
function aHandle = newfigure(aTitle)
  aHandle = figure('NumberTitle', 'on', 'Name', aTitle,'PaperPositionMode', 'auto','Position', [20 40 1200 700],'Pointer', 'arrow');
  box on;
  set(gcf, 'color', 'white');
  set(gcf, 'InvertHardCopy', 'off');
  set(gca,'Position',[0.1,0.14,0.82,0.82]);
  grid on;
endfunction
end
