import os
import argparse


parser = argparse.ArgumentParser(prog='IPE Export Views')


parser.add_argument('--ipefile', required=True, help='IPE file to be processed.')
parser.add_argument('--dest', required=True, help='Destination folder for exported pngs.')

parser.add_argument('--first', required=False, type=int, default=1, help='Number of first view to be exported.')
parser.add_argument('--last', required=True, type=int, help='Number of last view to be exported.')

parser.add_argument('--dpi', required=False, type=int, default=300, help='DPI of exported png.')

parser.add_argument('--transparent', required=False, action='store_true', help='Transparent png. Causes weird shades for png in beamer.')

parser.add_argument('--type', required=False, default='png', help='{png, pdf, eps}')

args = parser.parse_args()
fType = args.type


for i in range(args.first, args.last+1):
	
	if args.transparent:
		os.system(f'iperender -{fType} -transparent -resolution {args.dpi} -view {i} {args.ipefile} {args.dest}/{args.ipefile}_{i}.{fType}')
	else:
		os.system(f'iperender -{fType} -resolution {args.dpi} -view {i} {args.ipefile} {args.dest}/{args.ipefile}_{i}.{fType}')

 



