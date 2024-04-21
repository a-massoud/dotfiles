-- jdtls
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local config = {
    cmd = { '/usr/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'pom.xml' }, { upward = true })[1]),
    settings = {
        java = {
            signatureHelp = { enabled = true },
            format = {
                settings = {
                    url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml"
                }
            },
            configuration = {
                runtimes = {
                    {
                        name = 'JavaSE-1.8',
                        path = '/usr/lib/jvm/java-8-openjdk/',
                        javadoc = 'https://docs.oracle.com/en/java/javase/8/docs/api'
                    },
                    {
                        name = 'JavaSE-11',
                        path = '/usr/lib/jvm/java-11-openjdk/',
                        javadoc = 'https://docs.oracle.com/en/java/javase/11/docs/api'
                    },
                    {
                        name = 'JavaSE-17',
                        path = '/usr/lib/jvm/java-17-openjdk/',
                        javadoc = 'https://docs.oracle.com/en/java/javase/17/docs/api',
                        default = true
                    },
                }
            }
        },
        capabilities = capabilities
    },
}
config['init_options'] = {
    bundles = {
        vim.fn.glob("/usr/share/java-debug/com.microsoft.java.debug.plugin.jar", 1)
    },
}
require('jdtls').start_or_attach(config)

vim.api.nvim_set_keymap(
    'n',
    '<A-o>',
    '<cmd>lua require\'jdtls\'.organize_imports()<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    'crv',
    '<cmd>lua require(\'jdtls\').extract_variable()<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'v',
    'crv',
    '<esc><cmd>lua require(\'jdtls\').extract_variable(true)<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    'crc',
    '<cmd>lua require(\'jdtls\').extract_constant()<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'v',
    'crc',
    '<esc><cmd>lua require(\'jdtls\').extract_constant(true)<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'v',
    'crm',
    '<esc><cmd>lua require(\'jdtls\').extract_method(true)<cr>',
    { noremap = true }
)

vim.api.nvim_set_keymap(
    'n',
    '<leader>djf',
    '<cmd>lua require\'jdtls\'.test_class()<cr>',
    { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>djm',
    '<cmd>lua require\'jdtls\'.test_nearest_method()<cr>',
    { noremap = true }
)
