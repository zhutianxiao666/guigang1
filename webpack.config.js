const path = require('path');
const htmlwebpack = require('html-webpack-plugin');
const html = new htmlwebpack({
    template: path.resolve(__dirname,'src','html','test.html'),
    minify: true
});
const {CleanWebpackPlugin} = require('clean-webpack-plugin');

module.exports = {
    entry: path.resolve(__dirname,'src/modules/gantetu/index.modules'),
    output: {
        path: path.resolve(__dirname,'dist'),
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
            }
        ]
    },
    mode: "production",
    resolve: {
        extensions: ['.js'],
        alias: {
            "@":path.resolve(__dirname,'src')
        }
    },
    devtool: 'eval-source-map',
    devServer: {
        open: true,
        quiet: true
    },
    plugins: [
        html,
        new CleanWebpackPlugin()
    ]
}