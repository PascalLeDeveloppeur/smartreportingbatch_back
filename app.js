const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const app = express();

const mainRouter = require('./routes/mainRoute');


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use((req, res, next) => {
  console.log("Origine : ", req.headers.origin);
  next();
})

// CORS policies
app.use((req, res, next) => {
  
  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,PUT,DELETE');
  let origin = req.headers.origin;
  let ok = (origin === "http://localhost:4200") ? true : false;

  origin = "*"; ok = true; // ouvrir ou fermer à tout le monde
  
  if (ok) { //les requetes viennent de mon application
    res.setHeader('Access-Control-Allow-Origin', origin);
    res.setHeader("Access-Control-Allow-Headers", "*" );
    res.setHeader('Access-Control-Allow-Credentials', true);
    // res.setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept" );
    // res.setHeader('Access-Control-Allow-Origin', passePartout);
      next();
  }
  
  else { // accès refusé
      res.status(403).send("vous n'avez pas le droit d'acces a cette ressource");
  }
  
});




app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true })); // Pour récupérer le body d'une requête, extended doit être sur true
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use('/', mainRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500).json({Erreur: "Une erreur inatendu est survenue"});
  res.send('error');
});

module.exports = app;
