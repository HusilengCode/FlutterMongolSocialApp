const express = require("express");
const path = require("path");
const cors = require("cors");
const { MongoClient } = require("mongodb");

const app = express();


// Middleware
app.use(cors());
app.use(express.json());  // To parse JSON request bodies
app.use(express.static(path.join(__dirname, "public-flutter")));


const port = 3000; // Choose a suitable port number

// Replace the uri string with your connection string.
const uri = "";


// MongoDB Client
const client = new MongoClient(uri);

async function GetNews() {
  try {
    const database = client.db("NewsDatabase");
    const newsCollection = database.collection("NewsItems");

    const query = {};
    const options = {
      projection: { _id: 0, title: 1, description: 1, date: 1, author: 1, photo: 1 },
    };
    
    const newsCursor = newsCollection.find(query, options);
    const allDocuments = await newsCursor.toArray();
    
    console.log("Fetched News:", allDocuments);
    return allDocuments;
  } catch (err) {
    console.error("Error fetching news:", err);
    throw err;
  }
}

// MongoDB client
const AddNewsClient = new MongoClient(uri);
NewNews = []

// Route to add a new news item
app.post("/add-document", async (req, res) => {
  console.log("add news connected");
  console.log(req.body);
  const newDocument = req.body;
  try {
    const database = client.db("NewsDatabase");
    const newsCollection = database.collection("NewsItems");

    const result = await newsCollection.insertOne(newDocument);
    res.status(200).send({ message: "Document added successfully", result });
  } catch (error) {
    console.error("Error adding document:", error);
    res.status(500).send({ message: "Failed to add document", error });
  }
});



app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "public-flutter/index.html"));
});


// Route to fetch featured news
app.get("/api/featuredNews", async (req, res) => {
  try {
    const newsData = await GetNews();  // Wait for the news to be fetched
    res.json(newsData);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch news", error });
  }
});


// Start the server and connect to MongoDB
app.listen(port, async () => {
  try {
    await client.connect();  // Establish a connection to MongoDB
    GetNews();
    console.log(`Server is running on port ${port}`);
  } catch (err) {
    console.error("Failed to connect to MongoDB:", err);
  }
});

// Graceful shutdown
process.on("SIGINT", async () => {
  console.log("Closing MongoDB connection...");
  await client.close();
  process.exit();
});
