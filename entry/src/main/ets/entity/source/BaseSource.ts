import { BaseContentRule } from './ContentRule';
import { BaseExploreRule } from './ExploreRule';
import { BaseInfoRule } from './InfoRule';
import { BaseReviewRule } from './ReviewRule';
import { BaseSearchRule } from './SearchRule';
import { BaseSourceRule } from './SourceRule';
import { BaseTocRule } from './TocRule';

/**
 * 基本源
 */
export class BaseSource {
  /** id */
  id: string = '';
  /** 类型，0 文本，1 音频, 2 图片, 3 文件（指的是类似知轩藏书只提供下载的网站） */
  sourceType: number = 0;
  /** 手动排序编号 */
  customOrder: number = 0;
  /** 是否启用 */
  enable: boolean = true;
  /** 是否启用发现 */
  enabledExplore: boolean = true;
  /** 启用okhttp CookieJAr 自动保存每次请求的cookie */
  enabledCookie: boolean = true;
  /** 最后更新时间，用于排序 */
  lastUpdateTime: number = 0;
  /** 响应时间，用于排序 */
  respondTime: number = 180000;
  /** 智能排序的权重 */
  weight: number = 0;
  /** 源的基础规则 */
  sourceRule?: BaseSourceRule = null;
  /** 搜索规则 */
  ruleSearch?: BaseSearchRule = null;
  /** 发现规则 */
  ruleExplore?: BaseExploreRule = null;
  /** 信息页规则 */
  ruleBookInfo?: BaseInfoRule = null;
  /** 目录页规则 */
  ruleToc?: BaseTocRule = null;
  /** 正文页规则 */
  ruleContent?: BaseContentRule = null;
  /** 段评规则 */
  ruleReview?: BaseReviewRule = null;
}