{
  imports = [
    ./loader # which system loader are we using

    ./generic.nix # generic boot configuration
    ./plymouth.nix # plymouth a nicer boot screen
  ];
}
