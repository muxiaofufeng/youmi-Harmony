import DbStore from '../../database/store';
import { ESourceType } from 'common/TsType';
import { Carrier, SearchResult } from 'ets/entity';
import { BaseAction, ISourceAction } from './IAction';

/**
 * 音频源操作
 */
export class AudioAction extends BaseAction implements ISourceAction {
  readonly sourceType: ESourceType = ESourceType.Audio;

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