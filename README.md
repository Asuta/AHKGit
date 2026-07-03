# AHKGit 使用说明

一个面向键鼠增强的 AutoHotkey 小工具。它把 `CapsLock` 和 `Space` 改造成两层“功能键”：  
`CapsLock` 更偏鼠标、画布和缩放，`Space` 更偏光标、编辑和滚动。

```text
      +-------------------+
      |   左手按住功能键   |
      |  CapsLock / Space |
      +---------+---------+
                |
                v
        右手 I J K L / W A S D
        像开小飞机一样移动鼠标、画布、光标
```

## 快速开始

直接运行：

```text
pocket_enhancement.exe
```

如果你想用源码运行，需要安装 AutoHotkey v1，然后运行：

```text
pocket_enhancement.ahk
```

也可以运行 `test.exe` / `test.ahk` 作为简单管理器，它会启动或重启 `pocket_enhancement.exe`。

## 核心手势地图

### CapsLock 鼠标层

按住 `CapsLock` 时，`I J K L` 变成鼠标移动方向键：

```text
        I
        ^
        |
J <-----+-----> L
        |
        v
        K

CapsLock + I/J/K/L = 移动鼠标指针
```

可以组合出斜向移动，例如：

```text
CapsLock + I + J = 向左上移动
CapsLock + I + L = 向右上移动
CapsLock + K + J = 向左下移动
CapsLock + K + L = 向右下移动
```

鼠标点击：

| 按键 | 作用 |
| --- | --- |
| `CapsLock + U` | 左键 |
| `CapsLock + F` | 左键 |
| `CapsLock + O` | 右键 |

鼠标移动速度：

| 按键 | 作用 |
| --- | --- |
| `CapsLock + [` | 降低鼠标移动速度 |
| `CapsLock + ]` | 提高鼠标移动速度 |
| `Esc + F4` | 鼠标移动速度在普通/超快之间切换 |

速度会自动保存到 `settings.ini`。下次重启程序后，会继续使用上一次调好的速度。

### CapsLock 画布层

按住 `CapsLock` 时，`W A S D` 用来拖动画布或页面：

```text
        W
        ^
        |
A <-----+-----> D
        |
        v
        S

CapsLock + W/A/S/D = 移动画布/页面
```

| 按键 | 作用 |
| --- | --- |
| `CapsLock + W` | 画布向上 |
| `CapsLock + A` | 画布向左 |
| `CapsLock + S` | 画布向下 |
| `CapsLock + D` | 画布向右 |
| `Esc + F5` | 画布移动速度在 1x / 2x 之间切换 |

### CapsLock 缩放层

```text
Q = zoom out      E = zoom in
```

| 按键 | 作用 |
| --- | --- |
| `CapsLock + Q` | 持续缩小 |
| `CapsLock + E` | 持续放大 |

在 OneNote 中，缩放节奏会更快一些；其他窗口会更慢一些。

### CapsLock 滚轮速度

按住 `Space` 并移动实体鼠标时，鼠标移动会被转换成滚轮/横向滚轮。下面两个键控制这个滚动倍率：

| 按键 | 作用 |
| --- | --- |
| `CapsLock + -` | 降低滚动速度 |
| `CapsLock + +` | 提高滚动速度 |

屏幕上会短暂显示 `Scroll Speed`。

## Space 编辑层

`Space` 像一个临时的编辑模式键。按住它，再按右手区按键：

```text
        I = 上
J = 左       L = 右
        K = 下

U = 行首      P = 行尾
; = 删除前一个字符
Q = Esc
```

### 光标移动

| 按键 | 作用 |
| --- | --- |
| `Space + I` | 上 |
| `Space + J` | 左 |
| `Space + K` | 下 |
| `Space + L` | 右 |
| `Shift + Space + I/J/K/L` | 选中文本方向移动 |
| `F + Space + J` | 向左跳一个词 |
| `F + Space + L` | 向右跳一个词 |
| `Shift + F + Space + J/L` | 按词选择 |
| `Space + U` | Home |
| `Space + P` | End |
| `Shift + Space + U/P` | 选中到行首/行尾 |

OneNote 中，上下方向会尽量发送到 `OneNote::DocumentCanvas1`，减少焦点跑偏。

### 编辑和系统辅助

| 按键 | 作用 |
| --- | --- |
| `Space + Q` | Esc |
| `Space + ;` | Backspace |
| `Space + PrintScreen` | Windows 截图 |
| `Space + 左键` | 浏览器/支持该快捷键的软件后退 |
| `Space + 右键` | 浏览器/支持该快捷键的软件前进 |
| `Space + 左 Ctrl` | 发送右 Win |

### Space + 鼠标移动 = 滚轮

按住 `Space` 后移动实体鼠标，可以把鼠标移动转换成滚轮/横向滚轮：

```text
按住 Space
  |
  +-- 鼠标上下移动 -> 垂直滚动
  +-- 鼠标左右移动 -> 横向滚动
```

如果只是轻点 `Space`，没有触发滚动或组合键，仍会输出普通空格。

## Alt 层

| 按键 | 作用 |
| --- | --- |
| `Alt + I` | 上 |
| `Alt + J` | 左 |
| `Alt + K` | 下 |
| `Alt + L` | 右 |
| `Alt + ;` | Delete |

## 其他组合

| 按键 | 作用 |
| --- | --- |
| `右 Ctrl` | 映射为左 Win |
| `右 Alt + L` | 锁定电脑 |
| `左键 + 右键` / `右键 + 左键` | 发送 `Alt + Q` |
| `左键 + Space` | 发送 Win |
| 鼠标放在任务栏上滚轮 | 调整音量 |
| 鼠标放在任务栏上中键 | 静音 |
| `左键 + Enter` | 退出增强脚本 |

## 程序管理

如果使用 `test.exe` / `test.ahk` 启动管理器：

| 按键 | 作用 |
| --- | --- |
| `Esc + F1` | 关闭 `pocket_enhancement.exe` |
| `Esc + F2` | 完全重启 |

主脚本中还有这些维护键：

| 按键 | 作用 |
| --- | --- |
| `Esc + F3` | 依次释放/触发 Ctrl、Shift、Alt、Win、Space，用来解一些卡键状态 |
| `Esc + F4` | 鼠标移动普通/超快切换 |
| `Esc + F5` | 画布拖动速度 1x / 2x 切换 |
| `Esc + F6` | 显示当前窗口和控件信息，调试用 |

## 配置文件

程序会在当前目录生成：

```text
settings.ini
```

目前主要保存：

```ini
[MouseMove]
Acceleration=1.5
```

如果你把鼠标移动速度调乱了，可以关闭程序后删除 `settings.ini`，下次启动会回到默认速度。

## 使用提醒

- `CapsLock` 单独按下会被屏蔽，不再切换大小写锁定。
- 本工具是全局热键工具，会影响所有窗口；建议先在普通文本编辑器里熟悉手感。
- 如果出现按键卡住或行为异常，优先尝试 `Esc + F2` 重启管理器，或使用 `左键 + Enter` 退出增强脚本。
- 如果你从源码运行，请使用 AutoHotkey v1；脚本不是按 v2 语法写的。

