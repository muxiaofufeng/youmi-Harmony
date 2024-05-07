@Preview
@Component
export struct ExploreView {
  build() {
    Column() {
      Image($r('app.media.splash'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Contain)
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}