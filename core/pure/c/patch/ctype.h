/* ctype.h 單文件時起作用，只用於精簡 */

#ifndef string_isspace_h
#define string_isspace_h

/* 避免与标准库符号冲突 */
#define isspace user_defined_isspace

/* https://github.com/bminor/musl/blob/da55d4884bf26ce31cd6a64ed176019c2ba9839a/src/ctype/isspace.c */
static inline int isspace(int c) {
	return c == ' ' || (unsigned)c-'\t' < 5;
}

#endif
