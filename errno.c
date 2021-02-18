/**
 * @file
 * Errno in OSS.
 * Copyright(c) 2021 Nexbridge Inc.
 *
 * Contributed as part of the MIT Public License.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

void Usage(char *progname) {
	char *name = strrchr(progname,'/');
	if (name) {
		name++;
	} else {
		name = progname;
	}

	fprintf(stderr, "usage: %s error-number\n", name);
	exit(1);
}

int main(int argc, char **argv) {
	char *endp;
	if (argc != 2) {
		Usage(argv[0]);
	}

	/* This actually sets errno */
	errno = strtol(argv[1], &endp, 10);
	printf("%d: %s\n", errno, strerror(errno));

	return 0;
}

