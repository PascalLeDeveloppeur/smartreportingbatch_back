const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');

const JWT_SIGN_SECRET = `un76zSiz!%*8/hHw@++gflascPAMitr3L%%copE9xam777_Merci_Dieu`;
const adminCodeStoredOnServer = `seSa2!hb#Tds9gbp+%4y49O2g-4cbgyr`;

exports.escapeSpecialChars = (text) => {
  //text.replace(/\\/g, ' &#092;');
  var map = {
    '\\': '&#092;',
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    "'": '&#039;'
  };
    
  return text.replace(/[\\&<>'"]/g, function(char) { return map[char]; });
}

exports.escapeHtml = (unsafe) => {
    return unsafe
         .replace(/&/g, "&amp;")
         .replace(/</g, "&lt;")
         .replace(/>/g, "&gt;")
         .replace(/"/g, "&quot;")
         .replace(/'/g, "&#039;")
         .replace(/\\/g, "&#092;");
 }



exports.generateCode = (nbrCharacter) => {
  let code = "";
  for(let i = 0; i < nbrCharacter; i++){

      let isUpperCase = Math.floor(Math.random() * 1);
      let randomNbr = Math.floor(Math.random() * 39);

      switch(randomNbr) {
          case 0:
              character = "0";
          break;
          case 1:
              character = "1";
          break;
          case 2:
              character = "2";
          break;
          case 3:
              character = "3";
          break;
          case 4:
              character = "4";
          break;
          case 5:
              character = "5";
          break;
          case 6:
              character = "6";
          break;
          case 7:
              character = "7";
          break;
          case 8:
              character = "8";
          break;
          case 9:
              character = "9";
          break;
          case 10:
              character = "a";
          break;
          case 11:
              character = "b";
          break;
          case 12:
              character = "c";
          break;
          case 13:
              character = "d";
          break;
          case 14:
              character = "e";
          break;
          case 15:
              character = "+";
          break;
          case 16:
              character = "-";
          break;
          case 17:
              character = ".";
          break;
          case 18:
              character = "f";
          break;
          case 19:
              character = "g";
          break;
          case 20:
              character = "h";
          break;
          case 21:
              character = "i";
          break;
          case 22:
              character = "j";
          break;
          case 23:
              character = "k";
          break;
          case 24:
              character = "l";
          break;
          case 25:
              character = "m";
          break;
          case 26:
              character = "n";
          break;
          case 27:
              character = "o";
          break;
          case 28:
              character = "p";
          break;
          case 29:
              character = "q";
          break;
          case 30:
              character = "r";
          break;
          case 31:
              character = "s";
          break;
          case 32:
              character = "t";
          break;
          case 33:
              character = "u";
          break;
          case 34:
              character = "v";
          break;
          case 35:
              character = "w";
          break;
          case 36:
              character = "x";
          break;
          case 37:
              character = "y";
          break;
          case 38:
              character = "z";
          break;

          default:
          character = "";
          
      }

      if (isUpperCase === 1 && randomNbr > 10) {
          character = character.toUpperCase();
      }
      
      
      code += character;
    
  }

  while(code < nbrCharacter) {
    code += Math.floor(Math.random() * 9);
  }
  return code;
}


async function encryptPassword(bcryptjs, pswd) {  
  try {
    const salt = await bcryptjs.genSalt(10);
    const hashPswd = await bcryptjs.hash(adminCodeStoredOnServer + pswd, salt)

    console.log('salt', salt);
    console.log('encryptedPasword : ', hashPswd);
    console.log('adminCodeStoredOnServer : ', adminCodeStoredOnServer);
    return hashPswd;    
  }
  
  catch (error) {
    console.log(error);
  }
};


async function comparePasswords(bcryptjs, newpswd, hashPswd) {

  try {
      console.log("Newpswd => => => => ", newpswd);
    const isTheSame = await bcryptjs.compare(adminCodeStoredOnServer + newpswd, hashPswd);
    if (isTheSame){
      console.log('Le mot de passe est le même.');
      return isTheSame;
    }
    else {
        console.log('Mauvais mot de passe');
        return isTheSame;     
    }    
  }
  
  catch (error) {    
    console.log(error);
  }
}


generateTokenForAdmin = (adminData) => {
    return jwt.sign({
        adminId : adminData.id,
        fullScope : adminData.has_full_scope,
        providerScope : adminData.has_provider_scope,
        memberScope : adminData.has_member_scope,
        lightScope : adminData.has_light_scope,
        adminValidated: adminData.admin_validated
    },
    JWT_SIGN_SECRET,
    {
        expiresIn : '1h'
    })
}


module.exports.generateTokenForAdmin = generateTokenForAdmin;
module.exports.bcryptjs = bcryptjs;
module.exports.adminCodeStoredOnServer = adminCodeStoredOnServer;
module.exports.encryptPassword = encryptPassword;
module.exports.comparePasswords = comparePasswords;