import sys, math, requests
from sys import argv
import alfred
# from alfred import decode

def main():
	feedback = alfred.Feedback()
	try:
		feedback.addItem(title=str(eval(" ".join([unicode(s) for s in argv[1:]]))),
			subtitle='Press "enter" to copy the evaluation of ' + u' '.join([unicode(s) for s in argv[1:]]) + ' to the clipboard.',
			icon='python.png',
			arg=str(eval(u' '.join([unicode(s) for s in argv[1:]]))),
			valid=True)
	except Exception as e:
		feedback.addItem(title="Invalid Syntax...",
			subtitle=str(e),
			icon='python.png',
			valid=True)
	feedback.output()

if __name__ == '__main__':
	main()