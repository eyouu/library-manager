let decodeHtmlEntity = function (str) {
    let rep = str.replace(/&#x(\w*);/gi, frCharCode);
    return rep;
}

function frCharCode(match, dec) {
    let val = String.fromCharCode(parseInt(dec, 16));
    return val;
}




