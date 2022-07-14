console.log("Hello, world");
const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth.js");
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://nicolas:admin@main-cluster.irpyx.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);

//connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("DB Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log("connected at port " + PORT);
});
