{
  pkgs ? import <nixpkgs> { },
  cc ? pkgs.stdenv.cc,
  ...
}:
pkgs.mkShell {
  packages = [
    pkgs.patchelf
  ];
  shellHook = ''
    export _NIX_INTERPRETER=$(cat ${cc}/nix-support/dynamic-linker)
    export _NIX_RPATH=${cc.cc.lib}/lib
    export _NIX_LIBZ_RPATH=${pkgs.libz}/lib
    echo _NIX_INTERPRETER=$_NIX_INTERPRETER
    echo _NIX_RPATH=$_NIX_RPATH
    echo _NIX_LIBZ_RPATH=$_NIX_LIBZ_RPATH
    # patchelf --set-interpreter "$_NIX_INTERPRETER" --set-rpath "$_NIX_RPATH:$_NIX_LIBZ_RPATH" $_TO_PATCH
  '';
}
