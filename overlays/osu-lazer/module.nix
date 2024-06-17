final: prev: {
  osu-lazer = prev.osu-lazer.overrideAttrs (old: rec {
    version = "2021.927.1";

    src = prev.fetchFromGitHub {
      owner = "ppy";
      repo = "osu";
      rev = version;
      sha256 = "sha256-+RsvOd1BXBGoeNEyRt90aYicPBspe/Ki0XWw/Cbghoo=";
    };

    nugetDeps = linkFarmFromDrvs "${pname}-nuget-deps" (import ./deps.nix {
      fetchNuGet = { name, version, sha256 }: fetchurl {
        name = "nuget-${name}-${version}.nupkg";
        url = "https://www.nuget.org/api/v2/package/${name}/${version}";
        inherit sha256;
      };
    });
  });
}
