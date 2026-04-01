# The file here is really only used to make the import smaller
# And to make it so that the main config is scoped inside nixvim
{ inputs, rolling, ... }:

{
  imports = [ inputs.nixvim.homeModules.nixvim ];
  programs.nixvim = {
    _module.args.inputs = inputs;
    _module.args.rolling = rolling;
    imports = [ ./init.nix ];
  };
}
