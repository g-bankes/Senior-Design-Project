    Fs = 1000; %Sampling Frequency
    T = 1/Fs; %Sampling Period
    t = 0:T:1-T; %Time
    L = length(t); %Number of samples
    
    x = (1/25)*cos(2*pi*100*t);

% x = zeros(1, length(t));
    for k = 1:100
     
        freq = 100 + k;
        freq2 = 300 + k;
        if k < 25
            
            x = x + ((k+1)/25)*cos(2*pi*freq*t);
            x = x + ((k+1)/25)*cos(2*pi*freq2*t);
            
        elseif k > 75
            
            x = x + ((101-k)/25)*cos(2*pi*freq*t);
            x = x + ((101-k)/25)*cos(2*pi*freq2*t);
            
        else
            
            x = x + cos(2*pi*freq*t);
            x = x + cos(2*pi*freq2*t);
        
        end
         
    end
    x = x + randn(size(t));

    %S = 0.7*cos(2*pi*200*t)+1.5*cos(2*pi*350*t);
    %S = 0.5*randn(size(t));
    
%{
    figure(1)
    plot(1000*t(1:500), x(1:500))
    title('Corrupted Signal')
    xlabel('t (s)')
    ylabel('x(t)')

%}
    Y = fft(x);

    P2 = abs(Y/L);
    P2 = 10*log10(P2);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = Fs*(0:(L/2))/L;
    
%{
    figure(2)
    plot(f(2:end), P1(2:end))
    title('FFT of X(t)')
    xlabel('f (Hz)')
    ylabel('|P1(f)| (dBm)')
    
%}
    
    P3 = medfilt1(P1);
    
%{
    figure(4)
    plot(f, P3)
    title('Smoothed FFT')
    xlabel('f (Hz)')
    ylabel('P3(f)')
%}
%     
%     P4 = P1 - P3;
%     hold on
%     plot(f, P4)
%     hold off
%  
%     [up_env, ~] = envelope(P1, 1, 'peak');
%     hold on
%     plot(f, up_env)
%     hold off

save('..\Runtime\sample.mat', 'f', 'P3')
