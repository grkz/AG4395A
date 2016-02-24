function spectrum_diff(filename1, filename2)
	sp1 = load(fullfile('results', [filename1 '_averaged']));
	sp2 = load(fullfile('results', [filename2 '_averaged']));
	
	if size(sp1) ~= size(sp2)
		print('Nie mozna odjac widm. Zle rozmiary macierzy.')
	end
	if sum(sp1(:,1).^2 - sp2(:,1).^2) ~= 0
		print('Czestotliwosci nie pokrywaja sie! Zly wynik odejmowania widm!')
	end
	d = sp1(:,2).^2 - sp2(:,2).^2;
	d = [sp1(:,1) sqrt(d)];
	
	csvwrite(fullfile('results', ['diff_' filename1 '_' filename2]), abs(d), 'delimiter', '\t');
	semilogx(d(:,1), d(:,2))
	xlabel('f [Hz]')
	ylabel('noise [V/sqrt(Hz)]')
	title(sprintf('diff(%s, %s): %.3f mV RMS', filename1, filename2, spectrum2rms(d)*1000))
	print(fullfile('results', ['diff_' filename1 '_' filename2 '.eps']), '-deps')
end
