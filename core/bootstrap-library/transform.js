
const L = require('the-language')
const fs = require('fs')
let files={}
for(const file of fs.readdirSync('src')){
    files[file]=fs.readFileSync('src/'+file, 'utf8')
}
while(true){
    const files2={}
    let changed=false
    for(const file in files){
	for(const file_r in files){
	    if(file_r!==file){
		const r=files[file_r].replace("*("+file+")",files[file])
		if(r!==files[file_r]){
		    changed=true
		}
		files2[file_r]=r
	    }
	}
    }
    if(!changed){break;}
    files=files2
}
for(const file in files){
    fs.writeFileSync('transformed/'+file, L.simple_print(L.force_all_rec(L.evaluate(L.env_null_v, L.complex_parse(files[file])))) + '\n')
}

