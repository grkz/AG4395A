# setup
gpib_address = "GPIB0::17::INSTR"

import visa
import time
rm = visa.ResourceManager()
analyzer = rm.open_resource(gpib_address)
print('TEST: IDN = ' + analyzer.query('*IDN?'))

def get_spectrum(filename, n):
	data_file = open(filename, 'w')
	freqs_file = open(filename + '_freqs', 'w')
	
	for n in range(n):
		analyzer.write("SING")
		while analyzer.query('HOLD?')!='1\n': 		# waits until the current measurement is done
				time.sleep(0.3)
		print('HOLD!')
		
		
		analyzer.write("HOLD")
		analyzer.write('FORM4')
		
		if n==0:
			freqs= analyzer.query_ascii_values('OUTPSWPRM?')
			for f in freqs:
				freqs_file.write(str(f) + '\n')
			freqs_file.close()
		values =  analyzer.query_ascii_values('OUTPDTRC?')
		for v in values:
			data_file.write(str(v) + '\t')
		data_file.write('\n')
		print(str(n) + ': OK')
	print('Done!')
	data_file.close()
	
def get_tf(filename):
	data_file = open(filename, 'w')
	freqs_file = open(filename + '_freqs', 'w')
	########	download data in network analyzer mode	#######

	analyzer.write("HOLD")
	analyzer.write('FORM4')

	freqs = analyzer.query_ascii_values('OUTPSWPRM?')
	for f in freqs:
		freqs_file.write(str(f) + '\n')
	freqs_file.close()

	values =  analyzer.query_ascii_values('OUTPDTRC?')
	amps = values[0::2]
	auxiliary_amps = values[1::2]			# ???
	for v in amps:
		data_file.write(str(v) + '\n')
		
	# complex version (dataoutp?)
	#for n in range(len(freqs)):
	#	data_file.write(str(math.sqrt(values[2*n]*values[2*n] + values[2*n+1]*values[2*n+1])) + '\t')
	#data_file.write('\n')

	data_file.close()
	print('Done!')