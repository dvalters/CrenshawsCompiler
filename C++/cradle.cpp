// A C++ implementation of the Cradle part of the
// compiler program
//
//
#include <iostream>
#include <string>

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

void Match(char x, std::string& lookahead)
{
  if (lookahead == x)
  {
    getChar(lookahead);
  }
  else
  {
    Expected("''" + x "''");
  }
}

int main()
{
  std::string lookahead
}
  
