/* Par sécurité, j'installe le module dotenv pour charger des variables 
d'environnement. Elles se trouvent dans le fichier .env
Ici, ce fichier recense les données sensibles qui ne doivent pas être divulguées.
Il s'agit dans ce cas des données de connexion au compte gmail qui envoie les emails.

Le fichier .env doit être stipulé dans .gitignore
afin de ne jamais le transférer sur git */
require('dotenv').config();
const nodemailer = require('nodemailer');



// Définition du transporteur (gmail)
let transporter = nodemailer.createTransport({
    /* Pour autoriser l'utilisation du compte gmail comme transporteur 
    depuis un serveur, il faut aller à cette adresse : 
    https://myaccount.google.com/lesssecureapps
    et activer le bouton <<Autoriser les applications moins sécurisées>> */
    service: 'gmail', 
    auth: {
        user: process.env.EMAIL, // Fait appel à la variable EMAIL du fichier .env
        pass: process.env.PASSWORD
    }
});



// Envoie de l'email
exports.sendEmail = (emailMessage) => {


    // Définition des options (le contenu de l'email)
    let mailOptions = {
        from: 'pmaitreltest@gmail.com',
        to: 'tamarincity@gmail.com',
        subject: 'SmartReportingBatch',
        html:`<h2>Message from Smart Reporting Batch</h2><p>Hello,</p><p>${emailMessage}</p><p>This message was sent to you automatically.</p>`
    };

    // envoie de l'email
    transporter.sendMail(mailOptions, (err, data) => {
        if (err){
            console.log('An issue has occured! err:1', err);
        }
        else{
            console.log('Email sent! Message : ',emailMessage);
        }
    });
}
