function spectrum_divbytf(spectrum_filename, tf_filename)
	sp = load(fullfile('results', spectrum_filename));
	tf = load(fullfile('results', tf_filename));
	
	if size(sp) ~= size(tf)
		print('Nie mozna odjac widm. Zle rozmiary macierzy.')
	end
	if sum(sp(:,1).^2 - tf(:,1).^2) ~= 0
		print('Czestotliwosci nie pokrywaja sie! Zly wynik odejmowania widm!')
	end
	
	result = [sp(:,1), sp(:,2)./tf(:,2)];
	
	csvwrite(fullfile('results', [spectrum_filename '_divby_' tf_filename]), result, 'delimiter', '\t');
	semilogx(result(:,1), result(:,2))
	axis([1e3 1e7 0 3e-5])
	xlabel('f [Hz]')
	ylabel('noise [V/sqrt(Hz)]')
	title(sprintf('%s / %s): %.3f mV RMS', spectrum_filename, tf_filename, spectrum2rms(result)*1000), 'interpreter', 'none')
	print(fullfile('results', [spectrum_filename '_divby_' tf_filename '.eps']), '-deps')
