/**
 * 基本规则
 */
export abstract class BaseRule {
  /** 名称: 书名, 漫画名, 视频名等等 */
  name?: string = '';
  /** 作者 */
  author?: string = '';
  /** 分类 */
  kind?: string = '';
  /** 简介内容 */
  intro?: string = '';
  /** 封面URL */
  coverUrl?: string = '';
}