/**
 * 分组
 */
export class SourceGroup {
  id: string = ''
  /**
   * 组名
   */
  name: string = ''
  /**
   * 图片
   */
  cover?: String = ''
  /**
   * 手动排序
   */
  order: number = 0
  /**
   * 该分组是否启用刷新
   */
  enableRefresh: boolean = true
  /**
   * 是否显示该分组
   */
  show: boolean = true
  /**
   * 排序
   */
  sort: number = -1
}