import { ESourceType } from '../../../../common/TsType';
import { Progress } from '../feature/Progress';
import { BaseRule } from '../source/BaseRule';

/**
 * 基本载体
 */
export class BaseCarrier extends Progress implements BaseRule {
  id: string = ''
  /**  源id */
  sourceId: string = ''
  /** 源名称  */
  sourceName: string = ''
  /** 类型,详见BookType */
  type: ESourceType = ESourceType.Text
  /** 分组(SourceGroup)的id的集合 */
  groups: string[] = [];
  /** 刷新书架时能否更新书籍信息 */
  canUpdate: boolean = true
  /** 手动排序 */
  order: number = 0
  /** 书源排序 */
  originOrder: number = 0
  /** 自定义书籍变量信息(用于书源规则检索书籍信息) */
  variable?: string = ''
  /** 同步时间 */
  syncTime: number = 0
  /** 详情页URL */
  infoUrl: string = ''
  /** 目录URL */
  tocUrl: string = ''
  /** 详情页HTML */
  infoHtml?: string = ''
  /** 目录页HTML */
  tocHtml?: string = ''
}

/**
 * 载体
 */
export class Carrier extends BaseCarrier {
  /** 封面URL(用户修改) */
  customCoverUrl?: string = ''
  /** 简介内容(用户修改) */
  customIntro?: string = ''
  /** 最新章节标题 */
  lastChapterTitle?: string = ''
  /** 最新章节标题更新时间 */
  latestChapterTime: number = Date.now()
  /** 最近一次更新书籍信息的时间 */
  lastCheckTime: number = Date.now()
  /** 最近一次发现新章节的数量 */
  lastCheckCount: number = 0
  /** 目录总数 */
  totalChapterNum: number = 0
}