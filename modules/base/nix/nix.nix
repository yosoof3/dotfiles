{ inputs, ... }: {
  nix = {
    # https://nixos.org/manual/nix/stable/command-ref/conf-file.html
    settings = {
      # How to update this array later: Go to https://nixos.org/manual/nix/stable/contributing/experimental-features#currently-available-experimental-features
      # and run `copy(JSON.stringify($$("#currently-available-experimental-features ~ h2").map(h2 => h2.textContent), null, 2).replaceAll(",", ""))`
      experimental-features = [ "flakes" "nix-command" ];
      use-xdg-base-directories = false;
      auto-optimise-store = true;
      log-lines = 10000000;
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=flake:nixpkgs" ];
  };
}