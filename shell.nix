{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  packages = with pkgs; [
    alejandra
    deadnix
    git
    nil
  ];

  name = "ღვინო";
  meta.description = "The default development shell for this flake";

  shellHook = '' 
    clear
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
