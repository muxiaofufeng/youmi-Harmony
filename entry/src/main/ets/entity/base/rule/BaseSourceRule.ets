/**
 * 源的基础规则
 */
export default class BaseSourceRule {
  /**
   * 源URL地址, 包括 http/https
   */
  sourceUrl: string = '';
  /**
   * 源名称
   */
  sourceName: string = '';
  /**
   * 源分组
   */
  sourceGroup: string = '';
  /**
   * 注释
   */
  bookSourceComment: string = '';
  /**
   * 登录URL地址
   */
  loginUrl: string = '';
  /**
   * 登录UI
   */
  loginUi: string = '';
  /**
   * 登录检测js
   */
  loginCheckJs: string = '';
  /**
   * 封面解密js
   */
  coverDecodeJs: string = '';
  /**
   * 书籍url正则
   */
  bookUrlPattern: string = '';
  /**
   * 自定义变量说明
   */
  variableComment: string = '';
  /**
   * 请求头
   */
  header: string = '';
  /**
   * 并发率
   */
  concurrentRate: string = '';
  /**
   * js库
   */
  jsLib: string = '';
}