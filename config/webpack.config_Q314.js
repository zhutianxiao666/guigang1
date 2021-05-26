const path = require('path');


const {CleanWebpackPlugin} = require('clean-webpack-plugin');

module.exports = {
    entry: path.resolve(__dirname,'../src/modules/demoQ314.modules'),
    output: {
        path: path.resolve(__dirname,'../dist'),
        filename: "Q314.modules"
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
                use: [
                    'style-loader',
                    'css-loader'
                ]
            }
        ]
    },
    mode: "production",
    resolve: {
        extensions: ['.js','.json'],
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
        new CleanWebpackPlugin(),
        // html
    ]
}