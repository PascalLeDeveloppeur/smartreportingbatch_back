var express = require('express');
var router = express.Router();

const mainController = require('../controllers/mainController');
const adminController = require('../controllers/admincontroller');




/* GET home page. */
router.get('/', mainController.index);

// Enregistrement de l'administrateur
router.post('/auth/register', adminController.register);

// Connexion de l'administrateur
router.post('/auth/login/', adminController.login);




/*  Récupération automatique du batch depuis les réseaux sociaux et
    répartition des données dans l'historique et la table des médias */
router.get('/batch/mainstartforautomation/:nbrPosts', mainController.mainStartForAutomation); 

// Mise en relation des médias et des membres automatiquement
router.get('/batch/linkmediaandmember', mainController.linkMediaAndMember);

// Purge de tous les batchs, médias et log
router.get('/batch/deleteallbatchesandmediaandlog', mainController.deleteAllBatchesAndMediaAndLog);

// Affichage des batchs et médias
router.get('/batch/showallbatchesandmediaandlinkedmedia', mainController.showAllBatchesAndMediaAndLinkedMedia);

// Supprime tout ce qui concerne les admins
router.get('/batch/deleteallaboutadmin', mainController.deleteAllAboutAdmin);

// Affiche tout ce qui concerne les admins
router.get('/batch/showallaboutadmin', mainController.showAllAboutAdmin);

// Vérifie s'il y a des notification du log
router.get('/batch/checklognotification', mainController.checkLogNotification);






router.get('/srb/getbatchbyproviderandnetwork/:providerid/:networkid', mainController.getBatchByProviderAndNetwork);
router.get('/srb/providersandnetworks', mainController.listNetworkAndProvider);
router.get('/srb/getcredentialbyproviderandnetwork/:providerid/:networkid', mainController.getCredentialByProviderAndNetwork);
router.get('/srb/batchstep1/:network/:pageid/:pagetoken/:providerid/:networkid', mainController.step1BeforeRequestToApiForBatch);

router.get('/srb/api/facebook/:pageid/:pagetoken/:providerid', mainController.facebookBatch);


module.exports = router;
