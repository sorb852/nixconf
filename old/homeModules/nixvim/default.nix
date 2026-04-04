{ inputs, ... }:

{
  imports = [ inputs.nixvim.homeModules.nixvim ];
  programs.nixvim = {
    _module.args.inputs = inputs;
    imports = [ ./conf ];
  };
}
