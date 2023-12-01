import App from '@system.app'
import { Fruit, rankData1, rankData2} from '../model/DataModel'
import {TitleComponent} from '../View/TitleComponent'
import {ListHeaderComponent} from '../View/ListHeaderComponent'
import {ListItemComponent} from '../View/ListItemComponent'
@Entry
@Component
struct Index {

  fruitData: Array<Fruit> = rankData1
  fruitData2: Array<Fruit> = rankData2
  @State isSwitchData: boolean = true
  @State message: string = 'Hello World'
  @State count: number = 0

  build() {
    // Column() {
    //   Button('按钮')
    //     .onClick(() => {
    //       this.count += 1
    //       console.log('回调函数被执行了', this.count)
    //     })
    //   Text(this.count.toString())
    //     .fontSize(55)
    // }
    // .width('100%')
    // .height('100%')
    // .backgroundColor('#f2fff2')
    Column() {
      // 导航栏
      TitleComponent({isSwitchData: $isSwitchData})

      // 表头
      ListHeaderComponent()

      // 列表
      this.RankList()

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f1f2f5')
  }
  @Builder RankList() {
    Column() {
      List() {
        ForEach(this.isSwitchData ? this.fruitData: this.fruitData2, (item: Fruit) => {
          ListItem() {
            ListItemComponent({item: item})

          }
        })

      }
      .width('90%')
      .padding(15)
      .backgroundColor(Color.White)
      .borderRadius(18)

    }
  }
}