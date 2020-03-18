const mainDAO = require('../dao/Maindao');
const mainDao = new mainDAO();
const facebook = require('../services/facebook/indexfacebook');
const secureFunctions = require('../security/securefunction');
const emailer = require('../services/emailer/emailer');


exports.index = (req, res, next)=>{
    res.send(`Welcome to Smart Reporting Bash`);
    
}

exports.listNetworkAndProvider = (req, res, next) => {
    mainDao.listNetworkAndProvider(
        (callbackContent) => {
            console.log(callbackContent);
            res.send(callbackContent);
        }
    );
    
}

exports.mainStartForAutomation = (req, res, next) => {

    let nbrPosts = req.params.nbrPosts; // nombre de posts à récupérer par réseau social pour chaque provider

    console.log("\n\nLe nombre de posts demandé via l'url est : ", nbrPosts,"\n\n");
    console.log("\n                                                                                - - => Lancement de mainController > mainStartForAutomation\n");


    // Récupération des credentials pour chaque service provider
    mainDao.mainStartForAutomation(
        (callbackContent) => {
            for (let credential of callbackContent[0]) {
                let credentialId = credential.id;
                let serviceProviderId = credential.service_provider_id;
                let network = (credential.network).toLowerCase();
                let networkId = credential.network_id;
                let serviceProviderToken = credential.service_provider_token;

                console.log("--------------------------");
                console.log("Network :", network);
                console.log("Network id :", networkId);
                console.log("Provider id :", serviceProviderId);
                console.log("Token :", serviceProviderToken);



                // ////////////////////////////////////////////
                // ////////////  FACEBOOK /////////////////////
                // Si les crédentials sont pour le réseau Facebook
                // ////////////////////////////////////////////


                
                
                if (network == 'facebook'){
                    serviceProviderPageId = credential.service_provider_page_id;
                    let facebookRequest = facebook.facebookRequest;
                    facebookRequest = facebookRequest.replace(':pageid', serviceProviderPageId);
                    facebookRequest = facebookRequest.replace(':pagetoken', serviceProviderToken);
                    
                    console.log("Page id :", serviceProviderPageId);
                    console.log("facebookRequest :", facebookRequest);   
                    
                    
                    // Détermination du nombre de requêtes qui permettent de récupérer le nombre de posts souhaité.
                    // Chaque requête récupère 25 posts
                    let batchLoop = Math.ceil(nbrPosts / 25);






                    for (let i = 0; i < batchLoop; i++){

                    }
                    // Introduction de données dans le log avant la requête à l'API du réseau social
                    console.log("\n- - =>  Introduction de données dans le log avant la requête à l'API du réseau social\n");

                    console.log("\n                                                                                - - => Lancement de mainController > step1BeforeRequestToApi\n");

                    mainDao.step1BeforeRequestToApi(facebookRequest, serviceProviderId, networkId, (callbackBeforeRequestToApi) => {

                        console.log("\n- - =>  Le log a bien été modifié.\n");

                        let batchId = callbackBeforeRequestToApi[0][0].batch_id;
                        console.log("--------------------------");
                        console.log("CallbackBeforeRequestToApi");
                        console.log("Batch ID  : ", batchId);
                        console.log("Network ID  : ", networkId);
                        console.log("Provider ID : ", serviceProviderId);
                        console.log(callbackBeforeRequestToApi);
                        
                        let dateTimeStartRequestToApi = Date.now();


                        
                        // Requête à l'API du réseau social
                        facebook.facebookBatchInAutomation(facebookRequest, (callbackRequestToApi) => {
                            let requestDuration = (Date.now() - dateTimeStartRequestToApi)/1000;
                            console.log("--------------------------");
                            console.log("Request Duration :", requestDuration);


                            console.log("\n                                                                                - - => réponse du réseau social :\n", callbackRequestToApi, "\n-----------------------------------------------------------------");



                            let requestStatus, jsonFromNetwork;
                            if (callbackRequestToApi){
                                requestStatus = 1;
                                jsonFromNetwork = callbackRequestToApi;
                            }
                            else {
                                requestStatus = -1;
                                jsonFromNetwork = JSON.parse('{"No batch" : "No batch"}');
                            }

                            jsonFromNetwork = JSON.stringify(jsonFromNetwork);
                            jsonFromNetwork = secureFunctions.escapeSpecialChars(jsonFromNetwork);
                            jsonFromNetwork = jsonFromNetwork.replace(/[\n\r]|\s{2,}/g, ''); // supprime les sauts de lignes et les grands espaces.


                            console.log("-----------------------------------------------------------------\nJson reçcu du réseau social : \n", jsonFromNetwork  , "\n-----------------------------------------------------------------");

                            console.log("\n                                                                                - - => Lancement de mainController > step2SaveOfBatch\n");
                            





























                            mainDao.step2SaveOfBatch(batchId, requestDuration, requestStatus, jsonFromNetwork, serviceProviderId, networkId, (callbackSaveBatch) => {
                                console.log(callbackSaveBatch);
                                let logStatus = callbackSaveBatch[0][0].status;
                                if (logStatus = 11){
                                    // << step3SaveOfMediaHistory >> déclenche automatiquement la procédure << sp_step4__save_of_media  >> sans passer par Node si tout est OK

                                    console.log("\n                                                                                - - => Lancement de mainController > step3SaveOfMediaHistory\n");
                                    
                                    mainDao.step3SaveOfMediaHistory(serviceProviderId, networkId, batchId, (callbackSaveOfMediaHistory) => {
                                        console.log("callbackSaveOfMediaHistory : ", callbackSaveOfMediaHistory)
                                        if (requestStatus < 0){
                                            emailer.sendEmail('A batch or media distribution issue has occured!');
                                        }
                                        else {
                                            res.status(200).json({ message : "'Batch' and 'media distribution' process completed." });
                                        }
                                    
                                    });
                                }

                            });

                        })
                    }); // *****************************************************************


                    

                    
                }



                // ////////////////////////////////////////////
                // ////////////  RESEAU SOCIAL /////////////////////
                // Emplacement pour un autre réseau social
                // ////////////////////////////////////////////
                
                
            }
              
        }
    );
    
}

