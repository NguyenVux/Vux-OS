RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
src=$1
image=$2
nasm $src -f bin -o "bin.img"
if [ $? -eq 0 ]; then
	if [ -f $image ]; then
		dd conv=notrunc if="bin.img" of=$image bs=440 count=1
		if [ $? -eq 0 ]; then
			printf "${GREEN}Successfully${NC} writed to image: ${image}"
			rm "bin.img"
		else
			printf "${RED}Failed${NC} to write to image: ${image}\r\n"
		fi
	else
		printf "${RED}File not Found${NC} to write to image ${image}\r\n"
	fi
else
	printf "${RED}Failed${NC} to Compiled ${src}\r\n"
fi