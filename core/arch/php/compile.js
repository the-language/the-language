const compile = require('ts2php').compile

const options = {
    allowJs: true
}
const filePath = "lang.out.ts"

const result = compile(filePath, options)
console.log(result.phpCode)