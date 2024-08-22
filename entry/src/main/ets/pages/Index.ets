import {createInstance, EventTags} from "eyeofcloud/src/packages/eyeofcloud-sdk/lib/index.node"
import http from '@ohos.net.http';
interface attribute {
  logged_in: boolean;
};

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
      Button() {
        Text("点击")
          .fontSize(20)
          .fontColor(Color.White)
      }
      .type(ButtonType.Capsule)
      .width('40%')
      .height('5%')
      .onClick(() => {
        // this.onRequest()
        let eyeofcloudClient = createInstance({sdkKey: "1000563_ebf080bb426e7555"})
        eyeofcloudClient?.onReady().then(() => {
          let attributes: attribute = { logged_in: true };
          let user = eyeofcloudClient?.createUserContext("3", attributes)
          try {
            let decision = user?.decide("buy")
            let tags: EventTags = {name: "a"}
            user?.trackEvent("buy", tags)
            this.message = decision?.variationKey as string
          }catch (e) {
            console.log(e)
          }
        })
      })
    }
    .width("100%")
    .height("100%")
    .margin({top: "300"})
  }


}