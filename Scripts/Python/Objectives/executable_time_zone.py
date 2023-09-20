# datetime is a module for manipulating and displaying time.
import datetime

now = datetime.datetime.utcnow()
# This string describes the format to use for printing times:
#       Mon Oct 08 12:00 PM
format = "%a %b %d %I:%M %p"

print "Right now it is:"

# Use timedeltas to add and subtract times.
time = now + datetime.timedelta(hours=11)
print time.strftime(format), "Melbourne (UTC + 11)"

time = now + datetime.timedelta(hours=8)
print time.strftime(format), "Hong Kong (UTC + 8)"

time = now + datetime.timedelta(hours=2)
print time.strftime(format), "Paris (UTC + 2)"

print now.strftime(format), "Reykjavik (UTC)"

time = now - datetime.timedelta(hours=5)
print time.strftime(format), "Boston (UTC - 5)"

time = now - datetime.timedelta(hours=8)
print time.strftime(format), "San Francisco (UTC - 8)"

time = now - datetime.timedelta(hours=10)
print time.strftime(format), "Honolulu (UTC - 10)"
