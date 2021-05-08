import express from 'express';
import mongoose from 'mongoose';
import bodyparser from 'body-parser';
import cors from 'cors';
import routes from './routes/devourRoutes';


const app = express();
const PORT = 4000;


// MongoDB Driver Code
const MongoClient = require('mongodb').MongoClient;
const uri = 'mongodb+srv://John:john123@devour.lqgmu.mongodb.net/Devour?retryWrites=true&w=majority';
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });
client.connect(err => {
  const collection = client.db("Devour").collection("users");
  // perform actions on the collection object
  console.log("Connected to MongoCloud");
  client.close();
});


// Mongoose connection
mongoose.Promise = global.Promise;
mongoose.connect(uri, { // enter URL here for cloud db
	useNewUrlParser: true, 
	useUnifiedTopology: true
}); 


// body parser setup
app.use(bodyparser.urlencoded({ extended: true }));
app.use(bodyparser.json());

// CORS setup
app.use(cors());

routes(app); // telling app we have the routes available from out routes folder

app.get('/', (req, res) => // request db
	res.send(`Our Devour App is running on port ${PORT}`) //send response 
);

app.listen(PORT, () => 
	console.log(`Your Devour server is running on port ${PORT}`)
);