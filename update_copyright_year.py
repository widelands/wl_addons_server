#!/usr/bin/env python
# encoding: utf-8

# Copied almost verbatim from the main Widelands source tree

import os.path
import re
import sys
import traceback

PYTHON3 = sys.version_info >= (3, 0)

def read_text_file(filename):
	"""Reads the contens of a text file."""
	if PYTHON3:
		with open(filename, 'r', encoding='utf-8') as f:
			return f.read()
	else:
		with open(filename, 'r') as f:
			return f.read().decode('utf-8')


def write_text_file(filename, content):
	"""Writes 'content' into a text file."""
	if PYTHON3:
		with open(filename, 'w', encoding='utf-8', newline='\n') as f:
			f.write(content)
	else:
		with open(filename, 'w') as f:
			f.write(content.encode('utf-8'))


def find_files(startpath, extensions):
	for (dirpath, _, filenames) in os.walk(startpath):
		for filename in filenames:
			if os.path.splitext(filename)[-1].lower() in extensions:
				yield os.path.join(dirpath, filename)

def update_file(filename, regex, replace):
	sys.stdout.write('.')
	sys.stdout.flush()
	lines = read_text_file(filename).strip().split('\n')
	new_lines = []
	did_match = False
	for line in lines:
		match = regex.match(line)
		if match:
			line = replace(match)
			did_match = True
		new_lines.append(line.rstrip() + '\n')
	write_text_file(filename, ''.join(new_lines))
	if not did_match:
		print('WARNING: You might need to update some copyright years in %s manually.' % filename)

def main():
	"""Updates the copyright year in all source files to the given year."""
	if len(sys.argv) != 2:
		print('Usage: update_copyright.py <year>')
		return 1

	try:
		year = sys.argv[1]
		sys.stdout.write('Updating copyright year to: ' + year + ' ')
		base_path = os.path.abspath(os.path.dirname(__file__))

		src_path = os.path.join(base_path, 'wl')
		# Fix copyright headers in Java files
		regex_header = re.compile(
			'(.*Copyright \(C\) \d\d\d\d)(.*)( by the Widelands Development Team.*)')

		def repl_header(match):
			if match.group(1).endswith(year):
				return match.group(1) + match.group(3)
			else:
				return match.group(1) + '-' + year + match.group(3)

		for filename in find_files(src_path, ['.java']):
			update_file(filename, regex_header, repl_header)

		print(' done.')

	except Exception:
		print('Something went wrong:')
		traceback.print_exc()
		return 1


if __name__ == '__main__':
	sys.exit(main())
