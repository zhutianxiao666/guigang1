const path = require('path');
const htmlWebpackPlugin = require('html-webpack-plugin');

const html = new htmlWebpackPlugin({
    template: path.resolve(__dirname,'../','src','projects','gantetu','gantetu.html'),
    minify: true
});
const {CleanWebpackPlugin} = require('clean-webpack-plugin');

module.exports = {
    entry: path.resolve(__dirname,'../src/projects/gantetu/modules/index.modules'),
    output: {
        path: path.resolve(__dirname,'../dist'),
        filename: "modules/index.modules"
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
            },
            {
                test: /\.styl/,
                use:[
                    'style-loader',
                    'css-loader',
                    'stylus-loader'
                ]
            }
        ]
    },
    mode: "development",
    resolve: {
        extensions: ['.js'],
        alias: {
            '@':path.resolve(__dirname,'../','src')
        }
    },
    devtool: 'cheap-module-eval-source-map',
    devServer: {
        open: true,
        quiet: true,
    },
    plugins: [
        // html,
        new CleanWebpackPlugin(),
        html
    ]
}





