echo "Building libfmodgms..."
clang++ -std=c++14 -stdlib=libstdc++ -m32 -Wall -Wno-unknown-pragmas -fPIC -c fmodgms.cpp
clang++ -m32 -shared -Wl,-soname,libfmodgms.so.0 -Wl,-rpath,"\$ORIGIN" -o libfmodgms.so fmodgms.o -L. -lfmod
echo "Finished"
