% Parameters
baseband_frequency = 5e3;           % 5 kHz
baseband_amplitude = 1;             % 1 V
baseband_duration = 0.002;          % 0.002 ms

% Initial carrier parameters
carrier_frequency_initial = 100e6;  % 100 MHz
carrier_duration = 0.002;            % 0.002 ms

% Modified carrier parameters
carrier_frequency_modified = 1010e3; % 1010 kHz

% Modulation index
modulation_index = 1;

% Time vectors
t_baseband = linspace(0, baseband_duration, 1000);    % 1000 points for a smooth signal
t_carrier = linspace(0, carrier_duration, 1000);      % 1000 points for a smooth signal

% Create baseband signal
baseband_signal = baseband_amplitude * cos(2 * pi * baseband_frequency * t_baseband);

% Create initial carrier signal at 100 MHz
carrier_signal_initial = cos(2 * pi * carrier_frequency_initial * t_carrier);

% Modify carrier signal to 1010 kHz and 0.002 ms duration
carrier_signal_modified = cos(2 * pi * carrier_frequency_modified * t_carrier);

% Modulate carrier using basic mathematical functions
modulated_signal_math = (1 + modulation_index * baseband_signal) .* carrier_signal_modified;

% Modulate carrier using ammod command
modulated_signal_ammod = ammod(baseband_signal, carrier_frequency_modified, (2*carrier_frequency_modified), 0, modulation_index);

% Plot transmitted waveforms
figure;

% Plot baseband signal
subplot(4,1,1);
plot(t_baseband, baseband_signal);
title('Baseband Signal');
xlabel('Time (s)');
ylabel('Amplitude (V)');
grid on;

% Plot initial carrier signal
subplot(4,1,2);
plot(t_carrier, carrier_signal_initial);
title('Initial Carrier Signal (100 MHz)');
xlabel('Time (s)');
ylabel('Amplitude (V)');
grid on;

% Plot modified carrier signal
subplot(4,1,3);
plot(t_carrier, carrier_signal_modified);
title('Modified Carrier Signal (1010 kHz)');
xlabel('Time (s)');
ylabel('Amplitude (V)');
grid on;

% Plot modulated signal using basic mathematical functions
subplot(4,1,4);
plot(t_carrier, modulated_signal_math);
title('AM Modulated Signal (Math)');
xlabel('Time (s)');
ylabel('Amplitude (V)');
grid on;

% Plot modulated signal using ammod command
figure;
subplot(4,1,1);
plot(t_carrier, modulated_signal_ammod);
title('AM Modulated Signal (ammod)');
xlabel('Time (s)');
ylabel('Amplitude (V)');
grid on;
