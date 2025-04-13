# 键盘鼠标增强系统

这是一个使用 AutoHotkey v2 编写的键盘鼠标增强系统，提供了多种功能来提高工作效率。

## 主要功能

1. **鼠标滚轮模拟**：按住 Space 键移动鼠标可以模拟滚轮滚动
2. **键盘控制鼠标**：使用 CapsLock + IJKL 控制鼠标移动
3. **画布平移缩放**：使用 CapsLock + WASD/QE 进行画布平移和缩放
4. **快捷导航**：使用 Space/Alt + 方向键进行快速导航和文本选择
5. **任务栏音量控制**：鼠标悬停在任务栏上滚动滚轮可调整音量

## 文件结构

- `startup.ahk`：启动脚本，系统入口点
- `main_hotkeys.ahk`：主脚本，包含通用热键
- `config.ahk`：用户配置文件
- `MouseDelta.ahk`：鼠标输入处理类
- `scroll_wheel_enhancer.ahk`：滚轮模拟功能
- `keyboard_mouse.ahk`：键盘控制鼠标功能
- `canvas_panning.ahk`：画布平移和缩放功能

## 安装和使用

1. 确保已安装 AutoHotkey v2
2. 下载或克隆本仓库
3. 运行 `startup.ahk` 启动系统
4. 可以在 `config.ahk` 中调整配置参数

## 快捷键参考

### 通用热键
- `Space + 方向键`：导航和选择
- `Alt + JKLI`：模拟方向键
- `CapsLock + IJKL`：控制鼠标移动
- `CapsLock + UOF`：鼠标按键操作
- `CapsLock + WASD`：画布平移
- `CapsLock + QE`：画布缩放
- `Space + LButton/RButton`：浏览器前进/后退
- `Space + H`：撤销并按Esc
- `RAlt + L`：锁定工作站

### 配置热键
- `CapsLock + -/+`：调整滚动速度
- `Esc + F4`：切换鼠标加速度
- `Esc + F5`：切换拖拽速度

## 自定义

可以在 `config.ahk` 中修改以下配置：
- `ShiftKey`：切换到滚轮模式的键
- `ScaleFactor`：滚动速度
- `MouseSpeed`/`MouseSleep`：鼠标移动速度和延迟
- `MouseStartSpeed`/`MouseAcceleration`：鼠标起始速度和加速度
- `DragSpeed`：画布拖拽速度 