% Task 1: Run the MATLAB ISI Raised Cosine example
openExample('comm/ReduceISIUsingRaisedCosineFilteringExample');

% Parameters
N = 10000;              % Number of bits
EbNo_dB = 10;           % Eb/No in dB

% Transmitter
data = randi([0 1], 1, N);                      % Generate random binary data
tx = 2*data - 1;                                % BPSK modulation (0 to -1, 1 to +1)

% Channel
EbNo = 10^(EbNo_dB/10);
noise_var = 1 / (2 * EbNo);                    % Noise variance
noise = sqrt(noise_var) * randn(1, N);          % Generate noise

% Received signal
rx_signal = tx + noise;                         % Add noise

% Calculate Bit Error Rate (BER)
ber = sum(rx_signal .* tx < 0) / N;

disp(['Bit Error Rate (BER): ', num2str(ber)]);

% Parameters
N = 10000;              % Number of bits
EbNo_dB = 10;           % Eb/No in dB
span = 10;              % Raised cosine filter span
rolloff = 0.5;          % Rolloff factor

% Transmitter
data = randi([0 1], 1, N);                      % Generate random binary data
tx = 2*data - 1;                                % BPSK modulation (0 to -1, 1 to +1)

% No pulse shaping

% Channel
EbNo = 10^(EbNo_dB/10);
noise_var = 1 / (2 * EbNo);                    % Noise variance
noise = sqrt(noise_var) * randn(1, N);          % Generate noise

% Received signal
rx_signal = tx + noise;                         % Add noise

% No matched filtering

% Sampling at symbol rate (no downsampling)

% Decision
rx_data = rx_signal > 0;                        % BPSK demodulation

% Calculate Bit Error Rate (BER)
ber = sum(rx_data ~= data) / N;

disp(['Bit Error Rate (BER): ', num2str(ber)]);

% Task 3: Run the BER Performance of Different Equalizers example
openExample('comm/BERPerformanceOfDifferentEqualizerExample');
