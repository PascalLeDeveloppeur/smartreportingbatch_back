const adminDAO = require('../dao/Admindao');
const adminDao = new adminDAO();
const mainDAO = require('../dao/Maindao');
const mainDao = new mainDAO();
const secureFunction = require('../security/securefunction');



exports.register = (req, res) => {
    let adminPseudo = req.body.adminpseudo;
    let adminPassword = req.body.adminpassword;
    
    if (!adminPseudo || !adminPassword || adminPseudo.includes(`script`) || adminPassword.includes(`script`)){
        res.status(400).json({ error : 'All parameters are required or XSS detected'});
    }
    else {

        adminPseudo = secureFunction.escapeSpecialChars(adminPseudo);
        adminPassword = secureFunction.escapeSpecialChars(adminPassword);
        console.log("---------------------------------------------------------------------");
        console.log("Pseudo administrateur : ", adminPseudo);
        console.log("Mot de passe non crypté administrateur : ", adminPassword);

        adminDao.checkIfNewAdminIsNeeded(adminPseudo, (callbackCheckIfNewAdminIsNeeded) => {
            console.log("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");
            console.log("Dans admincontroller > register > adminDao.checkIfNewAdminIsNeeded");
            console.log("v_message : ", callbackCheckIfNewAdminIsNeeded[0][0].v_message);
            if (callbackCheckIfNewAdminIsNeeded[0][0].v_message === ""){
                res.status(500).json({ error : 'An issue has occured! err:2' });        
            }

            if (callbackCheckIfNewAdminIsNeeded[0][0].v_message === "Pseudo already exists"){
                res.status(400).json({ error : 'Pseudo already exists!'});         
            }        

            if (callbackCheckIfNewAdminIsNeeded[0][0].v_message === "No admin pending"){
                    res.status(400).json({ error : 'No admin pending! Ask super admin for adding another admin.'});         
            }

            if (callbackCheckIfNewAdminIsNeeded[0][0].v_message === "Ready to register admin") {

                // Encodage du mot de passe
                const bcryptjs = secureFunction.bcryptjs;

                // Ci-dessous, encryptPassword est une fonction asynchrone
                const encryptedAdminPasswordAsynch = secureFunction.encryptPassword(bcryptjs, adminPassword);
                // const encryptedAdminPasswordAsynch = secureFunction.encryptPassword(bcryptjs, "bébé");

                encryptedAdminPasswordAsynch.then((encryptedAdminPassword) => {

                    encryptedAdminPassword = encryptedAdminPassword.replace('$2a$', 'ih%?4qZ')

                    console.log("Encrypted password from admincontroller: ", encryptedAdminPassword);
                    console.log("================================");

                    adminDao.register(adminPseudo, encryptedAdminPassword, (callbackRegister) =>{
                        console.log("Dans admincontroller > register > adminDao.checkIfNewAdminIsNeeded > adminDao.register");
                        if (callbackRegister[0][0].v_message === "" || callbackRegister[0][0].v_message === "An issue has occured!"){
                            res.status(500).json({ error : 'An issue has occured! err:3' });        
                        }
                        else{
                            res.status(201).json({ message : callbackRegister[0][0].v_message });
                        }                
                    })   
                })

                
            }
        });
    }  
}

exports.login = (req, res) => {
    let adminPseudo = req.body.adminpseudo;
    let adminPassword = req.body.adminpassword;

    if (!adminPseudo || !adminPassword || adminPseudo.includes(`script`) || adminPassword.includes(`script`)){
        res.status(400).json({ error : 'All parameters are required !'});
    }
    else {
        adminPseudo = secureFunction.escapeSpecialChars(adminPseudo);
        adminPassword = secureFunction.escapeSpecialChars(adminPassword);

        adminDao.adminAuthentication(adminPseudo, (callbackadminAuthentication) =>{
            console.log("Dans admincontroller > adminDao.adminAuthentication");        
            if (callbackadminAuthentication[0][0].v_message === "" || callbackadminAuthentication[0][0].v_message === "An issue has occured!"){
                res.status(500).json({ error : 'An issue has occured! err:4' });        
            }
            else if (callbackadminAuthentication[0][0].v_message === "Pseudo doesn't exist"){
                res.status(401).json({ error : 'Wrong credential'}); 
            }
            else{
                console.log(`-----------------------------------------------------------------------------------`);
                console.log("callbackadminAuthentication[0][0] : ", callbackadminAuthentication[0][0]);
                const hashPswd = (callbackadminAuthentication[0][0].encrypted_admin_password).replace('ih%?4qZ', '$2a$');
                const bcryptjs = secureFunction.bcryptjs;
                const isTheSame = secureFunction.comparePasswords(bcryptjs, adminPassword, hashPswd);
    
                isTheSame.then((isAdminLoginOk) => {
                    if (isAdminLoginOk) {
                        adminDao.getScopeForAdminJwt(callbackadminAuthentication[0][0].id, (callbackGetScopeForAdminJwt) => {
                            console.log("-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-");
                            console.log("admincontroller > login > adminDao.adminAuthentication > adminDao.getScopeForAdminJwt");
                            console.log("Id à envoyer en paramètre : ", callbackadminAuthentication[0][0].id);

                            // CREATION DU TOKEN A METTRE A L'ID callbackadminAuthentication[0][0].id de la table
                            const adminToken = secureFunction.generateTokenForAdmin(callbackGetScopeForAdminJwt[0][0]);
                            console.log('+++++++++++++++++++++++++++++++++++++++', adminToken);
                            console.log('ID DU TOKEN : ', callbackGetScopeForAdminJwt[0][0].fk_srb_token_and_scope_id);

                            adminDao.insertAdminToken(callbackGetScopeForAdminJwt[0][0].fk_srb_token_and_scope_id, adminToken, (callbackInsertAdminToken) => {
                                console.log('callbackInsertAdminToken[0][0] ==>', callbackInsertAdminToken[0][0]);
                                if (callbackInsertAdminToken[0][0].v_message === "Admin Token inserted!"){                                    

                                    res.status(200).json({ token : adminToken });
                                }
                                else {
                                    res.status(500).json({ error : 'An issue has occured!5' });
                                }                                
                            })

                        })
                    }
                    else {
                        res.status(401).json({ error : 'Wrong credential'});                    
                    }
                }).catch(() => {
                    res.status(500).json({ error : 'An issue has occured!6' });   
                })
            }                
        })
    }
}