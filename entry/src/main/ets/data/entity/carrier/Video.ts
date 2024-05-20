import { Carrier } from './BaseCarrier'

/**
 * 视频源
 */
export class Video extends Carrier {
  /** 自定义字符集名称(仅适用于本地书籍) */
  charset?: string = ''
  /** 阅读设置 */
  readConfig?: object = {}
}