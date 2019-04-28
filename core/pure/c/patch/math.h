/* math.h 單文件時起作用，只用於精簡 */

#ifndef math_unFLOOR_unPOW_h
#define math_unFLOOR_unPOW_h

#include <assert.h>


#define pow(base, exponent) ({assert(!"[錯誤]pow()未實現 : pow("#base","#exponent")");*((volatile int*)0)=0;(double)*((volatile double*)0);})
#define floor(x) ({assert(!"[錯誤]floor()未實現 : floor("#x")");*((volatile int*)0)=0;(double)*((volatile double*)0);})

#endif
