import { BaseRule } from './BaseRule';

/**
 * 基本列表规则
 */
export abstract class BaseListRule extends BaseRule {
  /** 列表URL地址: 搜索URL地址等等 */
  url?: string = '';
  /** 列表规则 */
  list?: string = '';
  /** 最新章节 */
  lastChapter?: string = '';
  /** 详情页URL */
  infoUrl?: string = '';
  /** 更新时间 */
  updateTime?: string = '';
  /** 字数 */
  //wordCount?: string = '';
}