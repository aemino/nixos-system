final: prev: with prev; {
  # keep sources this first
  sources = prev.callPackage (import ./_sources/generated.nix) { };

  # then, call packages with `final.callPackage`
  memento = prev.libsForQt5.callPackage ./applications/video/memento { };
}
