import promptAction from '@ohos.promptAction';

@Entry
@Component
struct LoginPage {

  onShowToast(content : string){
    promptAction.showToast({
      message : content, //toast的内容
      duration : 300, //toast显示的时长
      bottom : 10,//距离底部的位置
    })
  }



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
          this.onShowToast('点击设置');
        })

      Image($rawfile('icon_login_logo.png'))
        .width(80)
        .height(80)
        .margin({
          top : 40
        })
        .alignSelf(ItemAlign.Center)

      Text('欢迎登录,Sws~')
        .fontStyle(FontStyle.Normal)
        .alignSelf(ItemAlign.Center)
        .fontSize(16)
        .fontColor('#333333')

    }
    .backgroundColor('#FFFFFF')
    .width('100%')
    .height('100%')
  }
}