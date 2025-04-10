import {
  Client,
  createInstance,
  EventTags,
  UserAttributes,
  setDatafileUrlTemplate,
  setEventUrl
} from "eyeofcloud/src/packages/eyeofcloud-sdk/lib/index.node"

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  eyeofcloudClient: Client | null | undefined = null
  aboutToAppear(): void {
    setDatafileUrlTemplate("https://cdn.eyeofcloud.com/datafiles/%s.json")
    setEventUrl("https://event.eyeofcloud.com/v1/events")
    this.eyeofcloudClient = createInstance({sdkKey: "1000122_2e2d7fbdea1afc51"})
  }

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
        this.eyeofcloudClient?.onReady().then(() => {
          let attributes: UserAttributes = {city: "南京"};
          let user = this.eyeofcloudClient?.createUserContext("user123", attributes)
          try {
            let decision = user?.decide("buy")
            let tags: EventTags = {name: "eventTags"}
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