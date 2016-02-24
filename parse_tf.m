function parse_tf(filename)
	% put main data file (freqs file is added automaticaly)
	
	data = load(fullfile('data', filename));
	data_freqs = load(fullfile('data', [filename '_freqs']));
	
	csvwrite(fullfile('results', filename), [data_freqs data], 'delimiter', '\t');
	
	semilogx(data_freqs, 20*log10(data))
	grid
	xlabel('f [Hz]')
	ylabel('|K(f)| [dB]')
	title(sprintf('TF (file: %s)', filename))
	print(fullfile('results', [filename '.eps']), '-deps')
end