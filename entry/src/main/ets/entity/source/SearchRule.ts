import BaseListRule from './ListRule';

/**
 * 基本搜素规则
 */
export default class BaseSearchRule extends BaseListRule {
  /**
   * 校验关键字
   */
  checkKeyWord: string = '';
}