exports.getCredentialByProviderAndNetwork = (req, res, next)=>{
    const providerId = req.params.providerid;
    const networkId = req.params.networkid;
    
    mainDao.getCredentialByProviderAndNetwork(providerId, networkId, (callbackContent) => {
            console.log(callbackContent);
            res.send(callbackContent);
        }
    );
    
}


exports.deleteAllBatchesAndMediaAndLog = (req, res, next)=>{

    mainDao.deleteAllBatchesAndMediaAndLog((callbackContent) => {
            console.log('callbackContent', callbackContent[0][0]);
            res.send(callbackContent[0][0]);
        }
    );
    
}

exports.showAllBatchesAndMediaAndLinkedMedia = (req, res, next)=>{
    
    mainDao.showAllBatchesAndMediaAndLinkedMedia((callbackContent) => {
        console.log('callbackContent', callbackContent[0][0]);
        res.send(callbackContent[0][0]);
        }
    );
    
}

exports.deleteAllAboutAdmin = (req, res, next)=>{
    
    mainDao.deleteAllAboutAdmin((callbackContent) => {
        if(typeof(callbackContent[0][0]) === 'undefined'){
            res.send('No admin in database')
        }
        else {
            console.log('callbackContent', callbackContent[0][0]);
            res.send(callbackContent[0][0]);
        }
    });    
}

exports.showAllAboutAdmin = (req, res, next)=>{
    
    mainDao.showAllAboutAdmin((callbackContent) => {
        if(typeof(callbackContent[0][0]) === 'undefined'){
            res.send('No admin in database')
        }
        else {
            console.log('callbackContent', callbackContent[0][0]);
            res.send(callbackContent[0][0]);
        }
        }
    );
    
}

exports.checkLogNotification = (req, res, next)=>{
    
    mainDao.checkLogNotification((callbackContent) => {
        console.log('callbackContent', callbackContent[0][0]);
        res.send(callbackContent[0][0]);
        }
    );
    
}





exports.getBatchByProviderAndNetwork = (req, res, next)=>{
    const providerId = req.params.providerid;
    const networkId = req.params.networkid;
    
    mainDao.getBatchByProviderAndNetworkStep1(providerId, networkId, (callbackContent) => {
            console.log(callbackContent);
            res.send(callbackContent);
        }
    );
    
}

exports.step1BeforeRequestToApiForBatch = (req, res, next)=>{
    const pageId = req.params.pageid;
    const pageToken = req.params.pagetoken;
    const providerId = req.params.providerid;
    const networkId = req.params.networkid;
    
    mainDao.step1BeforeRequestToApiForBatch(providerId, networkId, (callbackContent) => {
            console.log(callbackContent);
            res.send(callbackContent);
        }
    );
    
}

// Mise en relation des médias et des membres
exports.linkMediaAndMember = (req, res, nest)=>{    
    mainDao.linkMediaAndMember((callbackContent) => {
            console.log(callbackContent);
            res.send(callbackContent);
        }
    );
    
}



exports.facebookBatch = (req, res, next)=>{
    const pageId = req.params.pageid;
    const pageToken = req.params.pagetoken;
    const providerId = req.params.providerid;

    facebook.facebookBatch(pageId, pageToken, (callbackContent) => {

        const postQtity = callbackContent.length;
        callbackContent = JSON.stringify(callbackContent);
        callbackContent = callbackContent.replace(/[\n\r]|\s{2,}/g, ''); // supprime les sauts de lignes et les grands espaces.
        callbackContent = secureFunctions.escapeSpecialChars(callbackContent);

        // myFunctions.jsonClean(callbackContent);

        mainDao.insertBatch(callbackContent, postQtity, providerId, (callback2content) => {
            console.log(callback2content);
            res.send(callback2content);
        });


        //console.log(callbackContent);
        //res.send(callbackContent);
    })
    
}
