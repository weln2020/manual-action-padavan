# 状态：[WELN2020 恩山论坛](https://www.right.com.cn/forum/thread-6896728-1-1.html "PadavanKVR_K2P 精简版 支持KVR")
[![](https://img.shields.io/github/downloads/weln2020/manual-action-padavan/total?label=下载量)](https://github.com/weln2020)
[![](https://img.shields.io/github/stars/weln2020/manual-action-padavan?label=加星量)](https://github.com/weln2020?tab=stars)
[![](https://img.shields.io/github/repo-size/weln2020/manual-action-padavan?label=库大小)](https://github.com/weln2020/manual-action-padavan)
[![](https://img.shields.io/github/last-commit/weln2020/manual-action-padavan?label=源码更新)](https://github.com/weln2020/manual-action-padavan/blob/main/.github/workflows/Padavan.yml)

[![](https://github.com/weln2020/manual-action-padavan/actions/workflows/Padavan.yml/badge.svg)](https://github.com/weln2020/manual-action-padavan/actions/workflows/Padavan.yml)
[![](https://img.shields.io/github/v/release/weln2020/manual-action-padavan?label=编译日期)](https://github.com/weln2020/manual-action-padavan/releases)
>代码参考：[tick-guo](https://github.com/tick-guo/router-rom "60%")　[HuaZhuangNan](https://github.com/HuaZhuangNan/actions-build-padavan-openwrt "40%")
>
>转载请注明出处 喜欢请点右上角 `Star` 给我加星
---
## 使用方法
**Padavan手动云编译工作流 适用大部分源码 可同时编译多个固件 内含自定义文件 无需Fork修改源码：**
>1.点击 `Fork` 复制到自己的仓库 修改机型"自定义文件"
>
>2.依次点击 `Actions`→`Padavan手动云编译`→`Run workflow ▼`
>
>3.在弹出的窗口里填写"编译参数" 点击 `Run workflow` 开始云编译
```
> > 编译参数 < <
     │
     ├── 设置固件型号：--- 多个型号间用空格分开 建议每次编译最多不超过10个固件
     │
     ├── 设置源码地址：--- 理论上所有padavan源码编译通用 注意源码地址后加.git
     │
     └── 是否发布到Release？：--- 不发布也可以到Artifacts下载压缩包 Release下载慢 只能下载单个文件
```
---
## 源码地址
```
> > > 官方源码地址：https://bitbucket.org/padavan/rt-n56u < < <
```
**常用Padavan源码地址 复制到"编译参数"中即可：**
>- [https://github.com/hanwckf/rt-n56u.git](https://github.com/hanwckf/rt-n56u.git "hanwckf 最新源码")
>- [https://github.com/chongshengB/rt-n56u.git](https://github.com/chongshengB/rt-n56u.git "chongshengB 优质插件")
>- [https://github.com/hiboyhiboy/rt-n56u.git](https://github.com/hiboyhiboy/rt-n56u.git "hiboyhiboy 众多插件")
>- [https://github.com/padavanonly/rt-n56u.git](https://github.com/padavanonly/rt-n56u.git "padavanonly 率先支持KVR")
>- [https://github.com/immortalwrt/padavan.git](https://github.com/immortalwrt/padavan.git "immortalwrt KVR及小细节")
>- [https://github.com/keke1023/Padavan.git](https://github.com/keke1023/Padavan.git "keke1023 四码融合一")
>- [https://github.com/vb1980/Padavan-KVR.git](https://github.com/vb1980/Padavan-KVR.git "vb1980 四码融合二")
---
## 机型列表
**类似硬件设备可以通刷 也可以增加.config来适配机型：**
| 处理器 | 型号 |
|:------:|----------|
| **mt7620** | 5K-W20　MI-3　MI-MINI　NEWIFI-MINI　OYE-001　PSG1208　PSG1218　YK-L1 |
| **mt7628** | 360P2　HC5661A　HC5761A　HC5861B　MI-3C　MI-NANO　MZ-R13　MZ-R13P　MZ-R18 |
| **mt7621+7612** | A3004NS　B70　MI-4　MI-R3G　MI-R4A　MSG1500　NEWIFI-D1　NEWIFI3 <br> R6220　RT-AC1200GU　WR1200JS　XY-C1　ZTE_E8820S　ZTE_E8820V2 |
| **mt7621+7615** | A-040W-Q　DIR-878　DIR-882　JCG-836PRO　JCG-AC860M　JCG-Y2　K2P　MI-R3P <br> MR2600　MSG1500-7615　NETGEAR-BZV　NETGEAR-CHJ　R2100　RM2100　WDR7300 |
| **mt7621+7915** | CR660x　JCG-Q20 |
---
## 自定义文件
**文件结构说明：**
```
├──.github/workflows  --- github工作流
│   └──Padavan.yml  --- 云编译代码(WEB页底内容)
│
├── config ---插件模板
│   ├── K2P.config
│   ├── MSG1500.config
│   ├── NEWIFI3.config
│   ├── PSG1218.config
│   ├── XY-C1.config
│   └── XXX.config  --- [参照源码适配机型增添]
│
├── README.md  --- 说明文件
│
├── defaults.h  --- 默认参数
│
└── versions.inc  --- 固件版本
```
**自定义文件采用替换方式修改源码 注意对照源码内容进行编写：**
| 文件名 | 源码位置 |
|--------|----------|
|　**以下内容执行目录：** | `/opt/rt-n56u/trunk` |
|　**1.插件模板：**`XXX.config`　| `/configs/templates/XXX.config` |
|　**2.固件版本：**`versions.inc` | `./versions.inc` |
|　**3.默认参数：**`defaults.h`　| `/user/shared/defaults.h` |
|　**4.telnet与ssh：**`defaults.c` | `/user/shared/defaults.c` |
|　**5.WEB页底内容：**`state.js` | `/user/www/n56u_ribbon_fixed/state.js` 
|　**6.路由硬件配置：**`kernel-3.4.x.config` | `/configs/boards/XXX/kernel-3.4.x.config` |
|　**7.指示灯与复位键：**`board.h` | `/configs/boards/XXX/board.h` |
---
---
## 关注趋势
[![Stargazers over time](https://starchart.cc/weln2020/manual-action-padavan.svg)](https://github.com/weln2020?tab=repositories "始于2021年12月")
