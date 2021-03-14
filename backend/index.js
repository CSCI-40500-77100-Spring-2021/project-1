import express from 'express';
import mongoose from 'mongoose';
import bodyparser from 'body-parser';
import cors from 'cors';
import routes from './routes/devourRoutes'

const app = express();
const PORT = 4000;

// Mongoose connection
mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost/devourDB', { // enter URL here for cloud db
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