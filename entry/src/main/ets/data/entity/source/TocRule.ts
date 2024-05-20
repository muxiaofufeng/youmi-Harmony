/**
 * 基本目录规则
 */
export class BaseTocRule {
  /** 预处理规则, preUpdateJs */
  init?: string = '';
  /** 章节列表 */
  chapterList?: string = '';
  /** 章节名称 */
  chapterName?: string = '';
  /** 章节URL */
  chapterUrl?: string = '';
  /** 格式化规则, formatJs */
  format?: string = '';
  /** 卷名标识 */
  isVolume?: string = '';
  /** VIP 标识 */
  isVip?: string = '';
  /** 购买标识 */
  isPay?: string = '';
  /** 更新时间 */
  updateTime?: string = '';
  /** 目录下一页规则，目录翻页规则 */
  nextTocUrl?: string = '';
}