#!/bin/bash

T1=$(tput setaf 1)
T2=$(tput setaf 2)
T3=$(tput setaf 3)
T4=$(tput setaf 4)
T5=$(tput setaf 5)
T6=$(tput setaf 6)
T7=$(tput setaf 7)
Tb=$(tput bold)
Tr=$(tput sgr 0 0)

readarray -t list<<<"$(ls /etc/netctl/ -p | grep -v /)"
for ((j=0; j<${#list[@]}; j++)); do echo -e "${j}) ${T5}${list[$j]}${Tr}"; done
[[ -f "$HOME/.config/changenet" ]] && { default=$(tail -2 "$HOME/.config/changenet" |head -1); last=$(tail -1 "$HOME/.config/changenet" |head -1); } || default="None"
echo

read -p "Enter a selection ${T5}(default=$default)${Tr}: " sel
re='^[0-9]+$'
[[ $sel =~ $re ]] && out=$sel || out=$default

case $out in
*[0-9]*) 
	if [ "$out" -ge 0 -a "$out" -lt ${#list[@]} ]; then
		echo "${T2}Switching to ${list[$out]}${Tr}"
		r=$(sudo netctl switch-to ${list[$out]} 2>/dev/null; echo $?)
		[ $r -ne 0 ] && echo "${T1}Fail... ($r)${Tr}" || { echo "${T2}Success!${Tr}"; [ $out -eq $last ] && echo "Same selection twice." || echo "$out">>"$HOME/.config/changenet"; }
	else echo "${T1}Invalid number!${Tr}"; fi 
	;;
*) 
	echo "${T1}Nothing chosen...${Tr}"
	;;
esac
