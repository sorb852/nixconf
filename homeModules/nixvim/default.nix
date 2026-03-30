# The file here is really only used to make the import smaller
# And to make it so that the main config is scoped inside nixvim
{ inputs, ... }:

{
  imports = [ inputs.nixvim.homeModules.nixvim ];
  programs.nixvim.imports = [ ./init.nix ];
}
