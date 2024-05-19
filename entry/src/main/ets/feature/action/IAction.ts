import type { ESourceType } from '../../../common/TsType';
import type DbStore from '../../database/store';
import type { Carrier, SearchResult } from '../../entity/index';

/**
 * 源操作接口
 */
export interface ISourceAction {
  /**
   * 源分类
   */
  readonly sourceType: ESourceType;

  /**
   * 从源中搜索对应的结果
   * @param name 名称
   * @param groupIds 分组集合
   * @param sourceIds 源id集合
   * @param precision 精准搜索
   * @returns 返回对应类型的结果生成器
   */
  search<T extends SearchResult>(name: string, groupIds: string[], sourceIds: string[], precision: boolean): AsyncGenerator<T, void, unknown>

  /**
   * 从指定值中执行 ExploreRule 并返回对应的结果
   * @param sourceId 源id
   * @param tag 标签名称
   * @returns 返回对应类型的结果生成器 详情
   */
  explore<T extends SearchResult>(sourceId: string, tag: string): AsyncGenerator<T, void, unknown>

  /**
   * 添加到书架
   * @param search 搜索结果
   * @returns 载体
   */
  addToBookshelf<T extends Carrier>(search: SearchResult): T

  /**
   * 从书架中删除
   * @param carrier 载体
   * @returns true: 删除成功, false: 删除失败
   */
  removeFromBookshelf<T extends Carrier>(carrier: T): boolean

  /**
   * 从详情页URL重新加载详情页
   * @param carrier 载体
   * @returns
   */
  updateDetails<T extends Carrier>(carrier: T): Promise<void>

  /**
   * 更新目录
   * @param carrier 载体
   */
  updateToc<T extends Carrier>(carrier: T): Promise<void>

  /**
   * 更新正文
   * @param carrier 载体
   */
  updateContent<T extends Carrier>(carrier: T): Promise<void>
}

/**
 * 源操作管理接口
 */
export interface ISourceActionManage {
  /**
   * 从源中搜索对应的结果
   * @param name 名称
   * @param groupIds 分组集合
   * @param sourceIds 源id集合
   * @param type 类型
   * @param precision 精准搜索
   * @returns 返回对应类型的结果生成器
   */
  search<T extends SearchResult>(name: string, groupIds: string[], sourceIds: string[], type: ESourceType, precision: boolean): AsyncGenerator<T, void, unknown>

  /**
   * 从指定值中执行 ExploreRule 并返回对应的结果
   * @param sourceId 源id
   * @param tag 标签名称
   * @returns 返回对应类型的结果生成器 详情
   */
  explore<T extends SearchResult>(sourceId: string, tag: string, type: ESourceType): AsyncGenerator<T, void, unknown>

  /**
   * 添加到书架
   * @param search 搜索结果
   * @returns 载体
   */
  addToBookshelf<T extends Carrier>(search: SearchResult, type: ESourceType): T

  /**
   * 从书架中删除
   * @param carrier 载体
   * @returns true: 删除成功, false: 删除失败
   */
  removeFromBookshelf<T extends Carrier>(carrier: T, type: ESourceType): boolean

  /**
   * 从详情页URL重新加载详情页
   * @param carrier 载体
   * @returns
   */
  updateDetails<T extends Carrier>(carrier: T, type: ESourceType): Promise<void>

  /**
   * 更新目录
   * @param carrier 载体
   */
  updateToc<T extends Carrier>(carrier: T, type: ESourceType): Promise<void>

  /**
   * 更新正文
   * @param carrier 载体
   */
  updateContent<T extends Carrier>(carrier: T, type: ESourceType): Promise<void>

  /**
   * 从分类中获取对应的源操作
   * @param type 源类型
   * @returns 源操作
   */
  getSourceAction(type: ESourceType): ISourceAction;
}

/**
 * 基础操作
 */
export abstract class BaseAction {
  /**
   * 键值数据库管理实例
   */
  protected store: DbStore

  constructor(store: DbStore) {
    this.store = store
  }
}