#!/bin/bash
#copyright@zymooll
webh="http://ddns.myddns.me:3421/"
bi=("" "zfile/directlink/7/craftbukkit/craftbukkit-1.7.9-R0.2-SNAPSHOT.jar" "zfile/file/7/craftbukkit/craftbukkit-1.8.8-R0.1-SNAPSHOT-latest.jar" "zfile/directlink/7/craftbukkit/craftbukkit-1.12.2.jar" "zfile/directlink/7/craftbukkit/craftbukkit-1.14.4-R0.1-SNAPSHOT.jar" "zfile/directlink/7/Spigot/spigot-1.7.9-R0.2-SNAPSHOT.jar" "zfile/directlink/7/Spigot/spigot-1.8.8-R0.1-SNAPSHOT-latest.jar" "zfile/directlink/7/Spigot/Spigot-1.12.2.jar" "zfile/directlink/7/Spigot/Spigot-1.15.1.jar")
download(){
    wget [[${webh}+${bi[$1]}]]
    echo "下载完毕"
}
start:
echo "欢迎使用本自动开服程序"
echo "1)下载服务器端"
echo "2)开启服务器端"
read -p ">" -n 1 -s inp
if ((inp==1));then
    start1:
    echo "1)CraftBukkit"
    echo "2)Spigot"
    read -p ">" -n 1 -s inp
    if ((inp==1));then
        start2:
        echo "1)1.7.9"
        echo "2)1.8.8"
        echo "3)1.12.2"
        echo "4)1.14.4"
        read -p ">" -n 1 -s inp
        if ((inp<5));then 
            download ((inp-1))
            break
        else
            echo "输入有误"
            goto start2
        fi
        break
    elif ((inp==2));then
        start3:
        echo "1)1.7.9"
        echo "2)1.8.8"
        echo "3)1.12.2"
        echo "4)1.14.4"
        read -p ">" -n 1 -s inp
        if ((inp<5));then
            download ((inp+3))
            break
        else
            echo "输入有误"
            goto start3
        fi
        break
    else
        echo "输入有误"
        goto start1
    fi
    break
elif ((inp==2));then
    echo "开服程序正在完成初始化..."
    yum install java
    yum install screen
    echo "进度50%..."
    read -p "输入服务器目录>" ml
    cd $ml
    read -p "输入服务端名称及最大内存(以空格分隔)>" nm maxm
    java -Xmx$maxmM -jar $nm.jar nogui
    echo "开服完毕！"
    break
else
    echo "输入有误"
    goto start
fi

