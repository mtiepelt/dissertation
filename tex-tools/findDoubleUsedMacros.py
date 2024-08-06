import argparse
import re 
import subprocess

import TeX_support as ts 

parser = argparse.ArgumentParser()
parser.add_argument('-input', required=True, type=str, help="Macro file.")
# parser.add_argument('-output', required=False, type=str, help="Alphabetically sorted file.")
# parser.add_argument('-exclude', required=False, type=str, help="Exclude directory from search.")

args = parser.parse_args()

cmd_to_line, cmd_to_lineNo, cmd_to_trgt = ts.readFile(args.input, cmd_base='newcommand')

matched = []
for cmd,trgt in cmd_to_trgt.items():
	if cmd in matched:
		continue 

	for cmd2,trgt2 in list(cmd_to_trgt.items()):
		if cmd == cmd2:
			continue 

		if trgt == trgt2:
			matched.append(cmd2)
			print(f"Command '{cmd}' and '{cmd2}' have the same output: '{trgt}'")
