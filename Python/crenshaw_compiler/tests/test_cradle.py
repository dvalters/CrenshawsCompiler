# Tests for the Cradle class
import unittest
from unittest.mock import patch

import crenshaw_compiler.cradle as cr

class testCradle(unittest.TestCase):
    
   @patch('builtins.input', return_value='X')
   def test_Match(self, input):
      compiler = cr.Cradle()
      char_to_match = "X"
      self.assertEqual(compiler.Match("X"), char_to_match) 

if __name__=='__main__':
    unittest.main()

