#!/bin/bash

# Compile Lua source files and create object files
for file in lapi.c lcode.c lctype.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c lmem.c lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c ltm.c lundump.c lvm.c lzio.c lauxlib.c lbaselib.c lcorolib.c ldblib.c liolib.c lmathlib.c loslib.c lstrlib.c ltablib.c lutf8lib.c loadlib.c linit.c; do
    echo "$file creating objects.."
    echo "created ${file%.c}.o" 
    gcc -c "$file" -o "${file%.c}.o" -fPIC
done

# Create a static library liblua.a from the object files
ar r liblua.a *.o

# Create a shared library liblua.so from the object files
gcc -shared -o liblua.so *.o

# Copy the Lua executable to /usr/local/bin
echo "if prompted, enter password to copy to /usr/local/bin"
sudo cp lua /usr/local/bin/
echo "done!"
