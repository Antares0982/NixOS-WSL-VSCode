{
  pkgs ? import <nixpkgs> { },
  stdenv ? pkgs.stdenv,
  cc ? stdenv.cc,
  patchelf ? pkgs.patchelf,
  binutils ? pkgs.binutils,
  ...
}:
pkgs.mkShell {
  packages = [
    patchelf
  ];
  shellHook = ''
    export _NIX_INTERPRETER=$(cat ${cc}/nix-support/dynamic-linker)
    export _NIX_RPATH=${cc.cc.lib}/lib
    echo _NIX_INTERPRETER=$_NIX_INTERPRETER
    echo _NIX_RPATH=$_NIX_RPATH
    # patchelf --set-interpreter "$_NIX_INTERPRETER" --set-rpath "$_NIX_RPATH" $_TO_PATCH
  '';
}
