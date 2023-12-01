@Component

export struct ListHeaderComponent {

  build(){
    Row() {
      // Image($r(app.media.ic_public_back))
      Text('排名')
        .width('30%')
        .fontSize(14)
        .fontColor('#989a9c')
      Text('种类')
        .width('50%')
        .fontSize(14)
        .fontColor('#989a9c')
      Text('得票数')
        .width('20%')
        .fontSize(14)
        .fontColor('#989a9c')
    }
    .width('90%')
    .padding(15)
  }
}