# Craftsman
 公司Flutter基础功能模版项目

## 用到的框架，工具，概念
- GetX 用于状态管理，路由管理，依赖管理
    - https://github.com/jonataslaw/getx/blob/master/README.zh-cn.md
    - 用于状态管理时有两种风格的使用方式，都会在项目中用到的地方做注释。
        - 简单式状态管理
            - 使用getbuilder 来管理状态包含大量对象的List。如果使用响应式将会生成大量GetStream，耗内存
        - 响应式状态管理
            - 除了上面的情况下都可使用响应式状态管理
- Get CLI 命令行工具用于快速生成项目目录结构。
    - https://github.com/jonataslaw/get_cli/blob/master/README-zh_CN.md
- 架构用到MVVM 下的clean 架构。或者快速生成模版文件
    - 哈哈
