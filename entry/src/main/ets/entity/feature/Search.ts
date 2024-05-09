import { ESourceType } from '../../../common/TsType';

/**
 * 搜索关键字
 */
export class SearchKeyword {
  /** 搜索关键词 */
  word: string = ''
  /** 使用次数 */
  usage: number = 1
  /** 最后一次使用时间 */
  lastUseTime: number = Date.now()
}

/**
 * 搜索结果
 */
export class SearchResult {
  /**
   * 书源id
   */
  sourceId: string = ''
  /**
   * 书源名称
   */
  sourceName: string = ''
  /**
   * 书名
   */
  name: string = ''
  /**
   * 作者
   */
  author: string = ''
  /**
   * 分类
   */
  kind?: string = ''
  /**
   * 封面URL
   */
  coverUrl?: string = ''
  /**
   * 简介内容
   */
  intro?: string = ''
  /**
   * 类型,详见BookType
   */
  type: ESourceType = ESourceType.Text
  /**
   * 最新章节标题
   */
  lastChapterTitle?: string = ''
  /**
   * 字数
   */
  wordCount?: string = ''
  /**
   * 目录URL
   */
  tocUrl: string = ''
  /**
   * 开始查询的时间
   */
  requestTime: string = ''
  /**
   * 接受响应的时间
   */
  respondTime: string = ''
  /**
   * 书源排序
   */
  originOrder: number = 0
  /**
   * 自定义书籍变量信息(用于书源规则检索书籍信息)
   */
  variable?: string = ''
}