require("nvim-lsp-installer").setup {
  ensure_installed = {"lua"},
  automatic_installation = true,

  github = {
    -- The template URL to use when downloading assets from GitHub.
    -- The placeholders are the following (in order):
    -- 1. The repository (e.g. "rust-lang/rust-analyzer")
    -- 2. The release version (e.g. "v0.3.0")
    -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
    -- download_url_template = "http://hub.nuaa.cf/%s/releases/download/%s/%s",
  },
}

