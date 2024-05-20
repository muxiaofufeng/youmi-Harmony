import DbStore from '../../data/store';
import { ESourceType } from 'common/TsType';
import { Carrier, SearchResult } from 'ets/data/entity';
import { BaseAction, ISourceAction } from './IAction';

/**
 * 书源操作
 */
export class BookAction extends BaseAction implements ISourceAction {
  readonly sourceType: ESourceType = ESourceType.Text;

  constructor(store: DbStore) {
    super(store)
  }

  async * search<T extends SearchResult>(name: string, groupIds: string[], sourceIds: string[], precision: boolean): AsyncGenerator<T, void, unknown> {
    throw new Error('Method not implemented.');
  }

  async * explore<T extends SearchResult>(sourceId: string, tag: string): AsyncGenerator<T, void, unknown> {
    throw new Error('Method not implemented.');
  }

  addToBookshelf<T extends Carrier>(search: SearchResult): T {
    throw new Error('Method not implemented.');
  }

  removeFromBookshelf<T extends Carrier>(carrier: T): boolean {
    throw new Error('Method not implemented.');
  }

  async updateDetails<T extends Carrier>(carrier: T): Promise<void> {
    throw new Error('Method not implemented.');
  }

  async updateToc<T extends Carrier>(carrier: T): Promise<void> {
    throw new Error('Method not implemented.');
  }

  async updateContent<T extends Carrier>(carrier: T): Promise<void> {
    throw new Error('Method not implemented.');
  }
}