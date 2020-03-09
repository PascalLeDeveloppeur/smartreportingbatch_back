const mysqlconnection = require('../db/dbConnection');



exports.listNetworkAndProvider = (callback) => {
    
    mysqlconnection.query("CALL sp_get_service_provider_and_network()", (err, rows, fields) => {
        if(!err){
            callback(rows);
        }
        else {
            console.error(err);
        }
    })
   
}

exports.mainStartForAutomation = (callback) => {
    
    mysqlconnection.query("CALL sp_get_credential_for_automation()", (err, rows, fields) => {
        if(!err){
            callback(rows);
        }
        else {
            console.error(err);
        }
    })
   
}

exports.getCredentialByProviderAndNetwork = (providerId, networkId, callback) => {
    
    mysqlconnection.query(`CALL sp_get_credential_by_service_provider_id_and_network_id(${providerId}, ${networkId})`, (err, rows, fields) => {
        if(!err){
            callback(rows);
        }
        else {
            console.error(err);
        }
    })
}

exports.deleteAllBatchesAndMediaAndLog = (callback) => {
    mysqlconnection.query(`CALL sp_delete_all_batches_and_media_and_log()`, (err, rows, fields) => {
        if(!err){
            callback(rows);
        }
        else {
            console.error(err);
        }
    })
}

exports.showAllBatchesAndMediaAndLinkedMedia = (callback) => {
    mysqlconnection.query(`CALL sp_show_all_batches_and_media_and_linked_media()`, (err, rows, fields) => {
        if(!err){
            callback(rows);
        }
        else {
            console.error(err);
        }
    })
}

exports.deleteAllAboutAdmin = (callback) => {
    mysqlconnection.query(`CALL sp_delete_all_about_admin()`, (err, rows, fields) => {
        if(!err){
            callback(rows);
        }
        else {
            console.error(err);
        }
    })
}

exports.showAllAboutAdmin = (callback) => {
    mysqlconnection.query(`CALL sp_show_all_about_admin()`, (err, rows, fields) => {
        if(!err){
            callback(rows);
        }
        else {
            console.error(err);
        }
    })
}

exports.checkLogNotification = (callback) => {
    mysqlconnection.query(`CALL sp_check_log_notification()`, (err, rows, fields) => {
        if(!err){
            callback(rows);
        }
        else {
            console.error(err);
        }
    })
}



exports.getBatchByProviderAndNetwork = (providerId, networkId, callback) => {
    // Je n'ai pas encore fini. La procédure stockée n'existe pas
    mysqlconnection.query(`CALL sp_get_credential_by_service_provider_id_and_network_id(${providerId}, ${networkId})`, (err, rows, fields) => {
        if(!err){
            callback(rows);
        }
        else {
            console.error(err);
        }
    })
}


exports.insertBatch = (theBatch, postQtity, providerId, callback2) => {
    mysqlconnection.query(`CALL sp_insert_batch('${theBatch}', ${postQtity}, '${providerId}')`, (err, rows, fields) => {
        if(!err){
            callback2('Batch stored !');
        }
        else {
            console.error(err);
        }
    })
}

exports.step1BeforeRequestToApi = (facebookRequest, providerId, networkId, callback) => {
    mysqlconnection.query(`CALL sp_step1__before_request_to_api_for_batch('${facebookRequest}', ${providerId}, ${networkId})`, (err, rows, fields) => {
        if(!err){
            callback(rows);
        }
        else {
            console.error(err);
        }
    })
}

exports.step2SaveOfBatch = (batchId, requestDuration, requestStatus, jsonFromNetwork, serviceProviderId, networkId, callbackSaveBatch) => {
    console.log("====================================================================");
    console.log("BEFORE BATCH : ");
    console.log("Provider ID : ", serviceProviderId);
    console.log("Network ID : ", networkId);
    console.log("json : ", jsonFromNetwork);
    console.log("====================================================================");
    mysqlconnection.query(`CALL sp_step2__save_of_batch(${batchId}, ${requestDuration}, ${requestStatus}, '${jsonFromNetwork}', ${serviceProviderId}, ${networkId})`, (err, rows, fields) => {
        console.log("************* sp_step2__save_of_batch");
        if(!err){
            callbackSaveBatch(rows);
        }
        else {
            console.error('### ERREUR ! ###');
            console.error(`CALL sp_step2__save_of_batch(${requestDuration}, ${requestStatus}, ${jsonFromNetwork})`);
            console.error('### ERREUR ! ###', err);
        }
    })
}

exports.step3SaveOfMediaHistory = (providerId, networkId, batchId, callbackSaveOfMediaHistory)=> {
    let isAutomatedMode = 1;
    mysqlconnection.query(`CALL sp_step3__save_of_media_history(${providerId}, ${networkId}, ${batchId}, ${isAutomatedMode})`, (err, rows, fields) => {
    console.log("OOOOOOOOOOO sp_step3__save_of_media_history OOOOOOOOO");
    if(!err){
        callbackSaveOfMediaHistory(rows);
    }
    else {
        console.error('### ERREUR ! ###');
        console.error(`CALL sp_step3__save_of_media_history(${providerId}, ${networkId}, ${batchId}, ${isAutomatedMode})`);
        console.error('### ERREUR ! ###', err);
    }
    })
}

exports.linkMediaAndMember = (callbacklinkMediaAndMember)=> {
    mysqlconnection.query(`CALL sp_link_media_and_member_part1()`, (err, rows, fields) => {
    
    if(!err){
        callbacklinkMediaAndMember(rows);
    }
    else {
        console.error('### ERREUR ! ###');
        console.error(`CALL sp_get_media_by_member_part1()`);
        console.error('### ERREUR ! ###', err);
    }
    })
}
