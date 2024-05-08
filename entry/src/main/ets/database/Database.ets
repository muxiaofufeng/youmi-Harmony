import relationalStore from '@ohos.data.relationalStore';

export default class DatabaseImpl {
  /**
   * 数据库文件名
   */
  private readonly name: string;

  constructor(name: string = 'source.db') {
    this.name = name;
    this.init();
  }

  /**
   * 数据库实例
   */
  private _db: relationalStore.RdbStore;

  get db() {
    return this._db;
  };

  /**
   * 创建表格
   * @param sql SQL语句
   */
  public async createTable(sql: string) {
    await this._db.executeSql(sql); // 创建数据表
  }


  /**
   * 初始化函数
   */
  protected async init() {
    this._db = await relationalStore.getRdbStore(getContext(this), {
      name: this.name,
      securityLevel: relationalStore.SecurityLevel.S1, // 数据库安全级别
      encrypt: false, // 可选参数，指定数据库是否加密，默认不加密
    });
    //当数据库创建时，数据库默认版本为0
    if (this._db.version === 0) {
      //this.db.executeSql(SQL_CREATE_TABLE); // 创建数据表
      this._db.version = 4;
    } else {
      // TODO: 如果数据库版本不为 0 且和当前数据库版本不匹配，需要进行升降级操作
      // https://docs.openharmony.cn/pages/v4.0/zh-cn/application-dev/database/data-persistence-by-rdb-store.md#%E5%BC%80%E5%8F%91%E6%AD%A5%E9%AA%A4
    }
  }
}