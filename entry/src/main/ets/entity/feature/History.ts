/**
 * 阅读历史
 */
export class History {
  id: string = ''
  /** 源id */
  sourceId: string = ''
  /** 源名称 */
  sourceName: string = ''
  /** 名称: 书名, 漫画名, 视频名等等 */
  name: string = ''
  /** 作者 */
  author: string = ''
  /** 分类 */
  kind?: string = ''
  /** 简介内容 */
  intro?: string = ''
  /** 阅读总时长 */
  totalTime: number = 0
  /** 封面URL */
  coverUrl?: string = ''
  /** 最后一次阅读时间 */
  lastTime: number = 0
  /** 最后一次章节索引 */
  lastChapterIndex: number = 0
  /** 章节索引 */
  chapterIndex: number = 0
  /** 阅读进度 */
  chapterPos: number = 0
  /** 章节名 */
  chapterName: String = ''
  /** 详情页URL */
  infoUrl: string = ''
}