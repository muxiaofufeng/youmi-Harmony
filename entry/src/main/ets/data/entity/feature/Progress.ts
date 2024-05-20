/**
 * 阅读进度
 */
export class Progress {
  /** 名称: 书名, 漫画名, 视频名等等 */
  name: string = ''
  /** 作者 */
  author: string = ''
  /** 当前章节名称 */
  durChapterTitle?: string = ''
  /** 当前章节索引 */
  durChapterIndex: number = 0
  /** 当前阅读的进度(首行字符的索引位置) */
  durChapterPos: number = 0
  /** 最近一次阅读书籍的时间(打开正文的时间) */
  durChapterTime: number = Date.now()
}