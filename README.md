# simple-antlr-no-AST

This is way to use antlr without actually storing anything in an Abstract Syntax Tree. Un-advisable, but do-able.

I used this method to build a STRIPS planner where there were no transformations that needed to be done on the AST.

The structure for an AST will still be parsed out by the grammar provided (in the g4 file). The key is to just save the data needed as an object gets parsed. Then any data members of the parser can be accessed by putting code into the @parser::members block.
