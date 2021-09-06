#!/usr/bin/sh

echo "Starting the SBOS installer."
echo "Determining system architecture."

arch=$(uname -m)

if [ "$arch" == "x86_64" ]; then
	echo "This is an x86_64 machine."
	echo "fetching Bedrock x86_64 to ~/.cache/."
	wget --output-document ~/.cache/bedrock-linux.sh https://github.com/bedrocklinux/bedrocklinux-userland/releases/download/0.7.23/bedrock-linux-0.7.23-x86_64.sh
elif [ "$arch" = "aarch64" ]; then
	echo "this is an aarch64 machine"
fi

echo "download completed."
echo "starting the Bedrock installer."

cd ~/.cache/


sudo sh ./bedrock-linux.sh --hijack
