/**
 * @see https://prettier.io/docs/configuration
 * @type {import("prettier").Config}
 */
const config = {
    tabWidth: 4,
    semi: false,
    singleQuote: true,
    plugins: ['prettier-plugin-sh'],
    overrides: [
        {
            files: ['*.{yml,yaml}'],
            options: {
                tabWidth: 2,
            },
        },
        {
            files: ['Dockerfile'],
            parser: 'dockerfile',
        },
    ],
}

module.exports = config
