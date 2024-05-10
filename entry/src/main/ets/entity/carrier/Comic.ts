import { Carrier } from './BaseCarrier'

/**
 * 漫画源
 */
export class Comic extends Carrier {
  /** 自定义字符集名称(仅适用于本地书籍) */
  charset?: string = ''
  /** 阅读设置 */
  readConfig?: object = {}
}