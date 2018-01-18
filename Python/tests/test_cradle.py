# Tests for the Cradle class
import unittest
from unittest.mock import patch

import sys
import cradle as cr

class testCradle(unittest.TestCase):
    
   @patch('builtins.input', return_value='X')
   def test_Match(self):
      cr = Cradle()
      char_to_match = "X"
      self.assertEqual(cr.Match("X"), char_to_match) 

if __name__=='__main__':
    unittest.main()

