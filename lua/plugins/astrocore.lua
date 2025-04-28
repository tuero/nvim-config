-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        -- Tab spaces
        tabstop = 4,
        softtabstop = 4,
        shiftwidth = 4,
        expandtab = true, -- convert tab to spaces
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        vimtex_quickfix_ignore_filters = {
          "Overfull",
          "Redefining Unicode character",
          "Underfull",
          "Warning",
          "Token not allowed in a PDF string (Unicode)",
        },
        vimtex_compiler_latexmk = {
          options = {
            "-shell-escape",
            "-verbose",
            "-file-line-error",
            "-interaction=nonstopmode",
            "-synctex=1",
          },
        },
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },

        ["<M-o>"] = {
          function()
            if vim.bo.filetype == "cpp" or vim.bo.filetype == "cxx" or vim.bo.filetype == "c" then
              vim.cmd "ClangdSwitchSourceHeader"
            end
          end,
          desc = "Switch source header",
        },
        ["<Leader>pf"] = { ":r ~/.vbuf<CR>", desc = "paste from file" },
        ["<Leader>uT"] = {
          function()
            if vim.api.nvim_get_var "colors_name" == "onedark" then
              vim.api.nvim_command "colorscheme default"
              vim.api.nvim_command "set background=light"
              vim.api.nvim_command "colorscheme zenbones"
            else
              vim.api.nvim_command "colorscheme default"
              vim.api.nvim_command "set background=dark"
              vim.api.nvim_command "colorscheme onedark"
            end
          end,
          desc = "Toggle Theme",
        },
      },
      v = {
        ["<Leader>cf"] = { ":w! ~/.vbuf<CR>", desc = "copy to file" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
