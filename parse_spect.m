function parse_spect(filename)
	% put main data file (freqs file is added automaticaly)
	
	data = load(fullfile('data', filename));
	data_freqs = load(fullfile('data', [filename '_freqs']));
	
	%fprintf('Zmienna sp zawiera (usrednion¹… w kwadratach)\ngestosc widmowa mocy szumow (f [Hz] | sp [V/sqrt(Hz)])\n')
	%fprintf('Pozostale obliczenia znajduja sie na wykresach.')
	sp = spectrum_av(data_freqs, data);
	dlmwrite(fullfile('results', [filename '_averaged']), sp, 'delimiter', '\t');
	
	%semilogx(sp(:,1), sp(:,2))
	loglog(sp(:,1), sp(:,2))
    xlabel('f [Hz]')
	ylabel('noise [V/sqrt(Hz)]')
	title(sprintf('%s %.3f mV RMS (n = %d averages)\n', filename, spectrum2rms(sp)*1000, size(data,1)))
	% print(fullfile('results', filename), '-dpdflatex')
	print(fullfile('results', [filename '.tiff']), '-dtiff')
end
	
	
	