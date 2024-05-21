/**
 * 懒加载数据
 */
export class LazyData<T> implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originData: T[] = [];

  constructor(data?: T[]) {
    if (data) {
      this.originData.push(...data)
    }
  }

  totalCount(): number {
    return this.originData.length;
  }

  getData(index: number): T {
    return this.originData[index];
  }

  /**
   * 在指定位置添加数据
   * @param index 索引
   * @param data 数据
   */
  public addData(index: number, data: T): void {
    this.originData.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  /**
   * 在末尾添加数据
   * @param data 数据
   */
  public pushData(data: T): void {
    this.originData.push(data);
    this.notifyDataAdd(this.originData.length - 1);
  }

  /**
   * 删除索引处的数据
   * @param index 索引
   */
  public deleteData(index: number): void {
    this.originData.splice(index, 1);
    this.notifyDataDelete(index);
  }

  /**
   * 交换索引处的数据
   * @param from 索引
   * @param to 索引
   */
  public moveData(from: number, to: number): void {
    let temp: T = this.originData[from];
    this.originData[from] = this.originData[to];
    this.originData[to] = temp;
    this.notifyDataMove(from, to);
  }

  /**
   * 修改指定位置的数据
   * @param index 索引
   * @param data 数据
   */
  public changeData(index: number, data: T): void {
    this.originData.splice(index, 1, data);
    this.notifyDataChange(index);
  }

  /**
   * 重新加载数据
   */
  public reloadData(): void {
    this.notifyDataReload();
  }

  /**
   * 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
   */
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  /**
   * 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
   */
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  /**
   * 通知LazyForEach组件需要重载所有子组件
   */
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  /**
   * 通知LazyForEach组件需要在index对应索引处添加子组件
   */
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  /**
   * 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
   */
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  /**
   * 通知LazyForEach组件需要在index对应索引处删除该子组件
   */
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  /**
   * 通知LazyForEach组件将from索引和to索引处的子组件进行交换
   */
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}