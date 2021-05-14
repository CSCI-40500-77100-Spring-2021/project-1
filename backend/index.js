require('dotenv').config();

import express from 'express';
import mongoose from 'mongoose';
import bodyparser from 'body-parser';
import cors from 'cors';
import routes from './routes/devourRoutes';
//import { UserSchema } from '../models/userModel';

const UserSchema = require('./models/userModel');

const app = express();
const PORT = 4000;

const jwt = require('jsonwebtoken');
app.use(express.json());

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

// using post route to get user from token  
app.get('/posts', authenticateToken, (req, res) => {
  res.json(posts.filter(post => post.username === req.user.name))
})

// login 
app.post('/login', async (req, res) => { // create token
	//authentication 

	//console.log(req.body.email);
	const {email, password} = req.body;
	const UserCk = await UserSchema.findOne({ email: email }).exec();
	console.log(UserCk);

// not in DB = NULL
// in DB = body 
	if (!UserCk) {
		return res.status(400).json({msg: "User does not exist!!"});
	}

	// JWT
	const username = req.body.username
	const user = {name: username}

	const accessToken = jwt.sign(user, process.env.ACCESS_TOKEN_SECRET)
	res.json({ accessToken : accessToken })
});


function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization']
  const token = authHeader && authHeader.split(' ')[1]
  if (token == null) return res.sendStatus(401)
  	// valid token
  jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
    console.log(err)
    if (err) return res.sendStatus(403) // have invalid token 
    req.user = user
    next()
  })
};


app.listen(PORT, () => 
	console.log(`Your Devour server is running on port ${PORT}`)
);

