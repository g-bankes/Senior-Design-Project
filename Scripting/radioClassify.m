function [class] = radioClassify(freq, band)
% Use calculated attributes to classify the input signal
    run startup.m;
    for i = 1:length(freq)
        
        wifiCheck(1) = any(freq(i) >= (wifiFreq - wifiFreqError) & freq(i) <= (wifiFreq + wifiFreqError));
        wifiCheck(2) = any(band(i) >= (wifiBand - wifiBandError) & band(i) <= (wifiBand + wifiBandError));

        BTCheck(1) = any(freq(i) >= (BTFreq - BTFreqError) & freq(i) <= (BTFreq + BTFreqError));
        BTCheck(2) = any(band(i) >= (BTBand - BTBandError) & band(i) <= (BTBand + BTBandError));

        if all(wifiCheck) == 1
            class(i) = "Wi-Fi";
        elseif all(BTCheck) == 1
            class(i) = "Bluetooth";
        else
            class(i) = "Other";
        end
    end
end

