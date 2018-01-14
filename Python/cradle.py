# A python version of of J. Crenshaw's
# Let's Build a Compiler Series

lookahead = ""

def getChar():
  #lookahead = raw_input()  # Python 2.x
  lookahead = input()

def Expected(false_str):
  pass

def Match(match_char, lookahead):
  if lookahead == match_char:
    getChar()
  else:
    raise("Expected: ", match_char)
    
# We don't need a MatchAlpha and MatchDigit
# because python already has builtins for this

def getName():
  if not lookahead.isalpha():
    raise("Expected: Name")
  else:
      pass




