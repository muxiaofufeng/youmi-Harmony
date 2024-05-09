/**
 * 章节
 *
 * 删除书籍时自动删除章节
 */
export class Chapter {
  /** 章节地址 */
  url: string = ''
  /** 章节标题 */
  title: string = ''
  /** 是否是卷名 */
  isVolume: boolean = false
  /** 用来拼接相对url */
  baseUrl: string = ''
  /** 书籍地址 */
  bookUrl: string = ''
  /** 章节序号 */
  index: number = 0
  /** 是否VIP */
  isVip: boolean = false
  /** 是否已购买 */
  isPay: boolean = false
  /** 音频真实URL */
  resourceUrl?: string = null
  /** 更新时间或其他章节附加信息 */
  tag?: string = null
  /** 章节起始位置 */
  start?: number = null
  /** 章节终止位置 */
  end?: number = null
  /** EPUB书籍当前章节的fragmentId */
  startFragmentId?: string = null
  /** EPUB书籍下一章节的fragmentId */
  endFragmentId?: string = null
  /** 变量 */
  variable?: string = null
}