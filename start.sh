echo "开服程序正在完成初始化...\n"
yum install java
yum install screen
echo "进度50%..."
screen -S mc
echo "进度75%...(若50%报错,请重新运行本程序)\n"
read -p "输入服务器目录>" ml
cd $ml
read -p "输入服务端名称及最大内存(以空格分隔)>" nm maxm
java -Xmx$maxmM -jar $nm.jar nogui
echo "开服完毕！"
