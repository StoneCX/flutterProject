# 说明
公司Flutter基础功能模版项目

## Flutter 的安装
https://flutter.cn/docs/get-started/install

## get_cli的安装
https://github.com/jonataslaw/get_cli

## Getx 文档
https://github.com/jonataslaw/getx/blob/master/README.zh-cn.md

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



## GetX路由管理
```dart
// Using a widget function instead of a widget fully guarantees that the widget and its controllers will be removed from memory when they are no longer used.
// using: "Get.to(() => Page())" instead of "Get.to(Page())".
Get.off(ThirdPage),//移除页面栈中的第一个页面，并进入下个页面
Get.offAll(ThirdPage),//移除页面栈中所有的页面，进入下个页面
//不建议使用的 Get.to(SecondPage());
Get.to(() => SecondPage()) //进入下个页面
```

## useful utils

- GetPlatform.isAndroid
- GetPlatform.isIOS

// Equivalent to : MediaQuery.of(context).size.height,
// but immutable.
- Get.height
- Get.width
```dart

// Equivalent to : MediaQuery.of(context).size.height,
// but immutable.
Get.height
Get.width
/// booleans:

final flag = false.obs;

// switches the value between true/false
flag.toggle();


class User {
    String name, last;
    int age;
    User({this.name, this.last, this.age});

    @override
    String toString() => '$name $last, $age years old';
}

final user = User(name: 'John', last: 'Doe', age: 33).obs;

// `user` is "reactive", but the properties inside ARE NOT!
// So, if we change some variable inside of it...
user.value.name = 'Roi';
// The widget will not rebuild!,
// `Rx` don't have any clue when you change something inside user.
// So, for custom classes, we need to manually "notify" the change.
user.refresh();

// or we can use the `update()` method!
user.update((value){
  value.name='Roi';
});
```