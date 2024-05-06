import BaseContentRule from './rule/BaseContentRule';
import BaseExploreRule from './rule/BaseExploreRule';
import BaseInfoRule from './rule/BaseInfoRule';
import BaseReviewRule from './rule/BaseReviewRule';
import BaseSearchRule from './rule/BaseSearchRule';
import BaseSourceRule from './rule/BaseSourceRule';
import BaseTocRule from './rule/BaseTocRule';

/**
 * 基本源
 */
export default class BaseSource<SourceRule extends BaseSourceRule,
SearchRule extends BaseSearchRule,
ExploreRule extends BaseExploreRule,
InfoRule extends BaseInfoRule,
TocRule extends BaseTocRule,
ContentRule extends BaseContentRule,
ReviewRule extends BaseReviewRule> {
  /**
   * id
   */
  id: string = '';
  /**
   * 类型，0 文本，1 音频, 2 图片, 3 文件（指的是类似知轩藏书只提供下载的网站）
   */
  sourceType: number = 0;
  /**
   * 手动排序编号
   */
  customOrder: number = 0;
  /**
   * 是否启用
   */
  enable: boolean = true;
  /**
   * 是否启用发现
   */
  enabledExplore: boolean = true;
  /**
   * 启用okhttp CookieJAr 自动保存每次请求的cookie
   */
  enabledCookie: boolean = true;
  /**
   * 最后更新时间，用于排序
   */
  lastUpdateTime: number = 0;
  /**
   * 响应时间，用于排序
   */
  respondTime: number = 180000;
  /**
   * 智能排序的权重
   */
  weight: number = 0;
  /**
   * 源的基础规则
   */
  sourceRule: SourceRule = null;
  /**
   * 搜索规则
   */
  ruleSearch: SearchRule = null;
  /**
   * 发现规则
   */
  ruleExplore: ExploreRule = null;
  /**
   * 信息页规则
   */
  ruleBookInfo: InfoRule = null;
  /**
   * 目录页规则
   */
  ruleToc: TocRule = null;
  /**
   * 正文页规则
   */
  ruleContent: ContentRule = null;
  /**
   * 段评规则
   */
  ruleReview: ReviewRule = null;
}