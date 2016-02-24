import os.path
import math
from functions import *

fn = raw_input("enter filename (overwrites existing files in 'data' dir): ")
mode = raw_input("Enter S (noise/spectrum) or N (network): ")

if mode == "S":
	n = int(raw_input("Enter number of measurements: "))
	get_spectrum(os.path.join('data', fn), n)
elif mode == "N":
	get_tf(os.path.join('data', fn))
