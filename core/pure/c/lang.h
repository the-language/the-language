
#ifndef THE_LANGUAGE_h
#define THE_LANGUAGE_h

#if defined(__cplusplus)
extern "C" {
#endif

struct lang_state;
typedef struct lang_state lang_state;
extern lang_state *lang_state_new_orNULL(void);
extern void lang_state_delete(lang_state *L);

struct lang_value;
typedef struct lang_value lang_value;
extern void lang_value_delete(lang_state *L, lang_value *val);
extern lang_value *lang_value_copy_orNULL(lang_state *L, lang_value *val);
extern lang_value *lang_complex_parse_orNULL(lang_state *L, const char *str);
extern char *lang_complex_print_retMalloc_orNULL(lang_state *L, lang_value *val);
extern char *lang_simple_print_retMalloc_orNULL(lang_state *L, lang_value *val);

#if defined(__cplusplus)
}
#endif

#endif
