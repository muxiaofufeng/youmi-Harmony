import { OperationItem } from '../../entity/component/common';

@Preview
@Component
export struct HeaderBar {
  @Prop title: string = '';
  @Prop fontSize: number = 19;
  @Prop iconSize: number = 22;
  @Prop moreMenus: OperationItem[] = [];
  private _background: ResourceColor = $r('app.color.background')
  private _on_background: ResourceColor = $r('app.color.on_background')

  build() {
    Row() {
      Text(this.title)
        .fontSize(this.fontSize)
        .fontWeight(FontWeight.Bold)
      Row({ space: 4 }) {
        ForEach(this.moreMenus, (item: OperationItem, index: number) => {
          Button({ type: ButtonType.Circle, buttonStyle: ButtonStyleMode.NORMAL }) {
            Image(item.icon)
              .width(this.iconSize)
              .height(this.iconSize)
          }
          .padding(8)
          .backgroundColor(Color.Transparent)
          .onClick(item.action)
          .bindMenu((item.menus as WrappedBuilder<Object[]>)
            ? (item.menus as WrappedBuilder<Object[]>).builder
            : item.menus as Array<MenuElement> | CustomBuilder
          )
        })
      }
    }
    .width('100%')
    .padding({ top: 8, bottom: 8, right: 22, left: 22 })
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(this._background)
    .shadow({ radius: 20, color: this._on_background, offsetY: 5 })
    .zIndex(2)
  }
}