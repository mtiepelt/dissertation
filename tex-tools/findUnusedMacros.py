import argparse
import re 
import subprocess
import os

import TeX_support as ts 

parser = argparse.ArgumentParser()
parser.add_argument('-input', required=True, type=str, help="Macro file.")
parser.add_argument('-exclude', required=False, type=str, help="Exclude directory from search.")
parser.add_argument('-target', required=True, type=str, help="Target root directory for search.")


args = parser.parse_args()

cmd_to_line, cmd_to_lineNo, _ = ts.readFile(args.input, cmd_base='newcommand')


excld_dir = '' 
if args.exclude:
	excld_dir = os.path.basename(os.path.abspath(args.exclude))

trgt_dir = os.path.abspath(args.target)


print(f"-" * 30)
print(f"Searching macros from file {args.input} in all (sub)directories of")
print(f"{trgt_dir}")
print(f"except {excld_dir}.")
print(f"Did not find usage of the following macros:\n")

for cmd in cmd_to_line.keys():
	process = subprocess.Popen(['/bin/grep', '--include', '*.tex', '--exclude-dir', excld_dir, '-rnF', '\\' + cmd, trgt_dir], 
		stdout=subprocess.PIPE, stderr=subprocess.PIPE)

	stdout, stderr = process.communicate()

	if stdout == b'':
		print(f"{args.input}:{cmd_to_lineNo[cmd]} {cmd}")
