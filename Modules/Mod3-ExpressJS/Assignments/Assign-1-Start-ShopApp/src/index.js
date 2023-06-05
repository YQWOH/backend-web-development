import express from "express";
import healthRouter from "./routes/heath.route.js"
import productRouter from "./routes/product.route.js";
import userRouter from "./routes/user.route.js";

const app = express();

const PORT = 8000;

app.use("", healthRouter);
app.use("/product", productRouter);
app.use("/user", userRouter);

app.listen(PORT, () => {
    console.log("Shop-app-clone is running at port", PORT);
})