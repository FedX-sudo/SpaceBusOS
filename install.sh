#!/usr/bin/sh

echo "Starting the SBOS installer."
echo "Determining system architecture."

arch=$(uname -m)

if [ "$arch" == "x86_64" ]; then
	dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-x86_64.sh")

elif [ "$arch" == "aarch64" ]; then
	dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-aarch64.sh")

elif [ "$arch" == "armv7hl" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-armv7hl.sh")

elif [ $arch = "i386" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-i386.sh")

elif [ $arch = "i486" ]; then
    dl_url=$(echo "https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-i486.sh")

fi

echo "Downolading the Bedrock Linux installer."

wget --output-file ~/.cache/bedrock-linux-0.7.23.sh $dl_url

echo "download completed."
echo "starting the Bedrock installer."

cd ~/.cache/


sudo sh ./bedrock-linux.sh --hijack
