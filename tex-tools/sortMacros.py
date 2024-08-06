#!/usr/bin/python3
# -*- coding: utf-8 -*-

import argparse
import re 

import TeX_support as ts 



def writeFile(fn, cmd_to_line, cmd_to_lineNo):
	"""
	Writes a file containing a alphabetically sorted list of macros from a given dictionary. 
	
	:param      fn:           The function
	:type       fn:           Function
	:param      cmd_to_line:  The command to line
	:type       cmd_to_line:  { type_description }
	"""
	file_out = open(fn, 'w')	

	sorted_cmds = sorted(cmd_to_line.keys(), key=lambda v: v.upper())

	file_out.write('% Sorted Macros' + '\n')

	# Random string to hopefully not match a letter
	letter = 'nakfjgJUHGLIhbbnlsihafj'

	failed_cmds = []

	for cmd in sorted_cmds:
		if not cmd_to_line[cmd].strip()[-1] == '}':
			failed_cmds.append(cmd)
		else:
			if cmd[0].upper() != letter:
				letter = cmd[0].upper()
				file_out.write('\n')
				file_out.write('%' + '-' * 30 + '\n')
				file_out.write('% ' + f'{letter.upper()}\n')
				file_out.write('%' + '-' * 30 + '\n')

			file_out.write(f'{cmd_to_line[cmd]}')

	print(f"-" * 40)
	print(f"The following {len(failed_cmds)} entries are probably not complete and have been ignored.")
	print(f"-" * 20)
	print('{0: <8}'.format('Line No') + "| Entry")
	for cmd in failed_cmds:
		print('{0: <8}'.format(cmd_to_lineNo[cmd]) + f" {cmd_to_line[cmd]}")
	print(f"-" * 40)

parser = argparse.ArgumentParser()
parser.add_argument('--input', required=True, type=str, help="Macro file.")
parser.add_argument('--output', required=False, type=str, help="Alphabetically sorted file.")
parser.add_argument('--command', required=False, type=str, default='newcommand', help="Command to search for, default: newcommand")


args,_ = parser.parse_known_args()

out_file = "s_" + args.input
if args.output is not None:
	out_file = args.output

cmd_to_line, cmd_to_lineNo, _ = ts.readFile(args.input, cmd_base=args.command)
writeFile(out_file, cmd_to_line, cmd_to_lineNo)