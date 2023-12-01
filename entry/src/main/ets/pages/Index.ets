import App from '@system.app'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State count: number = 0
  build() {
    Column() {
      Button('按钮')
        .onClick(() => {
          this.count += 1
          console.log('回调函数被执行了', this.count)
        })
      Text(this.count.toString())
        .fontSize(55)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f2fff2')
    // Column()
    //   // 导航栏
    //   Row() {
    //     Row() {
    //       Image($r('app.media.ic_public_back'))
    //         .width(24)
    //         .height(24)
    //         .margin({ right: 10 })
    //
    //       Text('排行榜')
    //         .fontSize(22)
    //     }
    //
    //     Row() {
    //       Image($r('app.media.loading'))
    //         .width(24)
    //         .height(24)
    //     }
    //     .width('50%')
    //     .height('100%')
    //     .justifyContent(FlexAlign.End)
    //
    //   }
    //   .height(47)
    //   .width('100%')
    //   .padding(15)
    //
    //   // 表头
    //   Row() {
    //     // Image($r(app.media.ic_public_back))
    //     Text('排名')
    //       .width('20%')
    //       .fontSize(14)
    //       .fontColor('#989a9c')
    //     Text('种类')
    //       .width('50%')
    //       .fontSize(14)
    //       .fontColor('#989a9c')
    //     Text('得票数')
    //       .width('30%')
    //       .fontSize(14)
    //       .fontColor('#989a9c')
    //   }
    //   .width('100%')
    //   .padding(15)
    //
    //   // 列表
    //   List() {
    //     ListItem() {
    //       Row() {
    //         // Image($r(app.media.ic_public_back))
    //         Text('1')
    //           .width('20%')
    //         Text('苹果')
    //           .width('50%')
    //         Text('12368')
    //           .fontSize(16)
    //           .width('30%')
    //           .fontWeight(FontWeight.Bold)
    //       }
    //     }
    //     .height(47)
    //     .width('100%')
    //   }
    //   .width('90%')
    //   .padding(15)
    //   .backgroundColor(Color.Green)
    //
    //
    // }
    // .width('100%')
    // .height('100%')
    // .backgroundColor('#f5f5f5')
  }
}