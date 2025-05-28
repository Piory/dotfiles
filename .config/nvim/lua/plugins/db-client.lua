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
          require('dbee.sources').MemorySource:new({
            {
              id = 'R4b',
              name = 'R4b',
              type = 'mysql',
              url = 'root:@tcp(127.0.0.1:3306)/alpha',
            },
          }),
        },
      })
    end,
    keys = {
      {
        '<C-o>d',
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
