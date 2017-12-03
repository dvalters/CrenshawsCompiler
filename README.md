# Crenshaw's Compiler

This code follows Jack Crenshaw's "Let's build a compiler" series of articles.

You will need a Pascal compiler to build this code.

I recommend "FreePascal".

On Fedora, you can install this with:

`dnf install fpc`

(I will make a version in a more sensible programming language one day)

## A note on Pascal
Pascal is a programming language released in 1970. It is a fullly-fledged
procedural style programming language, though it may seem a bit verbose
compared to today's funky programming languages like Python. The last
standard for Pascal was released in 1990. It is largely regarded as obsolete
now except for educational purposes, but this is what Jack Crenshaw used
to write his compiler tutorial back then, and it is still a pleasingly 
readable language to use.

### Compiling the examples
If you are using FreePascal (fpc), you can compile a Pascal binary with:

```
fpc [-o<binaryname.exe>] mycode.pas
```


