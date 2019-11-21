# 卡小秘 flutter 版本

## todo
2. 网络请求loading封装

- UI
  - [ ] 开屏页
  - [ ] 登录页
  - [ ] 首页
  - [ ] 我的页面
  - [ ] 添加新卡页
  - [ ] 卡列表
- 状态管理
  - [x] InheritedWidget
      ```
      /// 依赖InheritedWidget 类来实现
      /// 1. 需要持有共享状态的组件继承InheritedWidget
      /// 2. 提供一个获取该组件实例的静态方法，同时也可以提供共享状态 CRUD 操作
      /// 3. 在子组件中通过静态方法获取到当前子组件中的祖先组件实例 从而获取共享状态和对应操作
      ```
  - [ ] InheritedNotifier, InheritedModel
  - [ ] provider
  
  > 无状态、短时状态以及应用级状态
  
  

- 网络请求
  - [ ] dio

  
  

  ## 其他
  1. 可以使用IconData来自定义自己的Icon（需要字体库）可以结合阿里的Iconfont
    




### 问题

   1. 全部都是组件的思想 还有有些问题
    - 嵌套噩梦，不要说组件拆分， 组件拆分的前提是复用、复用，不是为了解决代码阅读问题。很容易造成组件爆炸结果。
    希望后面能提供jsx类的语法
   2. Hot reload 为开发提供了极大的便利，目前还存在一些问题，有时候无法生效。
    
### 
```$xslt

oktoast: ^2.1.7
  pull_to_refresh: ^1.5.6
  flutter_swiper: ^1.1.6
  cached_network_image: ^1.1.1
  # 类iOS侧滑菜单
  flutter_slidable: 0.5.3
  # 谁用谁闪亮
  shimmer: ^1.0.0
  # 识别图片的主要颜色
#  palette_generator: ^0.2.0
  # 更新展示支持mark_down
  flutter_markdown: ^0.2.0
  flare_flutter: ^1.5.9

  # third_app
  url_launcher: ^5.1.6 #启动第三方app
  share: 0.6.2+1 #分享
  launch_review: ^2.0.0
  open_file: ^2.0.3
``` 



### PPT

两次
#### flutter
0. 从多端框架说起
    - 什么是跨平台
    - 为啥需要
    - 怎么实现的（几种方案）
    
1. flutter是啥？
基于dart，（起初用来代替javascript，nodejs的强势崛起）
dart的野心勃勃：dart-web、flutter、dart-vm
2. 优势
    - Fast Development
        - 开发过程中基于Dart JIT 编译模式
        - 内置了大量丰富的组件
        - 一套代码同时兼容多端（IOS、Android、Fuchsia）
        
    - Expressive and Flexible UI
    
    - Native Performance
        - 媲美原生的性能表现
        
3. talk is cheap, show me code
   - Hot reload
        - 有些修改无法更新
        - 有时候不怎么好使
        - 重新启动（也很快，通常小于1s）
        - 简单说下 热更新的原理：snapshot,对比js，android等
   - 内置组件
4. flutter 架构（跨平台、性能）
   

5. 如此好，怎么用
   > 总的来说，成本比较高
   - 学习一门新的语言 Dart
   - 学习flutter
   - 搭建平台相关能力的package库：相册、OCR、上报、等等
   - 和现有app混合开发方案
   - 发布、构建系统
   - 线上稳定性监控系统
   - 热更新方案
  
   --------
   
   - 大型团队，分工明确，技术能力足够。
   - 小型团队持续学习，等待时机，框架、社区的足够成熟。


