const fs=require('fs');
const [,, src, body, out]=process.argv;
let h=fs.readFileSync(src,'utf8');
const logo=h.match(/src="(data:image\/png;base64,[^"]+)"/)[1];
const head=h.slice(0,h.indexOf('<body>'));
const tail=h.slice(h.indexOf('<script>'));
fs.writeFileSync(out, head+fs.readFileSync(body,'utf8').replaceAll('__LOGO__',logo)+'\n'+tail);
