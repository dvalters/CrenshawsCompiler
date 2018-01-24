// A C++ implementation of the Cradle part of the
// compiler program
//
//
#include <iostream>
#include <string>
#include <cctype>

void getChar(std::string& lookahead)
{
  std::cin >> lookahead;
}

void Error(std::string errstr)
{
}

void Abort(std::string errstr)
{
  Error(errstr);
  exit(-1);
}

void Expected(std::string str)
{
  Abort(str + " Expected");
}

// Match a character with the lookahead character
void Match(std::string x, std::string& lookahead)
{
  if(lookahead == x)
  {
    getChar(lookahead);
  }
  else
  {
    Expected("''" + x + "''");
  }
}

// Recognise an alpha character
bool is_alpha(char chr)
{
  return std::isalpha(static_cast<unsigned char>(chr));
}

// Recognise a number character
bool is_digit(char chr)
{
  return std::isdigit(static_cast<unsigned char>(chr));
}


int main()
{
  std::string lookahead;
}
  
