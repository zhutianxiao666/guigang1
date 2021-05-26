const {resolve} = require('path');
const {CleanWebpackPlugin} = require('clean-webpack-plugin')

module.exports = {
    entry: resolve(__dirname,'../src/js/Q101/Main.js'),
    output: {
        path: resolve(__dirname,'../','dist'),
        filename: "Q101.js"
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                    loader: "babel-loader",
                    options: {
                        // 如果用到class 则需要赋值一下内容
                        presets: [
                            [
                                '@babel/preset-env',
                                // "@babel/preset-react",
                                {
                                    useBuiltIns:"usage",
                                    corejs : {version:3},
                                    targets: { // 兼容的浏览器
                                        "chrome" :"58",
                                        "ie" :"9"
                                    }
                                }
                            ]
                        ],
                        plugins: [
                            "@babel/plugin-proposal-class-properties",
                        ],
                        cacheDirectory:true
                    }
                }
            }
        ]
    },
    mode: "production",
    resolve: {
        extensions: ['.js'],
        alias: {
            "@":resolve(__dirname,'../','src')
        }
    },
    // 映射
    devtool: 'eval-source-map',
    devServer: {
        open: true,
        quiet: true
    },
    plugins: [
        new CleanWebpackPlugin()
    ]
}