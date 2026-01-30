return {
  {
    'kndndrj/nvim-dbee',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    build = function()
      require('dbee').install('go')
    end,
    config = function()
      require('dbee').setup({
        sources = {
          require('dbee.sources').EnvSource:new('DBEE_CONNECTIONS'),
        },
      })
    end,
    keys = {
      {
        '<leader>od',
        function()
          local dbee = require('dbee')
          if dbee.is_open() then
            dbee.close()
          else
            dbee.open()
          end
        end,
      },
    },
  },
}
