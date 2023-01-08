# Makefile to build the lib and test it

.PHONY: all

all: check

check:
		zig build-lib -dynamic pil.zig && \
		./extract.l
