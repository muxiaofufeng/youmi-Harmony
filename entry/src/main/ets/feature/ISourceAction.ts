import { ESourceType } from '../../common/TsType';

/**
 * 源操作
 */

export interface ISourceAction<T> {
  /**
   * 从源中搜索对应的结果
   * @param name 名称
   * @param mold 类型
   * @param precision 精准搜索
   * @param groups 分组
   * @returns 返回对应类型的结果生成器
   */
  search(name: string, mold: ESourceType, precision: boolean, ...groups: string[]): AsyncGenerator<T, void, unknown>;

  /**
   * 从指定值中执行 ExploreRule 并返回对应的结果
   * @param name 标签名称
   * @returns 返回对应类型的结果生成器 详情
   */
  explore(name: string): AsyncGenerator<T, void, unknown>;

  /**
   * 从详情页URL重新加载详情页
   * @param url 详情页URL
   * @returns
   */
  details(url: string): Promise<T>;

  /**
   * 从目录URL重新加载目录
   * @param url 目录URL
   * @returns
   */
  catalogue(url: string): Promise<T>;

  /**
   * 从正文URL重新加载正文
   * @param url 正文URL
   * @returns
   */
  content(url: string): Promise<T>;
}