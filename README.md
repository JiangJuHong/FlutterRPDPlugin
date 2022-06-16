# rpd_plugin

Flutter RPD(Rapid plug-in development)，寓意为“Flutter快速开发插件 的插件”，解决现在Flutter插件开发时冗余度代码过高，效率过低的问题。欢迎 Issues and PR

## Getting Started

## 集成

0. 初始化你的 Flutter Plugin
0. 修改 pubspec.yaml 文件
    ````yaml
    dependencies:
      ......
      rpd_plugin:
        git:
          url: https://github.com/JiangJuHong/FlutterRPDPlugin
    ````

## 使用

### CommonUtil

#### 必传参数获取【CommonUtil.getParam<T>(MethodCall,Result,String)】
> 此内容于 ``2021/10/19`` 已不推荐使用，正式版本将移除，建议在 Flutter 层做 assert 以及 required 判定，实现层不参与参数校验

通过调用方法 `getParam<T>(MethodCall,Result,String)` 在 \[MethodCall\] 中获得 \[String\] 参数，如果没有获得内容，则直接抛出异常  
Java:

````java
import top.huic.rpd_plugin.util.CommonUtil;

private void init(MethodCall methodCall,Result result){
    String appid=CommonUtil.getParam(methodCall,result,"appid");
    Boolean enabledLogPrint=CommonUtil.getParam(methodCall,result,"enabledLogPrint");
    Integer logPrintLevel=CommonUtil.getParam(methodCall,result,"logPrintLevel");
    ......
}
````

Swift:

````
import rpd_plugin.RpdPlugin
.....

public func `init`(call: FlutterMethodCall, result: @escaping FlutterResult) {
    if let appid = CommonUtil.getParam(call: call, result: result, param: "appid") as? String,
       let enabledLogPrint = CommonUtil.getParam(call: call, result: result, param: "enabledLogPrint") as? Bool,
       let logPrintLevel = CommonUtil.getParam(call: call, result: result, param: "logPrintLevel") as? Int {
        ......
    }
}
````

#### 方法全自动调用

方法调用通过反射实现，因此你不需要编写 switch 、if 等来判断 `call.method`，如果该方法，你可以很好的将底层方法和Flutter方法一一对应.  
如果要使用，你只需要在 `MethodCallHandler` 的处理块中添加以下代码:
> 解决场景：flutter to android 和 flutter to ios 方法映射总是很麻烦，次方法避免了使用冗余的 switch
* Java:

  handler 回调中编写:
   ````kotlin
   CommonUtil.invokeMethod(this, call.method, call, result);
   ````
  动态方法的格式为:
   ````kotlin
   fun 方法名(@NonNull call: MethodCall, @NonNull result: Result) {}
   ````
  > 其中的方法参数必须为 ```MethodCall```和``Result``
* Swift:

  handler 回调中编写:
   ```` swift
    CommonUtil.invokeMethod(target: self, method: call.method, call: call, result: result)
   ````
  动态方法的格式为:
   ````
   @objc
   private func 方法名(call: FlutterMethodCall, result: @escaping FlutterResult) {}
   ````
  > 其中的 ``@objc`` ``call: FlutterMethodCall``,``result: @escaping FlutterResult`` 为固定格式，禁止编辑
  
### 统一流监听器
待实现

### 统一枚举
待实现（代替原有 enum 功能，实现增强枚举功能(枚举绑定值)）