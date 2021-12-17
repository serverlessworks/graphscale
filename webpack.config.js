const glob = require("glob");
const path = require("path");
const CopyPlugin = require("copy-webpack-plugin");

const config = {
  mode: "production",
  target: "node",
  devtool: "source-map",
  externals: ["aws-sdk"],
  module: {
    rules: [
      {
        test: /\.ts$/,
        use: "ts-loader",
        exclude: /node_modules/,
      },
    ],
  },
  entry: glob.sync("./lambda.ts").reduce((acc, pathEntry) => {
    const entry = "lambda";
    acc[entry] = pathEntry;
    return acc;
  }, {}),
  output: {
    filename: "[name]/index.js",
    path: path.resolve(__dirname, "./dist"),
    library: { type: "commonjs2" },
  },
  resolve: {
    modules: ["node_modules"],
    extensions: [".ts", ".js", ".json"],
    alias: {
      src: path.resolve(__dirname, "./src/"),
    },
  },
  plugins: [
    new CopyPlugin({
      patterns: [{ from: "./src/schemas", to: "./lambda/schemas" }],
    }),
  ],
  externals: [
    "@graphql-tools/load-files",
    "@graphql-tools/merge",
    "apollo-server-lambda",
    "aws-sdk",
    "graphql",
  ],
};

module.exports = config;
