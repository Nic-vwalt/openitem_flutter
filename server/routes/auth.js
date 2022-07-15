const express = require("express");
const User = require("../models/user.js");
const auth = require("../middleware/auth.js");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password, phone } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }

    const hashedsPassword = await bcryptjs.hash(password, 8);

    //200
    let user = new User({
      email,
      password: hashedsPassword,
      name,
      phone,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const existingUser = await User.findOne({ email });
    if (!existingUser) {
      return res.status(400).json({ msg: "No User with that email found!" });
    }
    const isMatch = await bcryptjs.compare(password, existingUser.password);

    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect Password!" });
    }
    const token = jwt.sign({ id: existingUser._id }, "passwordKey");
    res.json({ token, ...existingUser._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) {
      return res.json(false);
    }
    const verified = jwt.verify(token, "passwordKey");
    const user = await User.findById(verified.id);
    if (!user) {
      return res.json(false);
    }
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.get("/", auth, async (req, res) => {
  try {
    const user = await User.findById(req.user);
    res.json(...user._doc, req.token);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
