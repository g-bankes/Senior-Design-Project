function [high_freq_3dB, low_freq_3dB] = HalfPowerFreqCalc(f, X, low_freq_id, high_freq_id)

    % Preallocate the high_freq_3dB and low_freq_3dB arrays
    % to increase speed.
    high_freq_3dB = zeros(1, length(high_freq_id));
    low_freq_3dB = zeros(1, length(low_freq_id));
    
    % Define the id of the lower and upper 3dB frequency.
    low_power_id = 0;
    high_power_id = 0;
    
    % Loop over the length of the high_freq_id/low_freq_id arrays (these
    % should be the same length so it doesn't matter which) to pick out the
    % 3dB frequencies in the high_freq and low_freq arrays.
    for i = 1:length(low_freq_id)
        
        % Pull out the section of the power filtered signal associated
        % with each signal.
        Y = X(low_freq_id(i):high_freq_id(i));
        f_filt = f(low_freq_id(i):high_freq_id(i));
        
        %Save the max power.
        [max_sig_power, max_power_index] = max(Y);
        
        % Loop over the extracted signal to determine the 3dB power points.
        for j = 1:length(Y)
            
            % Look for the lower 3dB power.
            if j < max_power_index
                
                % Start at j = 2 to avoid an index value of 0.
                if j > 1
                
                    if max_sig_power - Y(j) < 3 && max_sig_power - Y(j-1) > 3
                    
                        low_power_id = j-1;
                    
                    end
                    
                end
            
            % Look for the upper 3dB power.
            elseif j > max_power_index
                
                % Start at j = 2 to avoid an index value of 0.
                if j > 1
                
                    if max_sig_power - Y(j) > 3 && max_sig_power - Y(j-1) < 3
                    
                        high_power_id = j;
                    
                    end
                    
                end
                
            end
            
        end

        % Once the index of the high and low 3dB powers are found,
        % determine the frequency associated with this power.
        low_freq_3dB(1, i) = f_filt(low_power_id);
        high_freq_3dB(1, i) = f_filt(high_power_id);
        
    end

end