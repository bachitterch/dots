local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end


nvim_treesitter.setup {

  ensure_installed = {
    "bash",
    "dockerfile",
    "lua",
    "go",
    "graphql",
    "prisma",
    "python",
    "tsx",
    "toml",
    "typescript",
    "json",
    "yaml",
    "swift",
    "html",
    "scss"
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
}
