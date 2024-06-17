(
  final: prev:
  let
    inherit (prev) callPackage;
  in
  {
    mecab =
      let
          mecab-nodic = callPackage ./nodic.nix { };
      in
      prev.mecab.override {
          mecab-ipadic = callPackage ./ipadic.nix {
              inherit mecab-nodic;
          };
      };
  }
)
