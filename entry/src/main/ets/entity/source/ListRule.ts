/**
 * 基本列表规则
 */
export default abstract class BaseListRule {
  /**
   * 列表URL地址: 搜索URL地址等等
   */
  url: string = '';
  /**
   * 列表规则
   */
  list: string = '';
  /**
   * 名称: 书名, 漫画名, 视频名等等
   */
  name: string = '';
  /**
   * 作者
   */
  author: string = '';
  /**
   * 分类
   */
  kind: string = '';
  /**
   * 简介内容
   */
  intro: string = '';
  /**
   * 最新章节
   */
  lastChapter: string = '';
  /**
   * 封面URL
   */
  coverUrl: string = '';
  /**
   * 详情页URL
   */
  infoUrl: string = '';
  /**
   * 更新时间
   */
  updateTime: string = '';
  /**
   * 字数
   */
  //wordCount: string = '';
}