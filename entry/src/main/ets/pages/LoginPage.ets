import promptAction from '@ohos.promptAction';

@Entry
@Component
struct LoginPage {
  build() {
    Column(){
      Image($rawfile('icon_login_setting.png'))
        .margin({
          right : 30,
          top : 30
        })
        .objectFit(ImageFit.Contain)
        .width(30)
        .height(30)
        //设置子view在父布局交叉轴的位置
        .alignSelf(ItemAlign.End)
        .onClick(() => {
          promptAction.showToast({
            message : '点击设置', //toast的内容
            duration : 300, //toast显示的时长
            bottom : 10,//距离底部的位置
          })
        })
    }
    .backgroundColor('#FFFFFF')
    .width('100%')
    .height('100%')
  }
}