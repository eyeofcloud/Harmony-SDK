# Harmony-SDK
Harmony SDK 编辑包以及使用说明

# 安装 Harmony-SDK

Harmony SDK目前通过外部依赖包引入项目。`eyeofcloud`包是eyeofcloud静态共享包

在项目入口模块(默认是entry模块)下创建libs文件夹，将外部依赖包放入libs文件夹

下面是导入外部依赖包配置：


oh-package

```
dependencies {
    "eyeofcloud": "file:./libs/eyeofcloud.har"
}
```

# 使用Harmony-SDK

## 初始化SDK

使用`createInstance`方法初始化开发工具包，并实例化公开API方法

## 示例用法

```
import { createInstance, 
         UserAttributes } from "eyeofcloud/src/packages/eyeofcloud-sdk/lib/index.node"

const eyeofcloudClient = createInstance({   
    sdkKey: "<Your_SDK_KEY>" // Provide the sdkKey of your desired environment here 
}); 

eyeofcloudClient.onReady().then(() => {   
    var attributes: UserAttributes = { city: "南京" };   
    var user = eyeofcloudClient.createUserContext('user123', attributes);    
    var decision = user.decide('Your flagKey');   
    var variationKey = decision['variationKey'];    
    if (variationKey === null) {     
        console.log(' decision error: ', decision['reasons']);   
    }    
    var enabled = decision['enabled'];    

    // Track an evnet
    user.trackEvent('Your eventName'); // Track an event   
});
```
