import { Carrier } from './BaseCarrier'

/**
 * 书籍信息
 */
export class Book extends Carrier {
  /** 自定义字符集名称(仅适用于本地书籍) */
  charset?: string = ''
  /** 字数 */
  wordCount?: string = ''
  /** 阅读设置 */
  readConfig?: object = {}
}