const secureFunctions = require('../security/securefunction');

exports.jsonClean = (jsonToClean) => {
    jsonToClean = JSON.stringify(jsonToClean);
    jsonToClean = jsonToClean.replace(/[\n\r]|\s{2,}/g, ''); // supprime les sauts de lignes et les grands espaces.
    jsonToClean = secureFunctions.escapeSpecialChars(jsonToClean);

}