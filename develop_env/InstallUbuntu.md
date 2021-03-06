# Ubuntu的安装/备份/克隆

#### 1.制作Ubuntu启动盘

你需要一个**容量大于4GB**的空u盘（不是空的也没事，但是制作启动盘会格式化u盘，所有东西都会丢失！），然后才能开始制作。

推荐使用rufus制作启动盘：[Rufus - Create bootable USB drives the easy way](http://rufus.ie/en/)

下载完后可以直接打开，我们还需要到ubuntu的官网去下载系统iso镜像：[下载Ubuntu桌面系统 | Ubuntu](https://cn.ubuntu.com/download/desktop)

目前建议下载Ubuntu 20.04.3 LTS（long-term support），虽然21.04已经推出，但是毕竟没有长期支持版来的稳定，并且20.04会持续提供性能和安全性更新。

镜像下载好之后，打开rufus：

<img src="Image_base\rufus.png" style="zoom: 67%;" />

有几个需要修改的地方已经用红色圈出。

1. 设备会自动扫描你插入的u盘，如果你有多个u盘插入，请选择要写入镜像的u盘，别搞错了。
2. 镜像文件选择下载好的Ubuntu iso系统镜像。
3. 分区类型务必选择GPT分区表
4. 目标类型务必选择UEFI（非CSM）
5. 若你的BIOS只支持NTFS，要改成NTFS，不过**一般都是支持FAT32的**，先用FAT32，如果不行再回来改

然后点击开始，这里选择“**以iso镜像模式写入**”

<img src="Image_base\isowrite.png" style="zoom:67%;" />

静待进度条跑满。



#### 2.利用磁盘管理划分空间

打开磁盘管理：

<img src="Image_base\diskmanager.png" style="zoom:67%;" />

选择一个空间较多的盘，右键点击它，选择压缩：

<img src="Image_base\compressspace.png" style="zoom:67%;" />

在压缩空间量中选择合适的大小用于安装ubuntu。这里给出的建议是：

1. 只是玩一玩linux系统，则分配30GB
2. 学习ROS，80GB以上
3. 深度学习、机器学习，100GB以上
4. 软件开发，50GB

作为示范，笔者压缩70G的空间用于安装Ubuntu。

压缩完了以后，底下会多出一块显示为“**未分配**”的空间。

<img src="Image_base\splitspaceforinstalling.png" style="zoom:67%;" />

<center>下面的磁盘1是刚刚制作好的启动盘</center>

#### 3.准备工作

##### 3.1 关闭BitLocker

bitlocker是微软出品的用于保护硬盘的加密系统，按下win+S搜索BitLocker，点击进入后将其关闭，否则它将禁止任何非windows的系统或设备对硬盘进行写入操作。

##### 3.2 关闭安全启动（secure boot）和快速启动（fast boot）

首先查询你的电脑如何进入BIOS，一般是ESC、DEL、F2、F10、F12等。

重启电脑（保持启动盘插入），进入BIOS，找到Secure boot和Fast Boot，将他们关闭，记得退出前保存。

##### 3.3 关闭平台可信模块（TPM）

同样是在BIOS中，关闭TPM（Trusted Platform Module），否则可能会禁止外界设备访问硬盘或CPU。若未开启或没有这个选项，则跳过不管。一般来说，此选项和Secure boot一起，在Secure（安全）选项卡下。

##### 3.4 如果你是dell电脑..

请仔细查看官网的说明：[如何启用戴尔设备的安全启动功能 | Dell 中国](https://www.dell.com/support/kbdoc/zh-cn/000190116/如-何-启用-戴尔-设备的-安全-启动-功能)，务必将启动模式调整为UEFI，并关闭安全启动。此外，请查看bios选项中的System Configuration，若你的硬盘链接协议是SATA RAID，请接着看 *3.5* 。

##### 3.5 如果你是机械硬盘➕固态硬盘..

一般来说，这时候你的电脑将以SATA RAID的方式链接不同的硬盘，然而RAID是一个古老的技术，ubuntu不支持从这种方式启动。首先退出bios正常开机，进入windows之后win+R，输如msconfig回车：

<img src="Image_base\msconfig.png" style="zoom:67%;" />

进入“**引导**”选项卡，将引导选项设置成安全引导，选择最小，然后重启电脑，进入bios。

这时候，将bios中的sata operation改成AHCI，再保存退出BIOS，进入系统，这时候会进入安全模式，别慌。再次win+R，msconfig回车，在”引导“选项卡关闭安全引导，然后重新启动，看看是否正常进入windows。

##### 3.6 如果你的电脑使用了傲腾内存或开启了intel RST...

在BIOS中可以看到你的电脑是否启用的快速存储技术（找一找）。直接参照这个链接，一把搞定：[ Disable RST for Installing ubuntu 20.4 Dual boot - Ask Ubuntu](https://askubuntu.com/questions/1281127/disable-rst-for-installing-ubuntu-20-4-dual-boot)



#### 4.安装配置

确保以上的步骤完成后，进入bios，把你的启动盘在启动顺序中调整到第一位，保存退出，重启后就会进入grub界面：

![](Image_base\grub.jpg)

**直接回车**，就会进入Ubuntu的安装界面了：

![](Image_base\welcome.png)

选择安装Ubuntu，然后选择简体中文，随后继续选择中文：

![choosekeyboard](Image_base\choosekeyboard.png)

先不联网，因为还没有换源，这时候下载的话会慢的半死：

![nowifi](Image_base\nowifi.png)

可以选择最小安装，省空间。如果你空间够大，也可以用正常安装，会装好一些媒体播放工具和邮件之类的，还有办公套件libreoffice（和msoffice差不多），其实也没什么用：

![minimalinstall](Image_base\minimalinstall.png)

这里一定更要选择其他选项，这样才可以自己分区：

> 不过如果你是在一台新电脑上安装（没有安装其他任何系统），你可以直接选择安装ubuntu，让它自己分区就好了。

![installtype](Image_base\installtype.png)

***关键部分来了！！***打起精神来。找到你刚刚在windows上分出来的未分配的空闲空间，根据大小判断就可以，笔者分的是70GB。

![freespace](Image_base\freespace.png)

选中空闲的空间，点击底下的➕，我们总共需要分3个分区，首先是**EFI系统分区**，也就是启动分区，系统将会从这里加载启动，内核文件也都放在这里。大小选择512MB，多了浪费少了不够用，分区类型选择逻辑分区，空间起始位置，“**用于**“ EFI系统分区别搞错了。

![EFIpartition](Image_base\EFIpartition.png)

随后是根目录，稍微分大一些，因为很多程序默认安装在根目录下的opt文件夹里，新手就不要随便乱改安装位置了，这里分配了40GB给/，**注意分区类型选择主分区**。

![rootpartition](Image_base\rootpartition.png)

最后是home目录，相当于用户自己的空间，和windows下的C盘之外的空间差不多的概念，剩下的空间全部给/home，有些教程会让你分SWAP（虚拟内存），不过现在大家的内存都很大，所以没这个必要。这里注意选择逻辑分区：

![homepartition](Image_base\homepartition.png)

> 其实你也可以选择全部挂载到 “ / ” 即根目录。因为Linux文件系统采用的是“使用时分配“的策略。也就是说，你用了多少，就会给那个分区分配多少分区，没用的时候，剩下的空间就处于”待分配“的状态。

分区分完以后，***再次注意！！！***安装启动引导器（bootloader）的设备要选择刚刚新分配的EFI分区，千万别和windows的EFI分区搞错了，不然直接凉凉。可以通过大小来区别两者（我们分配的大小会是511MB）：

![](Image_base\choosebootdevice.png)

选择现在安装，他会再让你确认一下是不是要把文件系统写入，确定启动器位置安装无误后继续。where you are这里直接继续就行了：

![whereyouare](Image_base\whereyouare.png)

这里是设置用户名和密码，选择自动登录会方便一些：

> 如果图方便，可以把密码设置成一个空格，开机比较快，之后给管理员权限也快一些。***倘若你有重要资料，建议不要太简单。***

![whoareyou](Image_base\whoareyou.png)

开始安装：

![installing](Image_base\installing.png)

弹处这个界面就是安装好了，直接重启：

![finishinstalling](Image_base\finishinstalling.png)

拔掉启动盘，按回车：

![](Image_base\removemedia.jpg)

**欢迎来到Linux的世界！**

![](Image_base\welcometoUbuntu.png)



#### 5.安装完成后必做的事

你需要更换软件源以获取更快的下载速度。ubuntu在中国虽然有服务器但是卡得一批





## 备份系统

- **备份**

  linux系统的设计哲学是“一切皆文件”，所以备份系统的时候我们只需要把重要文件，特别是系统文件，boot file和配置文件给打包起来即可，要还原，则直接将之前的还原点打包的tar解包到根目录即可。

  需要备份的时候，进入根目录，su进入超级管理员权限，注意超级管理员权限的密码和sudo密码不同，**若还没有设置**，输入：

  ```shell
  sudo passwd
  ```

  然后设置su权限的密码，强烈建议设置和管理员密码不同的密码避免误操作。

  设置完成后，开始备份：

  ```shell
  su
  cd /
  tar -cvpzf backup.tar.gz --exclude=/proc --exclude=/tmp --exclude=/home --exclude=/lost+found --exclude=/media --exclude=/mnt --exclude=/run --exclude=/dev /
  #如果需要备份home中的内容，把--exclude=/home去掉即可
  #若希望定制化备份内容，可以参考此链接：https://linux.cn/article-9798-1.html，详细介绍了每个文件夹存放的内容
  ```

  终端开始下雨...

  备份完后可能会出现一些错误，比如文件正在使用啊之类的，不用管，直接将生成的backup.tar.gz拷贝到u盘上即可。你也可以选择多设置一个分区用于保存备份文件，在需要恢复的时候再挂载，这样就省去一个u盘。

- **恢复**

  - 若要恢复，则利用cp命令（可能需要管理员权限）将back.tar.gz从u盘中移动到根目录，然后：

  ```shell
  su
  cd /
  tar -xvpzf backup.tar.gz -C /
  ```

  终端再次下雨...

  解包完成后，就回到了上次的还原点。

  tar命令的参数可以用help或者man命令查看，这里大致罗列一下用到的参数：

  - c：create，创建压缩文件
  - v：verbose，显示执行时的详细信息
  - p：permission，保存待压缩文件的读写权限
  - z：gzip，使用gzip生成gz，进一步减小压缩后的大小
  - x：extract，解包
  - f：file，指定生成压缩包的名称





## 克隆系统
