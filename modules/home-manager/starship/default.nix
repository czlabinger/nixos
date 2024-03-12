{pkgs, ...}: {
  programs.starship = {
    enable = true;
    settings = {
      #add_newline = false;

      character = {
        success_symbol = "[• ](bold fg:blue) ";
        error_symbol = "[• 󰅙](bold fg:red) ";
      };

      format = ''
        $cmd_duration$directory $rust$git_branch$git_status$package$golang$terraform$docker_context$python$docker_context$nodejs
        $character
      '';

      package.disabled = true;

      elixir = {
        symbol = " ";
      };

      elm = {
        symbol = " ";
      };

      git_branch = {
        style = "bg: green";
        format = " on [$symbol$branch(:$remote_branch)]($style) ";
        symbol = " ";
      };

      git_commit = {
        commit_hash_length = 4;
        tag_symbol = " ";
      };

      git_state = {
        format = "[\($state( $progress_current of $progress_total)\)]($style) ";
        cherry_pick = "[🍒 PICKING](bold red)";
      };

      git_status = {
        conflicted = " 🏳 ";
        ahead = " 🏎💨 ";
        behind = " 😰 ";
        diverged = " 😵 ";
        untracked = " 🤷 ‍";
        stashed = " 📦 ";
        modified = " 📝 ";
        staged = "[++\($count\)](blue)";
        renamed = " ✍️ ";
        deleted = " 🗑 ";
      };

      golang = {
        symbol = " ";
      };

      hg_branch = {
        symbol = " ";
      };

      java = {
        symbol = " ";
      };

      julia = {
        symbol = " ";
      };

      memory_usage = {
        symbol = " ";
      };

      nim = {
        symbol = " ";
      };

      nix_shell = {
        symbol = " ";
      };

      perl = {
        symbol = " ";
      };

      php = {
        symbol = " ";
      };

      python = {
        symbol = " ";
        format = " via [$symbol python ($version )(\($virtualenv\) )]($style)";
        style = "bold yellow";
        pyenv_prefix = "venv ";
        python_binary = ["./venv/bin/python" "python" "python3" "python2"];
        detect_extensions = ["py"];
        version_format = "v$raw";
      };

      ruby = {
        symbol = " ";
      };

      rust = {
        style = "bold fg:#FF5F15";
        format = " [$symbol($version )]($style)";
        symbol = " ";
      };

      scala = {
        symbol = " ";
      };

      shlvl = {
        symbol = " ";
      };

      swift = {
        symbol = "ﯣ ";
      };

      nodejs = {
        format = " via [ Node.js $version](bold green) ";
        detect_files = ["package.json" ".node-version"];
        detect_folders = ["node_modules"];
      };

      hostname = {
        ssh_only = false;
        format = "[•$hostname](bg:cyan bold fg:black)[](bold fg:cyan )";
        trim_at = ".companyname.com";
        disabled = false;
      };

      line_break = {
        disabled = false;
      };

      time = {
        disabled = true;
        format = "🕙[\[ $time \]]($style) ";
        time_format = "%T";
      };

      username = {
        style_user = "bold bg:cyan fg:black";
        style_root = "red bold";
        format = "[](bold fg:cyan)[$user]($style)";
        disabled = false;
        show_always = true;
      };

      directory = {
        home_symbol = "  ";
        read_only = "  ";
        style = "bg:blue fg:black";
        truncation_length = 25;
        truncation_symbol = "••/";
        format = "[](bold fg:blue)[$path ]($style)[](bold fg:blue)";
        substitutions = {
          "Desktop" = "  ";
          "Documents" = "  ";
          "Downloads" = "  ";
          "Music" = " 󰎈 ";
          "Pictures" = "  ";
          "Videos" = "  ";
        };
      };

      cmd_duration = {
        min_time = 0;
        format = "[](bold fg:yellow)[ $duration](bold bg:yellow fg:black)[](bold fg:yellow) •• ";
      };
    };
  };
}
