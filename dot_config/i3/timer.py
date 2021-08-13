import time
import sys
from gi.repository import Notify

Notify.init("Timer")

start = time.time()
inpt = sys.argv[1]

num = int(inpt[:-1])
unit = inpt[-1]

if unit.lower() == 'h':
	multiplier = 60 * 60
elif unit.lower() == 'm':
	multiplier = 60
elif unit.lower() == 's':
	multiplier = 1
else:
	sys.exit("Input not understood. Input format [0-9][H|M|S]")

end = (num * multiplier) + start
while time.time() != end:
	pass
Notify.Notification.new("Time is up!").show()
Notify.uninit()
sys.exit()
