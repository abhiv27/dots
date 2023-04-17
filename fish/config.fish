function fish_greeting
	echo Hello $USER!
	echo Today is (date +%A), (date +%-d)(DaySuffix) of (date +%B) (date +%Y) and the time is (date +%T).
	echo \n
	fortune
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function install
	command sudo dnf install -y $argv 
end

function update
	command sudo dnf update -y
end

function remove
	command sudo dnf remove -y $argv
end

function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
end

function onlinepython
	command ssh -i /home/yuki/mirai -L 9999:localhost:9999 yume@mirai
end

function logout
	qdbus org.kde.ksmserver /KSMServer logout 0 0 2
end

function おはよ
	echo こんにちは, アビーさん。
	echo 今日は(date +%Y)年(date +%-m)月(date +%-d)日(jp_week)です。
 	echo 時間は(date +%H)時(date +%M)分(date +%S)秒です。
end

function nf
	command neofetch
end

function send
	scp -i /home/yuki/mirai $argv yume@mirai:/home/yume
end

function receive 
	scp -i /home/yuki/mirai yume@mirai:/home/yume/$argv .
end

function DaySuffix
    switch (date +%-d)
        case '1'
            echo st
        case '21'
            echo st
        case '31'
            echo st
        case '2'
            echo nd
        case '22'
            echo nd
        case '3'
            echo rd
        case '23'
            echo rd
        case '*'
            echo th
    end
end

function jp_week
    switch (date +%A)
        case Monday
            echo 月曜日
        case Tuesday
            echo 火曜日
        case Wednesday
            echo 水曜日
        case Thursday
            echo 木曜日
        case Friday
            echo 金曜日
        case Saturday
            echo 土曜日
        case Sunday
            echo 日曜日
    end
end

function jp_month
    switch (date +%B)
        case January
            echo 一月
        case February
            echo 二月
        case March
            echo　三月
        case April
            echo 四月
        case May
            echo　五月
        case June
            echo　六月
        case July
            echo　七月
        case August
            echo　八月
        case September
            echo　九月
        case October
            echo　十月
        case November
            echo　十一月
        case December
            echo　十二月
    end
end

function date_jp --description "Implementing Date command but replacing few aspects into japanese"
	echo (jp_week) (date +%-d) (jp_month) (date +%T) (date +%Z) (date +%Y)
end

