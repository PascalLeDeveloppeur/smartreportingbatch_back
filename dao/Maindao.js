// Création de la classe MainDAO que j'exporte
module.exports = class MainDAO {
    constructor() {
        // Connexion à la base de donnée dès l'instanciation
        this.mysqlconnection = require('../db/dbConnection');

        console.log("\n - - => Maindao connecté à la BDD ! \n");
    };

    listNetworkAndProvider = (callback) => {

        this.mysqlconnection.query("CALL sp_get_service_provider_and_network()", (err, rows, fields) => {
            if (!err) {
                callback(rows);
            }
            else {
                console.error(err);
            }
        })

    }

    mainStartForAutomation = (callback) => {

        console.log("\n                                                                                - - => LDans Maindao > mainStartForAutomation\n");


        this.mysqlconnection.query("CALL sp_get_credential_for_automation()", (err, rows, fields) => {
            if (!err) {
                callback(rows);
            }
            else {
                console.error("Erreur");
            }
        })

    }

    getCredentialByProviderAndNetwork = (providerId, networkId, callback) => {

        this.mysqlconnection.query(`CALL sp_get_credential_by_service_provider_id_and_network_id(${providerId}, ${networkId})`, (err, rows, fields) => {
            if (!err) {
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    }

    deleteAllBatchesAndMediaAndLog = (callback) => {
        this.mysqlconnection.query(`CALL sp_delete_all_batches_and_media_and_log()`, (err, rows, fields) => {
            if (!err) {
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    }

    showAllBatchesAndMediaAndLinkedMedia = (callback) => {
        this.mysqlconnection.query(`CALL sp_show_all_batches_and_media_and_linked_media()`, (err, rows, fields) => {
            if (!err) {
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    }

    deleteAllAboutAdmin = (callback) => {
        this.mysqlconnection.query(`CALL sp_delete_all_about_admin()`, (err, rows, fields) => {
            if (!err) {
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    }

    showAllAboutAdmin = (callback) => {
        this.mysqlconnection.query(`CALL sp_show_all_about_admin()`, (err, rows, fields) => {
            if (!err) {
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    }

    checkLogNotification = (callback) => {
        this.mysqlconnection.query(`CALL sp_check_log_notification()`, (err, rows, fields) => {
            if (!err) {
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    }



    getBatchByProviderAndNetwork = (providerId, networkId, callback) => {
        // Je n'ai pas encore fini. La procédure stockée n'existe pas
        this.mysqlconnection.query(`CALL sp_get_credential_by_service_provider_id_and_network_id(${providerId}, ${networkId})`, (err, rows, fields) => {
            if (!err) {
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    }


    insertBatch = (theBatch, postQtity, providerId, callback2) => {
        this.mysqlconnection.query(`CALL sp_insert_batch('${theBatch}', ${postQtity}, '${providerId}')`, (err, rows, fields) => {
            if (!err) {
                callback2('Batch stored !');
            }
            else {
                console.error(err);
            }
        })
    }

    step1BeforeRequestToApi = (facebookRequest, providerId, networkId, callback) => {

        console.log("\n                                                                                - - => Dans Maindao > step1BeforeRequestToApi\n");

        this.mysqlconnection.query(`CALL sp_step1__before_request_to_api_for_batch('${facebookRequest}', ${providerId}, ${networkId})`, (err, rows, fields) => {
            if (!err) {
                callback(rows);
            }
            else {
                console.error(err);
            }
        })
    }

    step2SaveOfBatch = (batchId, requestDuration, requestStatus, jsonFromNetwork, serviceProviderId, networkId, callbackSaveBatch) => {

        console.log("\n                                                                                - - => Dans Maindao > step2SaveOfBatch\n");

        console.log("====================================================================");
        console.log("BEFORE BATCH : ");
        console.log("Provider ID : ", serviceProviderId);
        console.log("Network ID : ", networkId);
        console.log("json : ", jsonFromNetwork);
        console.log("====================================================================");
        this.mysqlconnection.query(`CALL sp_step2__save_of_batch(${batchId}, ${requestDuration}, ${requestStatus}, '${jsonFromNetwork}', ${serviceProviderId}, ${networkId})`, (err, rows, fields) => {
            console.log("************* sp_step2__save_of_batch");
            if (!err) {
                callbackSaveBatch(rows);
            }
            else {
                console.error('### ERREUR ! ###');
                console.error(`CALL sp_step2__save_of_batch(${requestDuration}, ${requestStatus}, ${jsonFromNetwork})`);
                console.error('### ERREUR ! ###', err);
            }
        })
    }

    step3SaveOfMediaHistory = (providerId, networkId, batchId, callbackSaveOfMediaHistory) => {

        console.log("\n                                                                                - - => Dans Maindao > step3SaveOfMediaHistory\n");

        let isAutomatedMode = 1;
        this.mysqlconnection.query(`CALL sp_step3__save_of_media_history(${providerId}, ${networkId}, ${batchId}, ${isAutomatedMode})`, (err, rows, fields) => {
            console.log("OOOOOOOOOOO sp_step3__save_of_media_history OOOOOOOOO");
            if (!err) {
                callbackSaveOfMediaHistory(rows);
            }
            else {
                console.error('### ERREUR ! ###');
                console.error(`CALL sp_step3__save_of_media_history(${providerId}, ${networkId}, ${batchId}, ${isAutomatedMode})`);
                console.error('### ERREUR ! ###', err);
            }
        })
    }

    linkMediaAndMember = (callbacklinkMediaAndMember) => {
        this.mysqlconnection.query(`CALL sp_link_media_and_member_part1()`, (err, rows, fields) => {

            if (!err) {
                callbacklinkMediaAndMember(rows);
            }
            else {
                console.error('### ERREUR ! ###');
                console.error(`CALL sp_get_media_by_member_part1()`);
                console.error('### ERREUR ! ###', err);
            }
        })
    }

}