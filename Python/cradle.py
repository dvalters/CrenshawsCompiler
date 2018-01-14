# A python version of of J. Crenshaw's
# Let's Build a Compiler Series

lookahead = ""

def getChar():
  #lookahead = raw_input()  # Python 2.x
  lookahead = input()

def Expected(false_str):
  raise(false_str + ' Expected')

def Match(match_char, lookahead):
  if lookahead == match_char:
    getChar()
  else:
    raise("Expected: ", match_char)
    
# We don't need a MatchAlpha and MatchDigit
# because python already has builtins for this

def getName():
  if not lookahead.isalpha():
    Expected('Name')
  else:
      result = lookahead.upper()
      getChar()
      return result
      
def getNum():
    if not lookahead.isdigit():
      Expected('Integer')
    else:
      result = lookahead
      getChar
      return result
  
def emit(s):
  """print a string with a Tab"""
  print("\t" + s)

# Don't think this is actually necessary for python
# c.f pascal version.
def emitLn(s):
  """print a string with a tab and endline"""
  emit(s)
  print("\n")

def init():
  getChar()
  
def expression():
  emitLn('MOVE #' + getNum + ',D0')


if __name__=="__main__":
  init()
  expression()


  
        




