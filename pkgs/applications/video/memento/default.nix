{ lib
, stdenv
, fetchFromGitHub
, cmake
, wrapQtAppsHook, qtbase, qtsvg, qtx11extras
, mpv
, sqlite
, mecab
, json_c
, libzip
}:

with lib;

stdenv.mkDerivation rec {
  pname = "memento";
  version = "0.5.6-beta";

  src = fetchFromGitHub {
    owner = "ripose-jp";
    repo = "Memento";
    rev = "v${version}";
    sha256 = "fD7JW8mTOJGPctr4Vqewy88OyYufv4RDjGlL3itrjHw=";
  };

  nativeBuildInputs = [
    cmake
    wrapQtAppsHook
  ];

  buildInputs = [
    qtbase qtsvg qtx11extras
    mpv
    sqlite
    mecab
    json_c
    libzip
    # todo: (opt) ytdl?
  ];

  meta = with lib; {
    homepage = "https://ripose-jp.github.io/Memento/";
    description = "A FOSS, mpv-based video player for studying Japanese";
    longDescription = ''
      Memento is a free and open source, mpv-based video player that makes
      studying Japanese easier with a built in popup dictionary, Anki
      integration, and more.
    '';
    license = licenses.gpl2;
    platforms = platforms.darwin ++ platforms.linux;

    broken = versionOlder qtbase.version "5.15.0";
  };
}
