# Harmony-SDK
Harmony SDK 编辑包以及使用说明

# 安装 Harmony-SDK

SDK依赖包在本项目示例libs文件夹下

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

使用时添加http权限

entry/src/main/module.json5

```
"requestPermissions": [
  {
    "name": "ohos.permission.INTERNET",
    "usedScene": {
      "when": "always"
    }
  }
]
```

# 示例用法

本SDK附带一个简易演示示例，可在DevEoc中打开本项目运行示例, 示例代码在pages文件夹下
