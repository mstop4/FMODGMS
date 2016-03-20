echo "Building libfmodgms..."
g++ -m32 -Wall -Wno-unknown-pragmas -fPIC -c fmodgms.cpp
g++ -m32 -shared -Wl,-soname,libfmodgms.so.0 -o libfmodgms.so fmodgms.o -L. -lfmod
#ln -sf libfmodgms.so.0.5 libfmodgms.so
#ln -sf libfmodgms.so.0.5 libfmodgms.so.0
echo "Finished"
