# Makefile for the errno program.

# Redirect any of the standard MAKE variables if desired.
CC ?= c99
CFLAGS ?= -Woptimize=2
LDFLAGS ?=
TARGET ?= errno
INSTALL_DIR ?= /usr/local/bin

# Do not redirect OBJECTS
OBJECTS = errno.o

# Common C to object recipe
.c.o:
	$(CC) -c $(CFLAGS) -o $@ $<

# Primary build rule
all: $(TARGET)

# Installation rule. This is a simple copy. You might need to use sudo.
install: all
	cp -p $(TARGET) $(INSTALL_DIR)

# Cleanup
clean:
	rm -f $(TARGET) $(OBJECTS)

# Link step
$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $<

# Object build rules.
errno.o: errno.c

# Declaration of things that are not really things
.PHONY: all clean install
