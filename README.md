# nvim-config

Portable nvf (Neovim) build, exposed as `packages.<system>.default`.

    nix run .#                          # run from a checkout
    nix run github:<you>/nvim-config    # run anywhere
    nix build .#                        # produces ./result/bin/nvim

Consumed by the NixOS flake as the input `nvim`.
