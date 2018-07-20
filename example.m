%PowerAmplifier Example
%Example of how to use the PowerAmplifier class to model a PA and TX through
%the model.
%
% Author: Chance Tarver
% Website: http://www.chancetarver.com
% July 2018;

%% ------------- BEGIN CODE --------------

% Setup the PA
order = 7;          % Order must be odd
memory_depth = 4;
pa = PowerAmplifier(order, memory_depth);

% Setup TX Signal
tx_length = 2^17;
ts_tx = 1/40e6;
t = [0:ts_tx:((tx_length - 1) * ts_tx)].';   % Create time vector (Sample Frequency is ts_tx (Hz))
tx_Data = 0.6 * exp(1i*2*pi * 2e6 * t) + 0.2 * exp(1i*2*pi * -3e6 * t); 

% Transmit through the PA
rx_Data = pa.transmit(tx_Data);

% Model a new PA based on this fake RX Data.
pa.make_pa_model(tx_Data, rx_Data);
disp('New Coeffs:');
disp(pa.poly_coeffs);

fprintf('NMSE of fit: %d\n',pa.nmse_of_fit);

%% Plot the time domain input/output.
% Create figure
figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(real(tx_Data), 'DisplayName', 'TxData');
hold on;
plot(real(rx_Data), 'DisplayName', 'RxData');
xlabel('Sample')
ylabel('Magnitude')
hold on;
legend(gca,'show');
grid on;
xlim(axes1,[-0 500]);
ylim(axes1,[-1 1]);
