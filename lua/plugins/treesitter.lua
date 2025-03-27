-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
      "c",
      "cpp",
      "cuda",
      "cmake",
      "gitcommit",
      "git_rebase",
      "latex",
      "make",
      "json",
      "llvm",
      "lua",
      "python",
      "rust",
      "typescript",
      "vimdoc",
    },
  },
}
