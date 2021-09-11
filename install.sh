#!/usr/bin/sh

echo "Starting the SBOS installer."
echo "Determining system architecture."

arch=$(uname -m)

if [ "$arch" == "x86_644" ]; then
	dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-x86_64.sh")

elif [ "$arch" == "aarch64" ]; then
	dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-aarch64.sh")

elif [ "$arch" == "armv7hl" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-armv7hl.sh")

elif [ $arch = "i386" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-i386.sh")

elif [ $arch = "i486" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-i486.sh")

elif [ $arch = "i586" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-i586.sh")

elif [ $arch = "i686" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-i686.sh")

elif [ $arch = "mips" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-mips.sh")

elif [ $arch = "mips64el" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-mips64el.sh")

elif [ $arch = "mipsel" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-mipsel.sh")

elif [ $arch = "ppc" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-ppc.sh")


elif [ $arch = "ppc64le" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-ppc64le.sh")


elif [ $arch = "s390x" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-s390x.sh")


else
    read -p "Error: unable to find architecture, would you like to build Bedrock Linux from source? (y/n)" tempvar
    if [ $tempvar = "y" ]; then
        echo "Downloading souce code"
        cd ~/.cache/
        git clone https://github.com/paradigm/bedrocklinux-userland
        cd bedrocklinux-userland
        make
    else
        echo "An error has occured, exiting. See fedx-sudo.github.io/SpaceBusOS-Wiki for more details."
    fi
fi

if [ $tempvar = "y" ]; then

    echo "Downolading the Bedrock Linux installer."

    wget --output-file ~/.cache/bedrock-linux-0.7.23.sh $dl_url

    echo "download completed."


    cd ~/.cache/
fi
echo "starting the Bedrock installer."
sudo sh ./bedrock-linux.sh --hijack
