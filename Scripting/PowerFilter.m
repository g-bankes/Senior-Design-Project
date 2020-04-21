function [f, X] = PowerFilter(f, X)
    
    %Average the power of the recieved signal.
    P = 0;
    
    %Loop over fourier transform to filter out noise.
    for i = 1:length(X)
        
        P = P + X(i);
        
    end
    P = P/length(X);

    %Loop over fourier transform to filter out noise.
    for i = 1:length(X)
        
        if X(i) < P
            
            X(i) = -100;
            
        end
        
    end

end