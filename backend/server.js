const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

const events = [
{
id: 1,
title: "Hackathon 2026",
date: "2026-11-15",
description: "Build innovative projects."
},
{
id: 2,
title: "Web Development Workshop",
date: "2026-11-20",
description: "Learn web development."
}
];

app.get("/api/events", (req, res) => {
res.json(events);
});

app.get("/", (req, res) => {
res.send("CampusConnect API is running");
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
console.log(Server running on port ${PORT});
});
