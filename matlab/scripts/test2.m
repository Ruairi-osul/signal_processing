% load data
clear all
folder_path = 'C:\Users\Rory\extra_repos\signal_processing\matlab';
addpath(genpath(folder_path))
load('sampleEEGdata.mat')

%%

% recording params
fs = EEG.srate;
nyq = EEG.srate / 2;
chan = 27;
t = EEG.times;

% pick some time points
inter_fft_interval = 25;                        % in ms
fft_centres = -300:inter_fft_interval:800;      % check this
fft_centres_s = dsearchn(t',fft_centres'); 
%fft_centres_s = (fft_centres .* fs) / 1000;     % in samples

% pick nfft
nfft = 300;                         % in ms
nfft = round((nfft * fs) / 1000);   % in samples
half_window = nfft / 2;

% create a hanning window
han_win = 0.5 - 0.5 * cos(2 * pi .* linspace(0, 1, nfft));


%% loop over the timepoints and compute the fft, save results
num_f = floor(nfft / 2) + 1;
tf = zeros(num_f, length(fft_centres));
for i = 1:length(fft_centres)
    start_idx = fft_centres_s(i) - floor(half_window) + 1;
    end_idx = fft_centres_s(i) + ceil(half_window);
    data_sub = EEG.data(chan, start_idx:end_idx, :);
    data_sub_tap = bsxfun(@times, data_sub, han_win);
    data_subX = fft(data_sub_tap) ./ nfft;
    pow = mean(abs(data_subX).^2, 3);
    tf(:, i) = pow(1:num_f);
end

% normalise
base_time = [-300, -100];
base_idx = dsearchn(fft_centres', base_time');
base_data = mean(tf(:, base_idx(1):base_idx(2)),2);
tf_norm = 10 * log10(bsxfun(@rdivide, tf, base_data));

% plot
figure(1), clf 
contourf(fft_centres, 1:num_f, tf_norm, 40, 'linecolor','none')
set(gca,'clim',[-2 2])
ylim([0, 20])
xlabel('Time (ms)'), ylabel('Frequency (Hz)')

%%