addpath('./')
addpath('../Runtime')
addpath('../Archive')

wifiFreq = 2412*10^6:5*10^6:2472*10^6;
wifiBand = [20*10^6 22*10^6 40*10^6];
wifiMod = ["CCK", "DSSS", "OFDM"];
wifiFreqError = 0.1*min(wifiFreq);
wifiBandError = 0.1*min(wifiBand);
BTFreq = 2402*10^6:1*10^6:2480*10^6;
BTBand = [1*10^6,2*10^6];
BTFreqError = 0.1*min(BTFreq);
BTBandError = 0.1*min(BTBand);
BTMod = ["GFSK"];