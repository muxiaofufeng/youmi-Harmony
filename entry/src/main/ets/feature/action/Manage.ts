import type DbStore from '../../data/store';
import type { Carrier, SearchResult } from '../../data/entity';
import { ESourceType } from '../../../common/TsType';
import { AudioAction } from './Audio';
import { BookAction } from './Book';
import { ComicAction } from './Comic';
import { FileAction } from './File';
import { BaseAction, ISourceAction, ISourceActionManage } from './IAction';
import { VideoAction } from './Video';

/**
 * 源操作管理
 */
export class ActionManage extends BaseAction implements ISourceActionManage {
  /**
   * 管理实例
   */
  protected static instance: ActionManage | null = null
  /**
   * 操作集合
   */
  protected actions: Array<ISourceAction> = [];

  protected constructor(store: DbStore) {
    super(store);
    this.actions.push(
      new AudioAction(store),
      new BookAction(store),
      new ComicAction(store),
      new FileAction(store),
      new VideoAction(store)
    );
  }

  /**
   * 管理实例
   */
  static get ins(): ActionManage {
    return ActionManage.instance!;
  }

  /**
   * 创建实例
   * @returns
   */
  static create(store: DbStore): ActionManage {
    if (!ActionManage.instance) {
      ActionManage.instance = new ActionManage(store);
    }
    return ActionManage.instance;
  }

  async * search<T extends SearchResult>(name: string, groupIds: string[], sourceIds: string[], type: ESourceType = ESourceType.All, precision: boolean = false): AsyncGenerator<T, void, unknown> {
    let actions = type == ESourceType.All ? this.actions : [this.getSourceAction(type)];
    for (const action of actions) {
      yield * action.search<T>(name, groupIds, sourceIds, precision)
    }
  }

  async * explore<T extends SearchResult>(sourceId: string, tag: string, type: ESourceType = ESourceType.All): AsyncGenerator<T, void, unknown> {
    throw new Error('Method not implemented.');
  }

  addToBookshelf<T extends Carrier>(search: SearchResult, type: ESourceType = ESourceType.All): T {
    throw new Error('Method not implemented.');
  }

  removeFromBookshelf<T extends Carrier>(carrier: T, type: ESourceType = ESourceType.All): boolean {
    throw new Error('Method not implemented.');
  }

  async updateDetails<T extends Carrier>(carrier: T, type: ESourceType = ESourceType.All): Promise<void> {
    throw new Error('Method not implemented.');
  }

  async updateToc<T extends Carrier>(carrier: T, type: ESourceType = ESourceType.All): Promise<void> {
    throw new Error('Method not implemented.');
  }

  async updateContent<T extends Carrier>(carrier: T, type: ESourceType = ESourceType.All): Promise<void> {
    throw new Error('Method not implemented.');
  }

  getSourceAction(type: ESourceType): ISourceAction {
    return this.actions.find(item => item.sourceType == type)!
  }
}