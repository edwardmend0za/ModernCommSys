% Step 1: Create Huffman dictionary
symbols = {'0', '1', '2', '3', '4', '5', '6'}; % Symbols as strings
probabilities = [0.1, 0.2, 0.1, 0.4, 0.05, 0.05, 0.1];
dict = huffmandict(symbols, probabilities);

% Step 2: Calculate minimum code length
minCodeLength = ceil(log2(1 ./ probabilities));

% Step 3: Define source symbols
sourceSymbols = [1, 3, 2, 3, 5, 3, 3, 1, 6, 3, 1, 0, 3, 6, 2, 3, 4, 0, 1, 3];

% Convert source symbols to strings to match the dictionary
sourceSymbolsAsString = cellfun(@(x) symbols{x+1}, num2cell(sourceSymbols), 'UniformOutput', false);

% Step 4: Encode source symbols
encodedSignal = huffmanenco(sourceSymbolsAsString, dict);

% Calculate the number of bits required to transmit the encoded symbols
numBitsEncoded = numel(encodedSignal);

% Step 5: Decode the code
decodedSignalAsString = huffmandeco(encodedSignal, dict);
decodedSignal = cellfun(@(x) find(strcmp(x, symbols))-1, decodedSignalAsString);

% Step 6: Verify decoding
disp('Decoded signal matches source symbols:')
isequal(decodedSignal, sourceSymbols)

% Step 7: Repeat for a longer signal
longSignal = randsrc(1, 10000, [1:length(symbols); probabilities]);
longSignalAsString = cellfun(@(x) symbols{x}, num2cell(longSignal), 'UniformOutput', false);

encodedLongSignal = huffmanenco(longSignalAsString, dict);
decodedLongSignalAsString = huffmandeco(encodedLongSignal, dict);
decodedLongSignal = cellfun(@(x) find(strcmp(x, symbols))-1, decodedLongSignalAsString);

maxLongBits = ceil(log2(max(longSignal)));
numLongBitsEncoded = numel(encodedLongSignal);

% Verify decoding of long signal
disp('Decoded long signal matches source:')
isequal(decodedLongSignal, longSignal)

% Step 8: Calculate entropy
entropy = -sum(probabilities .* log2(probabilities));

% Step 9: Calculate average rate
averageRate = 0;
for i = 1:length(dict)
    averageRate = averageRate + length(dict{i, 2}) * probabilities(i);
end
