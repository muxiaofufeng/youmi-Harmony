/**
 * 书签
 */
export class Mark {
  /** 创建时间 */
  time: number = Date.now()
  /** 书签名 */
  name: String = ''
  /** 书签作者 */
  author: String = ''
  /** 章节索引 */
  chapterIndex: number = 0
  /** 阅读进度 */
  chapterPos: number = 0
  /** 章节名 */
  chapterName: String = ''
  /** 书签所在的文本 */
  text: String = ''
  /** 书签内容 */
  content: String = ''
}