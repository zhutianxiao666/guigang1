const path = require('path');


const {CleanWebpackPlugin} = require('clean-webpack-plugin');

module.exports = {
    entry: path.resolve(__dirname,'../src/modules/demoMingXi.modules'),
    output: {
        path: path.resolve(__dirname,'../dist'),
        filename: "MingXi.modules"
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
            },
            {
                test: /\.css/,
                use: ['style-loader','css-loader']
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
    devtool: 'cheap-module-source-map',
    devServer: {
        open: true,
        quiet: true
    },
    plugins: [
        new CleanWebpackPlugin(),
        // html
    ]
}