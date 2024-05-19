import type common from '@ohos.app.ability.common';
import type { Callback } from '@ohos.base';
import distributedKVStore from '@ohos.data.distributedKVStore';
import { Constants } from '../../common/Constants';

export default class DbStore {
  /**
   * 键值数据库管理实例
   */
  protected static instance: DbStore | null = null;
  /**
   * Ability Context
   */
  protected context: common.UIAbilityContext;
  /**
   * 分布式键值数据库管理实例
   */
  protected kvManager: distributedKVStore.KVManager;
  /**
   * 数据库实例
   */
  protected kvStore: distributedKVStore.DeviceKVStore | null;

  /**
   * 构造函数
   * @param context 上下文
   */
  protected constructor(context: common.UIAbilityContext) {
    this.context = context;
    // 分布式键值数据库管理配置
    const kvManagerConfig: distributedKVStore.KVManagerConfig = {
      context: this.context,
      bundleName: this.context.abilityInfo.bundleName,
    }
    this.kvManager = distributedKVStore.createKVManager(kvManagerConfig);
    this.kvStore = null;
  }

  /**
   * 键值数据库管理实例
   */
  static get ins(): DbStore {
    return DbStore.instance;
  }

  /**
   * 键值数据库的管理实例
   */
  get manager(): distributedKVStore.KVManager {
    return this.kvManager!;
  };

  /**
   * 数据库实例
   */
  get store(): distributedKVStore.DeviceKVStore {
    return this.kvStore!;
  }

  /**
   * 创建键值数据库管理实例
   * @param context 上下文
   * @returns 实例
   */
  static async create(context: common.UIAbilityContext): Promise<DbStore> {
    if (!DbStore.instance) {
      const db = DbStore.instance = new DbStore(context)
      db.kvStore = await db.addStore(Constants.storeId)
    }
    return DbStore.instance
  }

  /**
   * 添加键值数据库实例
   * @param id 数据库id
   * @returns 实例
   */
  async addStore(id: string, options?: distributedKVStore.Options): Promise<distributedKVStore.DeviceKVStore> {
    // 选项
    options ??= {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: distributedKVStore.KVStoreType.DEVICE_COLLABORATION,
      securityLevel: distributedKVStore.SecurityLevel.S2,
    };
    return await this.kvManager.getKVStore<distributedKVStore.DeviceKVStore>(id, options);
  }

  /**
   * 通过 Id 的值关闭指定的分布式键值数据库, 同时删除DbStore
   * @param id 数据库id
   */
  async closeStore(id: string): Promise<void> {
    await this.kvManager.closeKVStore(this.context.abilityInfo.bundleName, id);
  }

  /**
   * 通过 Id 的值删除指定的分布式键值数据库, 同时删除DbStore
   * @param id 数据库id
   */
  async deleteStore(id: string): Promise<void> {
    await this.kvManager.deleteKVStore(this.context.abilityInfo.bundleName, id);
  }

  /**
   * 获取所有通过 getKVStore 方法创建的且没有调用 deleteKVStore 方法删除的分布式键值数据库的 storeId
   * @returns 返回所有创建的分布式键值数据库的storeId
   */
  async getAllKVStoreId(): Promise<string[]> {
    return await this.kvManager.getAllKVStoreId(this.context.abilityInfo.bundleName);
  }

  /**
   * 订阅服务状态变更通知
   * @param deathCallback 回调函数
   */
  onDataService(deathCallback: Callback<void>) {
    this.kvManager.on('distributedDataServiceDie', deathCallback);
  }

  /**
   * 取消订阅服务状态变更通知
   * @param deathCallback 回调函数
   */
  offDataService(deathCallback: Callback<void>) {
    this.kvManager.off('distributedDataServiceDie', deathCallback);
  }
}