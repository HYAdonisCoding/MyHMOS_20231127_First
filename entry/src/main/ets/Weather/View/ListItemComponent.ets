import { Fruit } from '../model/DataModel'
@Component



export struct ListItemComponent {
  item: Fruit
  build(){
    Row() {
      if (parseInt(this.item.id) <= 3) {
        Column() {
          Row() {
            Text(this.item.id)
              .fontSize(14)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)

          }
          .width(24)
          .height(24)
          .backgroundColor('#007dff')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)

        }
        .width('30%')
        .alignItems(HorizontalAlign.Start)
      } else {
        Column() {
          Text(this.item.id)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .width(24)
            .textAlign(TextAlign.Center)

        }
        .width('30%')
        .alignItems(HorizontalAlign.Start)

      }


      Text(this.item.name)
        .width('50%')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(this.item.vote)
        .fontSize(16)
        .width('20%')
        .fontWeight(FontWeight.Bold)
    }
    .height(47)
    .width('100%')
  }
}