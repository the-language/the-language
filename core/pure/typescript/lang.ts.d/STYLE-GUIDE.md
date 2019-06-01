* 用`export{...}`，不用`export const .../export function...`，否則生成的ES3代碼內部使用`exports`，使其他代碼有能力破壞，而且性能不夠好
* 用`const enum ...`。如果沒有const不能過`google-closure-compiler -O ADVANCED ...`
* 儘量用`const`。不能用`var`。可以用`let`。
