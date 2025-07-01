#!/usr/bin/env bash
# Author: Indrajit Ghosh
# === Colors ===
BOLD="\033[1m"; RED="\033[31m"; GREEN="\033[32m"
YELLOW="\033[33m"; CYAN="\033[36m"; RESET="\033[0m"

# === Helper Functions ===
section() { echo -e "\n${BOLD}${CYAN}==> $1${RESET}"; }

need() {
  local cmd=$1 pkg=$2
  if ! command -v "$cmd" &>/dev/null; then
    echo -e "${RED}  • '$cmd' not found.${RESET}"
    echo -e "    Install with:"
    echo -e "      Debian/Ubuntu : ${GREEN}sudo apt install $pkg${RESET}"
    echo -e "      Fedora/RHEL   : ${GREEN}sudo dnf install $pkg${RESET}"
    echo -e "      CentOS 7      : ${GREEN}sudo yum install $pkg${RESET}"
    return 1
  fi
  return 0
}

# === Banner ===
echo -e "\n${BOLD}${YELLOW}===== System Information Summary =====${RESET}\n"

# === Basic Info ===
section "Basic Info"
printf "${BOLD}%-18s${RESET} %s\n" "Hostname:"    "$(hostname)"
printf "${BOLD}%-18s${RESET} %s\n" "Username:"    "$USER"
printf "${BOLD}%-18s${RESET} %s\n" "Date & Time:" "$(date)"

# === OS Info ===
section "Operating System"
printf "${BOLD}%-18s${RESET} %s\n" "OS:"           "$(grep -oP '(?<=^PRETTY_NAME=).*' /etc/os-release | tr -d '"')"
printf "${BOLD}%-18s${RESET} %s\n" "Kernel:"       "$(uname -r)"
printf "${BOLD}%-18s${RESET} %s\n" "Architecture:" "$(uname -m)"

# === CPU Info ===
section "CPU Info"
if need "lscpu" "util-linux"; then
  lscpu | awk -F: '
    /Model name|Socket|CPU\(s\)|Thread|Core|MHz/ {
      gsub(/^[ \t]+/, "", $2);
      printf "'"${GREEN}"'%-18s'"${RESET}"' %s\n", $1":", $2
    }'
fi

# === Memory Info ===
section "Memory (RAM)"
if command -v free >/dev/null; then
  free -h | awk '
    /^Mem:/ {
      printf "'"${GREEN}"'Total:'"${RESET}"' %-6s  '"${YELLOW}"'Used:'"${RESET}"' %-6s  '"${CYAN}"'Free:'"${RESET}"' %-6s\n", $2, $3, $4
    }'
else
  echo -e "${RED}  • 'free' not found. Try: sudo apt install procps${RESET}"
fi

# === GPU Info ===
section "Graphics (GPU)"
if need "lspci" "pciutils"; then
  lspci | grep -Ei "vga|3d" | while IFS= read -r line; do
    echo -e "${BOLD}•${RESET} $line"
  done
fi

# === Storage Info ===
section "Block Devices"
if need "lsblk" "util-linux"; then
  lsblk -o NAME,SIZE,ROTA,TYPE,MOUNTPOINT | grep -E "disk|part" | while IFS= read -r line; do
    echo -e "${BOLD}•${RESET} $line"
  done
fi

# === Disk Usage ===
section "Filesystem Usage"
df -hT -x tmpfs -x devtmpfs | awk 'NR==1 || /^\/.*/ {
  printf "'"${BOLD}"'%-23s'"${RESET}"' %-7s %-7s %-5s %s\n", $1, $3, $4, $5, $7
}'

# === Network Info ===
section "Network"
if need "ip" "iproute2"; then
  ip -o -4 addr show scope global | awk '{ print "'"${BOLD}"'• Interface:'"${RESET}"'", $2, "'"${CYAN}"'IP:'"${RESET}"'", $4 }'
fi

# === End ===
echo -e "\n${BOLD}${YELLOW}===== End of Summary =====${RESET}\n"
