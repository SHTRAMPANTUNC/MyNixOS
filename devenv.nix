{ pkgs ? import <nixpkgs> { } }: 
  pkgs.mkShell
{
  packages = with pkgs; [
    alejandra
    deadnix
    nil
  ];

  name = "ღვინო";
  meta.description = "The default development shell for this flake";

  shellHook = '' 
    clear
    ${config.pre-commit.installationScript}
    echo "
          ::::::::::       :::            :::        :::    :::       :::::::::: 
         :+:              :+:          :+: :+:      :+:   :+:        :+:         
        +:+              +:+         +:+   +:+     +:+  +:+         +:+          
       :#::+::#         +#+        +#++:++#++:    +#++:++          +#++:++#      
      +#+              +#+        +#+     +#+    +#+  +#+         +#+            
     #+#              #+#        #+#     #+#    #+#   #+#        #+#             
    ###              ########## ###     ###    ###    ###       ##########       
  "  
  '';
  formatter = pkgs.alejandra;
}
