import { Carrier } from './BaseCarrier'

/**
 * 音频源
 */
export class Audio extends Carrier {
  /** 自定义字符集名称(仅适用于本地书籍) */
  charset?: string = ''
  /** 阅读设置 */
  readConfig?: object = {}
}