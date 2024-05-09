/**
 * 视频源
 */
import { ESourceType } from '../../../common/TsType'

export class Video {
  id: string = ''
  /**
   * 源id
   */
  sourceId: string = ''
  /**
   * 源名称
   */
  sourceName: string = ''
  /**
   * 视频名
   */
  name: string = ''
  /**
   * 作者
   */
  author: string = ''
  /**
   * 分类
   */
  kind?: string = ''
  /**
   * 封面URL
   */
  coverUrl?: string = ''
  /**
   * 封面URL(用户修改)
   */
  customCoverUrl?: string = ''
  /**
   * 简介内容
   */
  intro?: string = ''
  /**
   * 简介内容(用户修改)
   */
  customIntro?: string = ''
  /**
   * 自定义字符集名称(仅适用于本地书籍)
   */
  charset?: string = ''
  /**
   * 类型,详见BookType
   */
  type: ESourceType = ESourceType.Text
  /**
   * 分组(SourceGroup)的id的集合
   */
  groups: string[] = [];
}