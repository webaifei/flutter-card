# 卡小秘 flutter 版本

## todo

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