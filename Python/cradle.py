# A python version of of J. Crenshaw's
# Let's Build a Compiler Series

class Cradle(object):
  
  def __init__(self):
    self.lookahead = ""
    self.getChar()

  def getChar(self):
    #lookahead = raw_input()  # Python 2.7
    self.lookahead = input()

  def Expected(self, false_str):
    raise Exception(false_str + ' Expected')

  def Match(self, match_char):
    if self.lookahead == match_char:
      self.getChar()
    else:
      raise Exception("Expected: ", match_char)
      
  # We don't need a MatchAlpha and MatchDigit
  # because python already has builtins for this

  def getName(self):
    if not self.lookahead.isalpha():
      self.Expected('Name')
    else:
        result = self.lookahead.upper()
        self.getChar()
        return result
        
  def getNum(self):
      if not self.lookahead.isdigit():
        self.Expected('Integer')
      result = self.lookahead
      #getChar()
      return result
    
  def emit(self, s):
    """print a string with a Tab"""
    print("\t" + s)

  # Don't think this is actually necessary for python
  # c.f pascal version.
  def emitLn(self, s):
    """print a string with a tab and endline"""
    self.emit(s)
    #print("\n"):

  def init(self):
    self.getChar()
    
  def expression(self):
    self.emitLn('MOVE #' + self.getNum() + ',D0')

if __name__=="__main__":
  c = Cradle()
  c.expression()


  
        




