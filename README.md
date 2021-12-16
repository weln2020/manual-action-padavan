# 状态：[WELN2020](https://github.com/weln2020/manual-action-padavan)
[![](https://img.shields.io/github/downloads/weln2020/manual-action-padavan/total?label=下载量)](https://github.com/weln2020)
[![](https://img.shields.io/github/stars/weln2020/manual-action-padavan?label=加星量)](https://github.com/weln2020?tab=stars)
[![](https://img.shields.io/github/repo-size/weln2020/manual-action-padavan?label=库大小)](https://github.com/weln2020/manual-action-padavan)
[![](https://img.shields.io/github/last-commit/weln2020/manual-action-padavan?label=源码更新)](https://github.com/weln2020/manual-action-padavan/blob/main/.github/workflows/Padavan.yml)

[![](https://github.com/weln2020/manual-action-padavan/actions/workflows/Padavan.yml/badge.svg)](https://github.com/weln2020/manual-action-padavan/actions/workflows/Padavan.yml)
[![](https://img.shields.io/github/v/release/weln2020/manual-action-padavan?label=编译日期)](https://github.com/weln2020/manual-action-padavan/releases)

代码参考：[HuaZhuangNan](https://github.com/HuaZhuangNan/actions-build-padavan-openwrt)<br>[chongshengB](https://github.com/chongshengB/rt-n56u)<br>[tick-guo](https://github.com/tick-guo/router-rom)

## 使用方法
**Padavan手动云编译工作流 可同时编译多个固件 内含自定义文件 无需Fork修改源码：**
>1. 点击 `Fork` 复制到自己的仓库 修改机型"自定义文件"
>
>2. 依次点击 `Actions`→`Padavan手动云编译`→`Run workflow ▼`
>
>3. 在弹出的窗口里填写"编译参数" 点击 `Run workflow` 开始云编译

## 自定义文件
**采用替换方式修改源码 注意对照源码相应文件进行编写：**
> 1.`XXX.config` **插件模板** | -- `/configs/templates/XXX.config`
>
> 2.`defaults.h` **默认参数** | -- `/user/shared/defaults.h`
>
> 3.`padavan.sh` **脚本执行** | -- `/opt/rt-n56u/trunk`
>                  **WEB页面显示** ./user/www/n56u_ribbon_fixed/state.js
>                  **固件版本号在** ./versions.inc

## 源码地址
**常用Padavan源码地址 复制到"编译参数"中即可：**
>- 1.`hanwckf`　　https://github.com/hanwckf/rt-n56u.git
>- 2.`chongshengB` https://github.com/chongshengB/rt-n56u.git
>- 3.`padavanonly` https://github.com/padavanonly/rt-n56u.git
>- 4.`immortalwrt` https://github.com/immortalwrt/padavan.git
