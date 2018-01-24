// A C++ implementation of the Cradle part of the
// compiler program
//
//
#include <iostream>
#include <string>
#include <cctype>

void getChar(char& lookahead)
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
void Match(char	x, char& lookahead)
{
  if(lookahead == x)
  {
    getChar(lookahead);
  }
  else
  {
    std::string charstr;
    charstr += "''";
    charstr += x;
    charstr += "''"; 
    Expected(charstr);
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

// Get an indentifier
char getName(char& lookahead)
{
  if(!is_alpha(lookahead))
  {
    Expected("Name");
  }
  return std::toupper(lookahead);
  getChar(lookahead);
  
}

// Get a number
char getNum(char& lookahead)
{
  if(!is_digit(lookahead))
  {
    Expected("Integer");
  }
  return lookahead;
  getChar(lookahead);
}

int main()
{
  char lookahead;

}
  
