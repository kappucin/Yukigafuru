{


    programs.nushell = {
      enable = true;
    };

    programs.carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    programs.starship = {
       enable = true;
       settings = {
         add_newline = true;
         character = {
           success_symbol = "[╰─λ](bold orange)";
           error_symbol = "[╰─](bold orange)";
         };
       };
    };


}
