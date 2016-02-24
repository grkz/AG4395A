function sp = spectrum_av(freqs, data)
	% returns spectrum  | f [Hz] 	| sp V/sqrt(Hz) |
	%					|	...		|		...		|
	%					|	...		|		...		|
						
	% data doesn't contain frequencies -> cols correspond to freq values; new row is added after every measurement
	
	
	
	square = 1; 					% if data values' unit is V/sqrt(Hz) set square to 1;
									% set square to 0 if the data unit is V/Hz
	
	if square == 1
		data = data.^2;
	end
	data = sum(data, 1)./size(data, 1); % divide by number of measurements
	data = sqrt(data);
	sp = [freqs, data'];
end
	
	
