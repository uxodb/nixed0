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
    		echo "################ Menu ##################"
		echo "### 1. Create SSH folder             ###"
		echo "### 2. Create SOPS folder and file   ###"
		echo "### 3. Copy hardware configuration   ###"
		echo "### 4. Set SSH remote for git origin ###"
		echo "### 5. Exit                          ###"
		echo "######################################"

		read -p "Choose option [1-5]: " choice
	
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
			4) REPO="/home/uxodb/nixed0"
			if [ "$PWD" != "$REPO" ]; then
				cd "$REPO" || { echo "Failed, please cd into $REPO"; exit 1; }
			else
				echo "Current remote:"
				git remote -v
				sleep 1;
				echo -e "\nSetting new remote..."
				git remote set-url origin git@github.com:uxodb/nixed0.git
				sleep 1;
				echo -e "\nRemote set:"
				git remote -v
			fi;;
			5) echo "Exiting menu"
			break;;
			*) echo "Invalid [1-5]";;
		esac
		read -p "Enter to return"
	    done
    }
  '';
}
