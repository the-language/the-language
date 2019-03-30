
#ifndef THE_LANGUAGE_h
#define THE_LANGUAGE_h

#ifdef __cplusplus
extern "C" {
#endif

#include "lua.h"

typedef struct lang_state { lua_State *L; } lang_state;
extern lang_state *state_new(void);
extern void state_delete(lang_state *L);

#ifdef __cplusplus
}
#endif

#endif
