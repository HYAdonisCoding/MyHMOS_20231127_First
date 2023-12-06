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
import axios from '../AxiosRequest'
import { AxiosResponse } from '@ohos/axios'



// 实时天气
export function getNowWeather(location: number): Promise<AxiosResponse> {
  return axios({
    url: 'now',
    params: {
      location: location,
    }
  })
}

// 7日天气
export function get7dWeather(location: number): Promise<AxiosResponse> {
  // 每一个httpRequest对应一个HTTP请求任务，不可复用
  return axios({
    url: '7d',
    params: {
      location: location,
    }
  })
}

// 24小时天气预报
export function get24hWeather(location: number): Promise<AxiosResponse> {
  // 每一个httpRequest对应一个HTTP请求任务，不可复用
  return axios({
    url: '24h',
    params: {
      location: location,
    }
  })
}



