{Some basic 'cradle' functions for our compiler}
{based on J. Crenshaw's 1988 code}
{DAV - need a C or C++ version...}

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
procedure Term;
begin
  EmitLn('MOVE #' + GetNum + ',D0')
end;

{Recognise and Translate an Add}
procedure Add;
begin
  Match('+');
  Term;
  EmitLn('ADD D1,D0');
end;

{Regognise and Translate a Subtract}
procedure Subtract;
begin
  Match('-');
  Term;
  EmitLn('SUB D1,D0');
  EmitLn('NEG D0');
end;

{Parse and translte an Expression}
procedure Expression;
begin
  Term;
  EmitLn('MOVE D0,D1');
  case Look of
    '+': Add;
    '-': Subtract;
  else Expected('Addop');
  end;
end;


{-----Main-----}

{ Main }
begin
  Init;
  Expression;
end.
