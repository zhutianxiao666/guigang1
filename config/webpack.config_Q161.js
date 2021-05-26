const path = require('path');


const {CleanWebpackPlugin} = require('clean-webpack-plugin');

module.exports = {
    entry: path.resolve(__dirname,'../src/modules/demoQ161.modules'),
    output: {
        path: path.resolve(__dirname,'../dist'),
        filename: "Q161.modules"
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
                }
            }
        ]
    },
    mode: "production",
    resolve: {
        extensions: ['.js']
    },
    devtool: 'eval-source-map',
    devServer: {
        open: true,
        quiet: true
    },
    plugins: [
        new CleanWebpackPlugin(),
        // html
    ]
}