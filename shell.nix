let pinned-nixpkgs = builtins.fetchGit
    {
        url = "https://github.com/nixos/nixpkgs";
        ref = "master";
        rev = "53fcb502fe62d6a27ff07333443198d3533d67e9";
    };
in with import pinned-nixpkgs {};
runCommand "deepseq-instances-env"
{
    buildInputs =
        let thisghc = haskell.packages.ghc884.ghcWithPackages
            (p: [ p.cabal-install
                  p.ghcid
                ]);
        in [ thisghc
             binutils
           ];
} ""
