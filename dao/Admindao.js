// Création de la classe AdminDAO que j'exporte
module.exports = class AdminDAO {
    constructor() {
        // Connexion à la base de donnée dès l'instanciation
        this.mysqlconnection = require('../db/dbConnection');
    }

    /* Méthode qui vérifie si un admin est autorisé à s'enregistrer.
    Elle attend un Callback en retour */
    checkIfNewAdminIsNeeded(adminPseudo, callback) {

        // Appel de la procédure stockée
        this.mysqlconnection.query(`CALL sp_check_if_new_admin_is_needed('${adminPseudo}')`, (err, rows, fields) => {
            // Si tout ce passe bien
            if(!err){
                callback(rows);
            }

            // sinon
            else {
                console.error(err);
            }
        })
    
    }

    register(adminPseudo, encryptedAdminPassword, callback){
        this.mysqlconnection.query(`CALL sp_register_admin('${adminPseudo}', '${encryptedAdminPassword}')`, (err, rows, fields) => {
            if(!err){
                callback(rows);
            }
            else {
                console.error(err);
            }
        })    
    }

    login(adminPseudo, encryptedAdminPassword, callback){
        this.mysqlconnection.query(`CALL sp_login_admin('${adminPseudo}', '${encryptedAdminPassword}')`, (err, rows, fields) => {
            if(!err){
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    
    }

    adminAuthentication(adminPseudo, callback){
        this.mysqlconnection.query(`CALL sp_admin_authentication('${adminPseudo}')`, (err, rows, fields) => {
            if(!err){
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    
    }

    getScopeForAdminJwt(adminId, callback){
        this.mysqlconnection.query(`CALL sp_get_scope_for_admin_jwt(${adminId})`, (err, rows, fields) => {
            if(!err){
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    
    }

    insertAdminToken(tokenId, adminToken, callback){
        console.log('DAO => TOKEN ID : ', tokenId);
        console.log('DAO => TOKEN : ', adminToken);
        this.mysqlconnection.query(`CALL sp_insert_admin_token(${tokenId}, '${adminToken}')`, (err, rows, fields) => {
            if(!err){
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    
    }


    
}