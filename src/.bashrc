load_file_if_exists()
{
	if [ -f "$1" ]
	then
		source "$1"
	fi
}

remove_if_exists()
{
	if [ -e "$1" ]
	then
		rm -rf "$1"
	fi
}

remove_if_exists	$HISTFILE

bc="bash_completion"
if [[ `uname` = 'FreeBSD' ]]
then
	bc="/usr/local/etc/${bc}"
elif [[ `uname` = 'Linux' ]]
then
	bc="/etc/${bc}"
fi

load_file_if_exists	$bc


alias	go='pushd'
alias	b='popd'
alias	h='history'
alias	r='rm -r'
alias	c='clear'
alias	l='ls --color'
alias	t='tail -n 50'

pskill()
{
        local pid

        pid=$(ps -ax | grep $1 | grep -v grep | awk '{ print $1 }')
        echo -n "killing $1 (process $pid)..."
        kill -9 $pid
}

history_number()
{
	local	num=`history | tail -n 1 | awk '{ printf "%3d", $1 + 1 }'`
	if [ -z $num ]; then
		num='  1'
	fi
	echo -n "${num}"
}

time_of_day()
{
	local	t=`date +%R`
	echo -n	"${t}"
}

present_working_directory()
{
	local	d=`pwd | awk '{ printf "%-66s", $1 }'`
	echo -n "${d}"
}

full_prompt_data()
{
	echo "`present_working_directory` `time_of_day` `history_number`"
}

set_prompt()
{
	local	tty=`tty | awk -F/ '{ print $3 $4}'`
	local 	red="\[\e[01;31m\]"
	local	normal="\[\e[00;0m\]"
	local	p="${red}: `full_prompt_data` ;\n${normal} "
	local	xterm_title="\[\e]0;${tty} \u@\H\007\]"
	if [ "${TERM}" = "xterm" ]
	then
		export	PS1="${xterm_title}${p}"
	else
		export	PS1="${p}"
	fi
	export	PS2=" "
	export	PS3=" "
}

umask	002

export	PROMPT_COMMAND='set_prompt'

export  HISTIGNORE="&:h:exit"
export	RUBYOPT=rubygems
export	EDITOR="vi"
export	PATH=$PATH:/sbin/:/usr/sbin/:$HOME/bin:.
export	TZ=/usr/share/zoneinfo/America/Los_Angeles
