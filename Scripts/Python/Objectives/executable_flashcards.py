# sys is a module. It lets us access command line arguments, which are
# stored in sys.argv.
import sys

if len(sys.argv) < 2:
    print "Please supply a flash card file."
    exit(1)

flashcard_filename = sys.argv[1]
with open(flashcard_filename, 'r') as f:
    for line in f.readlines():
        # line format is:
        #    question,answer
        # strip() removes any trailing whitespace (like newlines).
        # split(",") turns a string into a list of elements, split on ','.
        question, answer = line.strip().split(",")
        print "Question: " + question
        raw_input("> Press return to show answer ")
        print "Answer: " + answer
        print "" # Print an empty line.
