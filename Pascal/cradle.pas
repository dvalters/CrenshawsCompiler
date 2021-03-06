{Some basic 'cradle' functions for our compiler}
{based on J. Crenshaw's 1988 code}
{DAV - need a C or C++ version...}
{The assembly code produced by this compiler is}
{for 68000 assembler language}
program Cradle;

{Constant declarations}
const TAB = ^I;

{Variabe declaration}
var Look: char; { a lookahead character}

{Read new character from input stream}
procedure getChar;
begin
  Read(Look);
end;

{Report an error}
procedure Error(s: string);
begin
  WriteLn;
  WriteLn(^G, 'Error: ', s, '.');
end;

{Report an error and wait}
procedure Abort(s: string);
begin
  Error(s);
  Halt;
end;

{Report what was expected}
procedure Expected(s: string);
begin
  Abort(s + ' Expected')
end;

{Match a specific input character}
procedure Match(x: char);
begin
  if Look = x then getChar
  else Expected('''' + x + '''');
end;

{Recognize an alpha character}
function IsAlpha(c: char): boolean;
begin
  IsAlpha := upcase(c) in ['A'..'Z'];
end;

{Recognize a decimal digit}
function IsDigit(c: char): boolean;
begin
  IsDigit := c in ['0'..'9'];
end;

{Get an identifier}
function GetName: char;
begin
  if not IsAlpha(Look) then Expected('Name');
  GetName := UpCase(Look);
  GetChar;
end;

{Get a Number}
function GetNum: char;
begin
  if not IsDigit(Look) then Expected('Integer');
  GetNum := Look;
  GetChar;
end;

{Output a string with Tab}
procedure Emit(s: string);
begin
  Write(TAB, s);
end;

{Output a string with a Tab and CRLF}
procedure EmitLn(s: string);
begin
  Emit(s);
  WriteLn;
end;

{Initialise}
procedure Init;
begin
  GetChar;
end;

{-----Additional functions------}
{ We are going to rename this to term now}
{ Term -> Factor }
{Parse and translate a math factor}
procedure Expression; Forward;
{this allows the expression procedure to be
referenced here}

procedure Factor;
begin
  if Look = '(' then begin
    Match('(');
    Expression;
    Match(')');
    end
  else
    EmitLn('MOVE #' + GetNum + ',D0');
end;

{Recognise and translate a Multiply}
procedure Multiply;
begin
  Match('*');
  Factor;
  EmitLn('MULS (SP)+,D0');
end;

{Recognise and translate a Division}
procedure Divide;
begin 
  Match('/');
  Factor;
  EmitLn('MOVE (SP)+,D1');
  EmitLn('DIVS D1,D0');
end; 

{Parse and translate a math term}
procedure Term;
begin
  Factor;
  while Look in ['*', '/'] do begin
    EmitLn('MOVE D0,-(SP)');
    case Look of
      '*': Multiply;
      '/': Divide;
    else Expected('Mulop');
    end;
  end;
end;

{Recognise and Translate an Add}
procedure Add;
begin
  Match('+');
  Term;
  EmitLn('ADD (SP)+,D0');
end;

{Regognise and Translate a Subtract}
procedure Subtract;
begin
  Match('-');
  Term;
  EmitLn('SUB (SP)+,D0');
  EmitLn('NEG D0');
end;

{Recognise an Add Op}
function IsAddop(c: char): boolean;
begin
  IsAddop := c in ['+', '-'];
end;

{Parse and translate an Expression}
procedure Expression;
begin
  if IsAddop(Look) then
    EmitLn('CLR D0')
  else
    Term;
  while IsAddop(Look) do begin
    EmitLn('MOVE D0,-(SP)');
    case Look of
      '+': Add;
      '-': Subtract;
    else Expected('Addop');
    end;
  end;
end;


{-----Main-----}

{ Main }
begin
  Init;
  Expression;
end.
