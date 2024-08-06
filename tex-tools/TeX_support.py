#!/usr/bin/python3
# -*- coding: utf-8 -*-

import re 


cmd_regex = {
	'newcommand': '\{\\\\([a-zA-Z]+)\}.*', 
	'newacronym': '\{([a-zA-Z-]+)\}.*'
}

def readFile(fn, cmd_base):
	return readFileInner(fn, cmd_base, cmd_regex[cmd_base])


def readFileInner(fn, cmd_base, cmd_entry):
	"""
	Reads a file, finds single-line macros and outputs directory.

	Limitations: only finds macros defined with 'newcommand' and 'renewcommand'
	
	:param      fn:   The target .tex file.
	:type       fn:   Function
	"""
	file_in = open(fn, 'r')	

	cmd_to_line = {}
	cmd_to_lineNo = {}
	cmd_to_trgt = {}

	failed_lines = {}

	for ctr,line in enumerate(file_in.readlines()):

		#print(f"line: {line}")

		if line.strip().startswith('%'):
			continue 

		# Only find single-line macros 
		if line.startswith("\\" + cmd_base):
			full_regex = "\\\\" + cmd_base + cmd_entry
			cmd_output = re.findall(full_regex, line)

			if len(cmd_output) == 0:
				continue

			cmd_name = cmd_output[0][:]

			if cmd_name in cmd_to_line.keys():
				print(f"Collision in line {ctr}: {line} with extracted cmd {cmd_name}")
			cmd_to_line[cmd_name] = line
			cmd_to_lineNo[cmd_name] = ctr 


						#print(f"cmd_output {cmd_output[0]}")

			# Find line after search
			cmd_pos = re.search('\\\\' + cmd_output[0], line)
			# 
			#print(f"line {line}")
			#print(f"line {line[cmd_pos.end()+1:]}")

			trgt_output = re.findall('\{(.*)\}', line[cmd_pos.end() + 1:])

			if len(trgt_output) == 0:
				continue

			cmd_to_trgt[cmd_name] = trgt_output[0]

			#print(f"full_regex {full_regex}")
			#print(f"cmd {cmd_output}")

			if not line.strip()[-1] == '}':
				failed_lines[ctr] = line
		else:
			failed_lines[ctr] = line

	print(f"-" * 40)
	print(f"The following {len(failed_lines)} entries have probably not been read successfully.")
	print(f"-" * 20)
	print('{0: <8}'.format('Line No') + "| Entry")
	for k in sorted(failed_lines.keys()):
		print('{0: <8}'.format(k) + f" {failed_lines[k]}")
	print(f"-" * 40)
	print(f"Read {len(cmd_to_line)} entries.")

	return cmd_to_line, cmd_to_lineNo, cmd_to_trgt





