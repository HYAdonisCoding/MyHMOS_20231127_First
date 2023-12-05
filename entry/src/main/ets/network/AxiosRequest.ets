import axios from '@ohos/axios'
import { AxiosResponse, InternalAxiosRequestConfig, AxiosError } from '@ohos/axios'

const key = 'a546dd6657824b6882ec461255642293'

axios.defaults.baseURL = 'https://devapi.qweather.com/v7/weather/'

// 添加请求拦截器
axios.interceptors.request.use((config:InternalAxiosRequestConfig) => {
  // 对请求数据做点什么
  config.params.key = key
  return config;
}, (error:AxiosError) => {
  // 对请求错误做些什么
  return Promise.reject(error);
});


// 添加响应拦截器
axios.interceptors.response.use((response:AxiosResponse)=> {
  // 对响应数据做点什么
  return response;
}, (error:AxiosError)=> {
  // 对响应错误做点什么
  console.log('Axios response error:', error);
  return Promise.reject(error);
});

export default axios