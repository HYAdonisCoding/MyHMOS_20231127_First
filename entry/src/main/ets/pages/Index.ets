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
 

import SideBar from '../View/SideBar'
import SideBarContent from '../View/SideBarContent'
import SideBarContentBac from '../View/SideBarContentBac'
import { CityModel } from '../model/CityModel'
import { WeatherUiModel } from '../model/WeatherUiModel'
import utils from '../utils/utils'
import { getNowWeather, get7dWeather, get24hWeather } from '../network/api/AxiosApi'
import { NowWeatherModel, Weather7dModel, Weather24hModel } from '../model/NowWeatherModel'
import util from '@ohos.util'

@Entry
@Component
struct Index {
  @State isShowSideBar: boolean = false;
  @State @Watch('initData') selectCity: CityModel = { locationId: 101280601, locationName: '深圳' };
  @State weatherUiModel: WeatherUiModel = {
    nowTemp: 0,
    nowWeatherText: 0,
    tempMax: 0,
    tempMin: 0,
    category: 0,
    precip: 0,
    hourlyTemp: [],
    iconDays: [],
    date: '-月-日',
    day: '',
    dayArr: utils.getDayArr(),
    hoursArr: utils.getHoursArr(),
  };

  // 绘制界面
  build() {
    SideBarContainer(SideBarContainerType.Embed) {

      // 侧边栏
      SideBar({ selectCity: $selectCity, isShowSideBar: $isShowSideBar })

      if (this.isShowSideBar) {
        //灰底
        SideBarContentBac({ isShowSideBar: $isShowSideBar })
      } else {
        // 内容
        SideBarContent({ isShowSideBar: $isShowSideBar, selectCity: $selectCity, weatherUiModel: $weatherUiModel })
      }
    }
    .showControlButton(false)
    .showSideBar(this.isShowSideBar)
    .autoHide(false)
    .sideBarWidth(160)
    .width('100%')
    .onClick(() => {
      this.initData()
    })
  }

  // 声明周期接口
  aboutToAppear() {
    this.initData()
  }
  // 获取天气
  async initData() {
    let resultNow = await getNowWeather(this.selectCity.locationId)
    let weatherNow = resultNow.data as NowWeatherModel
    this.weatherUiModel.nowTemp = weatherNow.now.temp
    this.weatherUiModel.precip = weatherNow.now.precip
    this.weatherUiModel.nowWeatherText = weatherNow.now.text
    this.weatherUiModel.category = weatherNow.now.windDir

    // 获取24小时天气信息
    this.weatherUiModel.hoursArr = utils.getHoursArr()
    let result24h = await get24hWeather(this.selectCity.locationId)
    let weather24h = result24h.data as Weather24hModel
    for (let index = 0; index < 5; index++) {
      this.weatherUiModel.hourlyTemp.push({temp: weather24h.hourly[index].temp})
    }

    // 获取近7日天气信息
    this.weatherUiModel.dayArr = utils.getDayArr()
    let result7d = await get7dWeather(this.selectCity.locationId)
    let weather7d = result7d.data as Weather7dModel
    this.weatherUiModel.tempMax = weather7d.daily[0].tempMax
    this.weatherUiModel.tempMin = weather7d.daily[0].tempMin
    for (let index = 0; index < 5; index++) {
      this.weatherUiModel.iconDays.push({iconDay: weather7d.daily[index].iconDay + '.svg'})
    }

    // 日期信息
    this.weatherUiModel.date = utils.getDate()
    this.weatherUiModel.day = utils.getDay()

  }
}