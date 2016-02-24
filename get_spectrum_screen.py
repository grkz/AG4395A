import os.path
import math
from functions import *

filename = raw_input("enter filename (overwrites existing files in 'data' dir): ")

filename = os.path.join('data', filename)

data_file = open(filename, 'w')
freqs_file = open(filename + '_freqs', 'w')

analyzer.write("HOLD")
analyzer.write('FORM4')
	

freqs= analyzer.query_ascii_values('OUTPSWPRM?')
for f in freqs:
	freqs_file.write(str(f) + '\n')
freqs_file.close()
values =  analyzer.query_ascii_values('OUTPDTRC?')
for v in values:
	data_file.write(str(v) + '\t')
data_file.write('\n')
print('Done!')
data_file.close()