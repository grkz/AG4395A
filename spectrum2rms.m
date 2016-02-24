 function r = spectrum2rms(sp)
	data = sp(:,2).^2;
	r = trapz(sp(:,1), data);	% integral
	r = sqrt(r);
end