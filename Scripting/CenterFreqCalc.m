function [centFreq] = CenterFreqCalc(lowFreq, band)
    
    % Let centFreq hold the center frequency of each
    % signal that has been captured. Add half the
    % bandwidth to the lower frequency.
    centFreq = 0.5*band + lowFreq;

end