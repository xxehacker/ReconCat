#!/bin/bash
# AUTHOR NAME = SecureAxom (Mridupawan)

banner() {

echo ""
echo "  __      __  _____ _____.___.__________    _____  _________  ____  __. "
echo " /  \    /  \/  _  \\__  |   |\______   \  /  _  \ \_   ___ \|    |/ _| "
echo " \   \/\/   /  /_\  \/   |   | |    |  _/ /  /_\  \/    \  \/|      <   "
echo "  \        /    |    \____   | |    |   \/    |    \     \___|    |  \  "
echo "   \__/\  /\____|__  / ______| |______  /\____|__  /\______  /____|__ \ "
echo "       \/         \/\/               \/         \/        \/        \/  "
echo ""

}

banner


curl -sk "http://web.archive.org/cdx/search/cdx?url=*.$1/*&output=text&fl=original&collapse=urlkey"
