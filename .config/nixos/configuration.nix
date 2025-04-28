{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
  	minetest
  	alacritty
  	emacs-pgtk

  	helix
  	tmux
  	distrobox

  	vim
  	wget
  	git
  	stow
  	lf
  	htop

    hyprland
    xwayland
    swaybg
    hyprshade
    networkmanagerapplet
  	brightnessctl
  	waybar
  	rofi-wayland
  	pavucontrol
	
  	# themes
  	nwg-look
  	adwaita-icon-theme
  ];

  fonts.packages = with pkgs; [ hack-font ];

  virtualisation.podman = {
  	enable = true;
  	dockerCompat = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # shell aliase
  environment.shellAliases = {
    my-nixos-rebuild = ''
      sudo rm /etc/nixos/*
      sudo cp /home/babu/.config/nixos/* /etc/nixos/ -r
      sudo nixos-rebuild switch
    '';
  };

  # hyprland on shell init
  environment.shellInit = ''
    [ "$(tty)" = "/dev/tty1" ] && exec Hyprland
  '';

  ###############
  ### System ####
  ###############

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support 
  services.libinput.enable = true;

  # User
  users.users.babu = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "kvm" "podman"];
  };


  # power management
  services.system76-scheduler.settings.cfsProfiles.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      	TLP_DEFAULT_MODE = "BAT";
      	TLP_PERSISTENT_DEFAULT = 1;

      	CPU_SCALING_GOVERNOR_ON_AC = "powersave";
          	CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      	CPU_BOOST_ON_AC = 0;
      	CPU_BOOST_ON_BAT = 0;

      	CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      	CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      	NMI_WATCHDOG = 0;

      	DEVICES_TO_DISABLE_ON_STARTUP="bluetooth wwan";
    	};
  };

  # enabel opengl and graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  # disable sleep on lead close
  services.logind.extraConfig = ''
  	HandleLidSwitch=ignore
  	HandleLidSwitchExternalPower=ignore
  	HandleLidSwitchDocked=ignore
  '';

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  # don't touch
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "24.11"; # Did you read the comment?
}
