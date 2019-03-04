#!/bin/sh

cp $1 ./cpmz80_roms.hex
objcopy --input-target=ihex --output-target=binary cpmz80_roms.hex cpmz80_roms.bin
xxd -i cpmz80_roms.bin target/blackice/iceboot/cpmz80_roms.h
