{ pkgs, xSettings }:
with pkgs;
mkShell {
  buildInputs = [
    cmake
    git
    sops
    home-manager
  ];

  shellHook = ''
    echo "##############################################################"
    echo "#### Entered shell with cmake, git, sops and home-manager ####"
    echo "#### --                                                   ####"
    echo "#### \"menu\" to enter menu                                 ####"
    echo "##############################################################"
    
    menu() {
    	while true; do
		clear
    		echo "################ Menu ################"
		echo "## 1. Create SSH folder            ###"
		echo "## 2. Create SOPS folder and file  ###"
		echo "## 3. Copy hardware configuration  ###"
		echo "## 4. exit                         ###"
		echo "######################################"

		read -p "Choose option [1-4]: " choice
	
		case "$choice" in
			1) if mkdir $HOME/.ssh; then
				echo "SSH folder created."
			else
				echo "Failed to create SSH folder."
			fi;;
			2) if mkdir -p $HOME/.config/sops/age && touch $HOME/.config/sops/age/keys.txt; then
				echo "SOPS file prep succeeded."
			else
				echo "SOPS file prep failed."
			fi;;
			3) nix_hw="/etc/nixos/hardware-configuration.nix"
			n0_hw="$HOME/nixed0/host/hardware.nix"
			if cp "$nix_hw" "$n0_hw"; then
				echo "Hardware config copied."
			else
				echo "Hardware config copy failed."
			fi;;
			4) echo "Exit"
			break;;
			*) echo "Invalid [1-4]";;
		esac
		read -p "Enter to return"
	    done
    }
  '';
}
