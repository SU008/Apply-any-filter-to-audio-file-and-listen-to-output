

ip  = audioread('C:\Users\Audio_signal.wav');
fs = 22050; %<= Enter:: right click audio file for Sampling rate, fs value
 

%The cut-off frequency Wn must be between 0 < Wn < 1.0, with 1.0 corresponding to half the sample rate.
Wn1 = 360/[fs/2]; % here we are using 360 Hz cutoff freq1
Wn2 = 400 /[fs/2];% here we are using 400 Hz cutoff freq2
 
%fir1( n-th order, [cut-off_freq1 cut-off_freq2], type_of_filter)
%using fir1 function to get the a and b coefficants of the system
[b,a] = fir1(100,[Wn1 Wn2 ],'bandpass');

%apply the a and b system coefficants to input file using the filter function
output = filter(b,a,ip); 


% to read the output audio we use the sound function
% If sound is faint or too low scale values by x-amount eg 3
%Important:use the same fs as the input file to play back the audio 
sound(output*3, fs);