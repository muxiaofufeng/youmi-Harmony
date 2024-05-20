import { BaseRule } from '../source/BaseRule'

/**
 * 阅读历史
 */
export class History extends BaseRule {
  id: string = ''
  /** 源id */
  sourceId: string = ''
  /** 源名称 */
  sourceName: string = ''
  /** 阅读总时长 */
  totalTime: number = 0
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