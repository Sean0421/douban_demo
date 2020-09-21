豆瓣主页实现Flutter版
=====

简介
----
这是一个用Flutter实现豆瓣主页的简易App
****
### 主要实现功能有：<br>
#### 1.自定义屏幕适配（按750*1334等比例适配）（为了便于适配简化使用增加extension扩展了int,double方法）<br>
#### 2.服务器数据的网络请求<br>
#### 3.自定义虚线组件（dashed_line.dart）
#### 4.自定义根据评分显示对应的星星数量的组件(star_rating.dart )

### 第三方依赖：
|名称及版本|作用|
|---|---
|dio:^3.0.9|网络请求
|provider:^4.3.2|状态管理
|event_bus:^1.1.1|事件总线
