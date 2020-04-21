function [low_freq_3dB, band] = BandwidthExtraction(f, X)
    
    % Define a flag to tell when the end of a band
    % has been reached. Define flag to tell when the 
    % flag value has changed.
    flag = 0;
    prev_flag = flag;
    low_count = 0;
    high_count = 0;
    
%{
    figure(3)
    plot(f, X)
    title('Power Filtered Signal')
    xlabel('f (Hz)')
    ylabel('Power (dBm)')
%}
    
    % Loop over the elements of the signal.
    for i = 1:length(X)
        
        
        % Change the flag value depending on the 
        % signal value.
        if X(i) == -100
            
            flag = 0;
            
        else
            
            flag = 1;
            
        end
        
        % Check if the flag value has changed and 
        % add the frequencies to the appropriate
        % list for bandwidth calculations.
        if prev_flag == 0 && flag == 1
            
            low_count = low_count + 1;
            %low_freq(low_count) = f(i);
            low_freq_id(low_count) = i;
            
        elseif prev_flag == 1 && flag == 0
            
            high_count = high_count + 1;
            %high_freq(high_count) = f(i-1);
            high_freq_id(high_count) = i-1;
            
        end
        
        % Update the value of prev_flag for comparison
        % on the next loop.
        prev_flag = flag;
        
    end
    
    % Calculate the bandwidth by subtracting the high frequency
    % from the low frequency.

    [high_freq_3dB, low_freq_3dB] = HalfPowerFreqCalc(f, X, low_freq_id, high_freq_id);
    band = high_freq_3dB - low_freq_3dB;

end