export default class BaseInfoRule {
  /**
   * 预处理规则
   */
  init: string = '';
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
   * 简介
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
   * 更新时间
   */
  updateTime: string = '';
  /**
   * 目录URL
   */
  tocUrl: string = '';
  /**
   * 下载URL规则
   */
  downloadUrls: string = '';
  /**
   * 允许修改作者
   */
  //canReName: string = '';
  /**
   * 字数
   */
  //wordCount: string = '';
}