#!/bin/bash

echo "compiling, please be patient."

# Compile Lua source files and create object files
for file in lapi.c lcode.c lctype.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c lmem.c lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c ltm.c lundump.c lvm.c lzio.c lauxlib.c lbaselib.c lcorolib.c ldblib.c liolib.c lmathlib.c loslib.c lstrlib.c ltablib.c lutf8lib.c loadlib.c linit.c; do
    echo "$file creating object files..."
    gcc -c "$file" -o "${file%.c}.o" -fPIC
done

# Create a static library liblua.a from the object files
ar r liblua.a *.o

# Create a shared library liblua.so from the object files
ld *.o -o liblua.so -shared

# Compile lua.c and link it with liblua.a to create the Lua interpreter
gcc lua.c -o lua -lm -L. -llua

echo "Done."