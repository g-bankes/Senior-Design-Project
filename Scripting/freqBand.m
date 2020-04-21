[f, X1] = PowerFilter(f(2:end-1), P(2:end-1));
[lowFreq, band] = BandwidthExtraction(f, X1);
[centFreq] = CenterFreqCalc(lowFreq, band);