import { BaseRule } from './BaseRule';

/**
 * 详情页规则
 */
export class BaseInfoRule extends BaseRule {
  /** 预处理规则 */
  init?: string = '';
  /** 最新章节 */
  lastChapter?: string = '';
  /** 更新时间 */
  updateTime?: string = '';
  /** 目录URL */
  tocUrl?: string = '';
  /** 下载URL规则 */
  downloadUrls?: string = '';
  /** 允许修改作者 */
  //canReName?: string = '';
  /** 字数 */
  //wordCount?: string = '';
}