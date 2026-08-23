# RoboMaster 机器人算法教程（LaTeX 重构版）

本分支将原来的单文件计算机视觉教程重构为一套面向 RoboMaster 算法组的系统教材。新版不再以“目标检测模型百科”为主线，而是围绕机器人闭环建立知识结构：

> 硬件与工具 → 数学与建模 → 2D 感知 → 3D 感知与 SLAM → 控制 → 规划与决策 → 系统集成 → 赛季案例

原始长篇 Markdown 暂时保留，作为历史资料与迁移来源；新内容统一位于 [`book/`](book/) 中。

## 构建 PDF

推荐使用 TeX Live 2024 或更新版本，并确保安装 XeLaTeX、latexmk 与 biber。

```bash
make pdf
```

生成文件位于 `book/build/main.pdf`。清理中间产物：

```bash
make clean
```

也可以直接进入 `book/`：

```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error -outdir=build main.tex
```

每次提交涉及书稿源文件时，GitHub Actions 会执行同样的构建并上传 PDF artifact。

## 当前阶段

- 已建立可编译的中文 LaTeX 书稿、分章结构、参考文献与 CI。
- 已写入系统总览、硬件原理、工程工具链和数学建模的首轮正文。
- 其余章节先固定学习目标、前置依赖和承转关系，再逐章迁移与重写。
- 2025/2026 赛季案例只采用官方规则中可核验的内容；未正式发布或仍可能修订的条目会明确标注版本和证据等级。

详细的删改与迁移矩阵见 [`MIGRATION_PLAN.md`](MIGRATION_PLAN.md)，协作规范见 [`CONTRIBUTING.md`](CONTRIBUTING.md)。

## 目录约定

```text
book/
├── main.tex                 # 唯一书稿入口
├── config/                  # 样式与命令
├── frontmatter/             # 前言与阅读指南
├── chapters/                # 每章一个 tex 文件
├── appendices/              # 附录
├── assets/                  # 新版筛选后的静态插图
└── references.bib           # 可追溯参考文献
```

## 内容原则

1. 以机器人任务中的变量、接口、误差和闭环为组织中心。
2. 首次出现的符号必须定义，结论必须说明适用前提。
3. 传统图像处理只保留后续几何、标定、特征匹配和工程调试真正需要的部分。
4. 目标检测只讲统一问题形式、数据与指标、代表性架构和部署决策，不再罗列过时模型族。
5. 将图像滤波、状态估计和控制器严格区分，再通过概率模型和状态空间统一起来。
6. AI/agent 工具用于加速检索、编码、测试与复盘，但生成结果必须经过来源核验、构建测试和人工审查。

