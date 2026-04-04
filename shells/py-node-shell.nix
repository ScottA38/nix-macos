# hugo-node-shell.nix
{ pkgs }:
import ./compose.nix {
  inherit pkgs;
  modules = [ ./node-deps.nix ./python-deps.nix ];
} // {
  name = "pynode-dev";
  description = "Python + Node.js development environment";
}