cd blake3c

ARCH=$(uname -m)

if [ "$ARCH" == "x86_64" ]; then
    make -f ../build/Makefile
elif [ "$ARCH" == "aarch64" ]; then
    BLAKE3_USE_NEON=1 make -f ../build/Makefile blake3_neon.o
else
    echo "Unsupported architecture: $ARCH"
    cd ..
    exit 1
fi

cd ..