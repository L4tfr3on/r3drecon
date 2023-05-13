#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${YELLOW}"
echo "======================================================="
echo "           Welcome to ScriptKiddi3 Installer             "
echo "======================================================="
echo -e "${NC}"

echo -e "${BLUE}[*] Installing shc...${NC}"
apt-get install shc

echo -e "${BLUE}[*] Installing jq...${NC}"
apt-get install jq

echo -e "${BLUE}[*] Installing unzip...${NC}"
apt-get install unzip

echo -e "${BLUE}[*] Installing subfinder...${NC}"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

echo -e "${BLUE}[*] Installing Amass...${NC}"
go install -v github.com/OWASP/Amass/v3/...@master

echo -e "${BLUE}[*] Installing ffuf...${NC}"
go install github.com/ffuf/ffuf@latest

echo -e "${BLUE}[*] Installing subzy...${NC}"
go install -v github.com/lukasikic/subzy@latest

echo -e "${BLUE}[*] Installing findomain...${NC}"
wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
unzip findomain-linux.zip
mv findomain $HOME/go/bin
chmod 777 $HOME/go/bin/findomain

echo -e "${BLUE}[*] Installing httprobe...${NC}"
go install github.com/tomnomnom/httprobe@latest

echo -e "${BLUE}[*] Installing httpx...${NC}"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

echo -e "${BLUE}[*] Installing nuclei...${NC}"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

echo -e "${BLUE}[*] Compiling ScriptKiddi3...${NC}"
shc -f scriptkiddi3.sh
mv scriptkiddi3.sh.x scriptkiddi3
cp scriptkiddi3 $HOME/go/bin
chmod 777 $HOME/go/bin/scriptkiddi3
rm -rf scriptkiddi3.sh

echo -e "${BLUE}[*] Downloading wordlists...${NC}"
wget https://wordlists-cdn.assetnote.io/data/automated/httparchive_subdomains_2020_11_18.txt -O subdomains.txt
mv subdomains.txt /usr/share/wordlists/
chmod 777 /usr/share/wordlists/subdomains.txt

echo -e "${GREEN}[+] ScriptKiddi3 installed successfully.${NC}"
