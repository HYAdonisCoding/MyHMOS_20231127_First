/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import CommonConstants from '../common/constants/CommonConstants'
import NoteInfo from '../common/bean/NoteInfo'
import { EditTitle } from '../view/EditTitle'
import DateUtil from '../common/utils/DateUtil'
import router from '@ohos.router'
import { NoteInfoTable } from '../common/database/NoteInfoTable'

@Entry
@Component
struct PageEdit {
  @State noteInfo: NoteInfo = router.getParams()['noteInfo']
  @State oldNoteInfo: NoteInfo = { // 笔记信息
    id: 1,
    title: "",
    content: "",
    date: "",
    imageArr: ''
  }
  @State change: boolean = false;
  @State imageArray: string [] = this.noteInfo.imageArr.length > 5 ? JSON.parse(this.noteInfo.imageArr): []
  dbApi: NoteInfoTable = new NoteInfoTable()
  
  isChange() {
    this.change = this.oldNoteInfo.title != this.noteInfo.title
    || this.oldNoteInfo.content != this.noteInfo.content
    || this.oldNoteInfo.imageArr != this.noteInfo.imageArr
  }

  build() {
    Column() {
      // 标题栏
      EditTitle({
        change: $change,
        back: (e) => {
          // todo 返回
          router.back()
        },
        edit: (e) => {
          this.change = false
          this.noteInfo.date = DateUtil.getCurrentTime()
          // todo 更新笔记
          this.dbApi.updateNote(this.noteInfo, (isDone) => {
            if (isDone) {
              router.pushUrl({
                url: "Notebook/pages/Index",
              })
            }
          })
        }
      })
      //
      Text(this.noteInfo.date + " | " + (this.noteInfo.content.length) + '字')
        .margin({
          top: 29, bottom: 13, left: 2
        })
        .fontColor($r('app.color.black_40'))
        .fontSize(CommonConstants.FONT_SIZE_17)
      // 笔记标题
      TextInput({
        text: this.noteInfo.title,
        placeholder: $r('app.string.input_title')
      })
        .placeholderColor($r('app.color.black_40'))
        .fontSize(CommonConstants.FONT_SIZE_19)
        .borderWidth({ bottom: 1 })
        .borderColor($r('app.color.black_10'))
        .padding({
          left: 5
        })
        .backgroundColor(Color.Transparent)
        .height(58)
        .borderRadius(0)
        .margin({ bottom: 20 })
        .width('100%')
        .onChange((str) => {
          this.noteInfo.title = str;
          this.isChange();
        })
      // 笔记正文
      TextArea({
        text: this.noteInfo.content,
        placeholder: $r('app.string.input_content')
      })
        .placeholderColor($r('app.color.black_40'))
        .padding({ left: 5 })
        .backgroundColor(Color.Transparent)
        .borderRadius(0)
        .height(160)
        .margin({ top: 10 })
        .onChange((str) => {
          this.noteInfo.content = str;
          this.isChange();
        })

      // 图片
      Grid() {
        ForEach(this.imageArray , (src) => {
          GridItem() {
            Image(src)
              .width(98)
              .height(98)
          }
        })
        GridItem() {
          Image($r("app.media.icon_add_image"))
            .width(98)
            .height(98)
            .onClick((e) => {
              this.selectPicture()
            })
        }
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(20)
      .rowsGap(20)
      .width(334)
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .padding({ left: CommonConstants.MARGIN_2, right: CommonConstants.MARGIN_2 })
    .backgroundColor($r('app.color.background'))
    .alignItems(HorizontalAlign.Start)
  }
  selectPicture() {
    let startParmameter = {
      bundleName:"com.ohos.photos",
      abilityName: "com.ohos.photos.MainAbility",
      parameters: {
        uri: "singleselect"
      }
    };
    globalThis.context.startAbilityForResult(startParmameter).then((result) => {
      console.info(`startAbilityForResult Promise.resolve is called, result.resultCode =  ${JSON.stringify(result)}`)
      let want = result['want'];
      console.info(`test select single ${JSON.stringify(want)}`);
      if (want != null && want != undefined) {
        let param = want['parameters'];
        console.info(`test select single ${JSON.stringify(param)}`);
        if (param != null && param != undefined) {
          let uri = param['select-item-list'];
          console.info(`test select single ${uri[0]}`);
          this.imageArray = uri
          this.noteInfo.imageArr = JSON.stringify(uri)
          this.isChange()

        }
      }
    }, (error) => {
      console.info(`startAbilityForResult Promise.Reject is called, error.code = ${error.code}`)
    })
  }
}