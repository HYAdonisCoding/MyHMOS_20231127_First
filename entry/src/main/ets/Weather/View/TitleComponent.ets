@Component

export struct TitleComponent {
  @Link isSwitchData: boolean
  build(){
    Row() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .width(24)
          .height(24)
          .margin({ right: 18 })

        Text('排行榜')
          .fontSize(22)
      }
      .width('50%')
      .height('100%')
      .justifyContent(FlexAlign.Start)

      Row() {
        Image($r('app.media.loading'))
          .width(24)
          .height(24)
          .onClick(() => {
            this.isSwitchData = !this.isSwitchData
          })
      }
      .width('50%')
      .height('100%')
      .justifyContent(FlexAlign.End)

    }
    .height(47)
    .width('100%')
    .padding({
      left: 26,
      right: 26
    })
    .margin({
      top: 10
    })
  }
}