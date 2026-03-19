# **如何使用termux在安卓平台搭建科研环境**

> 推荐使用平板+外接键盘

> termux同时支持连接远程服务器以及Debian系统下使用code-server搭建本地服务器，并使用GitHub进行外部文件连接。
# **一、 前期准备与Termux基础配置**
## 1. Termux的安装
可通过F-Droid搜索"Termux"直接安装：

<https://f-droid.org/zh_Hans/packages/com.termux/>

## 2. Termux基础环境配置
首先需更新包管理器,确保系统包为最新版本：
```
apt update && apt upgrade -y
```

随后可安装基础开发工具(git, curl, wget, vim): 
```
pkg install -y git curl wget vim
```

> 记得申请存储权限:`termux-setup-storage`

# **二、 安装Debain(proot)**
## 1. 安装工具  
```
pkg install proot-distro -y
```
## 2. 安装Debain
```
proot-distro install debian
```
如果下载很慢或者根本不下的话，可尝试切换Termux的镜像源为国内镜像（如清华大学镜像）：`termux-change-repo`

## 3. 进入Debian
执行以下命令即可进入Debian环境：`proot-distro login debian`

## 4. 创建快捷方式
可以键入`nano ~/.bashrc`或是`nano ~/.zshrc(选装了zsh的话)`打开配置文件
在末尾添加`alias deb='~/start\_debian.sh'`,这样在termux界面输入deb即可快速进入Debian环境
## 5. 配置Debian镜像源（可选）
```
sudo tee /etc/apt/sources.list << 'EOF'
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
EOF

sudo apt update
```
# **三、 Debain基础配置**
## 1. 更新系统
```
apt update && apt upgrade -y
```

## 2. 安装基础工具
```
apt install -y sudo git curl wget vim build-essential
```
## 3. （可选）创建非 root 用户
```
adduser 用户名
usermod -aG sudo 用户名
```

切换用户：
```
su - 用户名
```

# **四、 安装codeserver**
## 1. 下载与安装
首先需确保Debian环境已安装curl工具（若未安装可通过`apt install -y curl`补充），随后执行以下命令下载并安装code-server：
```
curl -fsSL https://code-server.dev/install.sh | sh
```

## 2. 配置code-server
1. 可通过编辑配置文件自定义端口、密码等参数：
```
nano ~/.config/code-server/config.yaml
```
2. 修改以下内容：
```
bind-addr: 127.0.0.1:8080
auth: password
password: （替换为你的密码）
cert: false
```

## 3. 启动code-server
1. 键入`code-server`
2. 打开浏览器，在地址栏输入127.0.0.1:8080（默认端口，若启动时指定了其他端口则替换为对应端口号）
3. 输入你在config.yaml中设置的密码，即可进入code-server的Web界面

## 4. 安装常用插件（可选）
chinese、Python、Bash IDE、GitHub copilot、markdown、yaml

# **五、 安装蟒蛇（Python）/Mamba环境配置**
1. 输入`micromamba create -n bio python=3.11 -y`以创建环境
2. 输入`micromamba activate bio`激活
3. 输入以下内容安装：
```
micromamba install -c bioconda \
samtools bwa fastqc bedtools -y
```

# **六、 Git环境**
1. 配置用户
```
git config --global user.name "你的用户名"
git config --global user.email "你的邮箱"
```

# **七、 创建文件夹**
1. 创建项目目录：
```
mkdir -p ~/Bioinformatics-analysis
cd ~/Bioinformatics-analysis
```

2. 初始化git：在项目目录下执行`git init`命令，该命令会在当前目录创建一个隐藏的`.git`文件夹，用于存储Git的版本控制信息

3. 创建标准目录结构
```
mkdir data scripts results docs
touch README.md
```

如果安装了`tree`工具，可通过`tree`命令快速查看当前目录结构（若未安装，可执行`sudo apt install tree -y`补充），可以看到输出结构如下：
```
Bioinformatics-analysis/
├── data/
├── scripts/
├── results/
├── docs/
└── README.md
```
# **八、 R环境安装**
1. 键入`sudo apt install -y r-base`安装R
2. 安装完成后直接输入R来启动R
3. 进入R后，键入以下内容安装基础包：
```
install.packages(c(
    "tidyverse",
    "data.table",
    "ggplot2"
))
```
4. Bioconductor安装
```
install.packages("BiocManager")
BiocManager::install()
```
5. 生信核心包
```
BiocManager::install(c(
    "DESeq2",
    "edgeR",
    "clusterProfiler"
))
```

6. 进入codeserver安装`R`、`R Language Server`插件

# **九、安装vim（可选）**
1. 下载并安装：
```
sudo apt update && sudo apt upgrade -y
sudo apt install vim -y
```
2. 验证安装
键入`vim --version`,得到类似如下输出即为正确安装：
```
VIM - Vi IMproved 9.x
Included patches: 1-xxxx
Compiled by Debian
```

3. 可选配置
创建个人 Vim 配置文件 `~/.vimrc`：
```
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
```
- syntax on：语法高亮
- set number：显示行号
- set tabstop/shiftwidth/expandtab：设置缩进风格
- set mouse=a：允许鼠标操作

> 由于termux中系统把`Esc`解释成“返回/退出”而不是终端里的`ESC`键，所以：  
`ESC`→`Ctrl + [`（标准终端方案），这一替换方式在多数终端应用中通用，可解决科研工具（如Vim、RStudio Server）中`ESC`键功能异常的问题。
>
>👉 原理：  
`ESC` 的 `ASCII = 27`   
`Ctrl + [` 正好产生 `27`
