/**
 * 书籍信息
 */
import { ESourceType } from '../../../common/TsType'

export class Book {
  id: string = ''
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
   * 封面URL(用户修改)
   */
  customCoverUrl?: string = ''
  /**
   * 简介内容
   */
  intro?: string = ''
  /**
   * 简介内容(用户修改)
   */
  customIntro?: string = ''
  /**
   * 自定义字符集名称(仅适用于本地书籍)
   */
  charset?: string = ''
  /**
   * 类型,详见BookType
   */
  type: ESourceType = ESourceType.Text
  /**
   * 分组(SourceGroup)的id的集合
   */
  groups: string[] = [];
  /**
   * 最新章节标题
   */
  lastChapterTitle?: string = ''
  /**
   * 最新章节标题更新时间
   */
  latestChapterTime: number = Date.now()
  /**
   * 最近一次更新书籍信息的时间
   */
  lastCheckTime: number = Date.now()
  /**
   * 最近一次发现新章节的数量
   */
  lastCheckCount: number = 0
  /**
   * 书籍目录总数
   */
  totalChapterNum: number = 0
  /**
   * 当前章节名称
   */
  durChapterTitle?: string = ''
  /**
   * 当前章节索引
   */
  durChapterIndex: number = 0
  /**
   * 当前阅读的进度(首行字符的索引位置)
   */
  durChapterPos: number = 0
  /**
   * 最近一次阅读书籍的时间(打开正文的时间)
   */
  durChapterTime: number = Date.now()
  /**
   * 字数
   */
  wordCount?: string = ''
  /**
   * 刷新书架时能否更新书籍信息
   */
  canUpdate: boolean = true
  /**
   * 手动排序
   */
  order: number = 0
  /**
   * 书源排序
   */
  originOrder: number = 0
  /**
   * 自定义书籍变量信息(用于书源规则检索书籍信息)
   */
  variable?: string = ''
  /**
   * 阅读设置
   */
  readConfig?: object = {}
  /**
   * 同步时间
   */
  syncTime: number = 0
  /**
   * 详情页HTML
   */
  infoHtml?: string = ''
  /**
   * 目录页HTML
   */
  tocHtml?: string = ''
  /**
   * 详情页URL
   */
  infoUrl: string = ''
  /**
   * 目录URL
   */
  tocUrl: string = ''
}