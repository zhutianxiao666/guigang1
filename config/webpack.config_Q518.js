const path = require('path');


const {CleanWebpackPlugin} = require('clean-webpack-plugin');

module.exports = {
    entry: path.resolve(__dirname,'../src/js/demoQ518.js'),
    output: {
        path: path.resolve(__dirname,'../dist'),
        filename: "Q518.js"
    },
    module: {
        rules: [
            {
                test: /\.js/,
                exclude: /node_modules/,
                use: {
                    loader: "babel-loader",
                    options: {
                        presets: ["@babel/preset-env"]
                    }
                },
            }
        ]
    },
    mode: "production",
    resolve: {
        extensions: ['.js'],
        alias: {
            '@':path.resolve(__dirname,'../','src')
        }
    },
    devtool: 'eval-source-map',
    devServer: {
        open: true,
        quiet: true
    },
    plugins: [
        // html,
        new CleanWebpackPlugin(),
        // html
    ]
}