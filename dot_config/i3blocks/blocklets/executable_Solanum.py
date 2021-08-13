#!/usr/bin/env python

import pickle
import time

class Solanum:
	
	def __init__(self, file_loc):
		self.file_loc = file_loc
		try:
			with open(self.file_loc, 'rb') as f:
				self.spud = pickle.load(f)
		except:
			self.spud = {
					'current' : 'work',
					'start' : time.time(),
					'count' : 0,
					'work' : 25,
					'break' : 5,
					'long_break' : 15
				}
			with open(self.file_loc, 'wb') as f:
				pickle.dump(self.spud, f)
	
	def ding(self):
		pass
	
	def update(self):
		elapsed = time.time() - self.spud['start'] // 1
		if elapsed > self.spud[self.spud['current']] * 60:
			self.ding()
			if self.spud['current'] == 'work':
				self.spud['count'] += 1
				if self.spud['count'] // 4 == 0:
					self.spud['current'] = 'long_break'
				else:
					self.spud['current'] = 'break'
			else:
				self.spud['current'] = 'work'
			self.spud['start'] = time.time()
			with open(self.file_loc, 'wb') as f:
				pickle.dump(self.spud, f)
			return f"Done! Starting {self.spud['current']} timer..."

		seconds = self.spud[self.spud['current']] * 60 - elapsed
		minutes = seconds // 60
		if minutes == 0:
			minutes = '00'
		else:
			seconds -= minutes * 60
			if seconds < 10:
				seconds = f"0{seconds}"
		return f"{int(minutes)}:{int(seconds)} of {self.spud['current']} left"

file_loc = '/home/ian/.config/i3blocks/blocklets/spud.pickle'
solanum = Solanum(file_loc)
print(solanum.update())
