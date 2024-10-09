{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.stoffi05 = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
      };
      userChrome = ''
        .urlbar-input-box { text-align: center; }

        * {
          font-family: "monospace";
        }

        .browserContainer browser {
          border-radius: 5px !important;
          /* margin: 0vh 1vh 2vh 0vh; */
        }

        #navigator-toolbox {
          max-height: 100vh;
    
          & * {
            opacity: 1;
          }
        }


        @-moz-document url-prefix(about:newtab) {
          
        }

      '';
      #bookmarks = [];
      search.engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
                {
                  name = "channel";
                  value = "unstable";
                }
              ];
            }
          ];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@np"];
        };
      };
      search.force = true;

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        darkreader
        i-dont-care-about-cookies
        new-tab-override
      ];
    };
  };
}
