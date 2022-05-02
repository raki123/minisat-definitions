git submodule update --init
mkdir bin
rm -rf build
mkdir build
cd build 
if [ "$1" = "static" ]; then
        cmake -DSTATIC=ON ..
else
        cmake ..
fi
make -j4
cp defined ../bin/
cp minisat/minisat ../bin/
