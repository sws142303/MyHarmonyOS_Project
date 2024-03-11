import promptAction from '@ohos.promptAction';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import router from '@ohos.router';

@Entry
@Component
struct LoginPage {

  onShowToast(content : string){
    promptAction.showToast({
      message : content, //toast的内容
      duration : 300, //toast显示的时长
      bottom : 50,//距离底部的位置
    })
  }

  @State userName : string = ''
  @State passWord : string = ''


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
          router.pushUrl({ url : 'pages/PermissionTestPage' }) //启动新页面 并销毁当前页面
        })

      Image($rawfile('icon_login_logo.png'))
        .width(80)
        .height(80)
        .margin({
          top : 40
        })
        .alignSelf(ItemAlign.Center)

      Text('欢迎登录,Sws~')
        .margin({
          top : 23
        })
        .fontStyle(FontStyle.Normal)
        .alignSelf(ItemAlign.Center)
        .fontSize(16)
        .fontColor('#333333')


      TextInput({ placeholder : '请输入账号' })
        .type(InputType.Number)
        .margin({
          top : 40,
          left : 24,
          right : 24
        })
        .fontSize(12)
        .backgroundColor('#F0F2F4')
        .borderRadius(7)
        .height(40)
        .onChange((value : string) => {
          //文本改变事件
          this.userName = value
        })
        .onFocus(() => {
          //焦点获取事件

        })

      TextInput({ placeholder : '请输入密码'})
        .type(InputType.Password)
        .margin({
          top : 20,
          left : 24,
          right : 24
        })
        .fontSize(12)
        .backgroundColor('#F0F2F4')
        .borderRadius(7)
        .height(40)
        .onChange((value : string) => {
          //文本改变事件
          this.passWord = value
        })
        .onFocus(() => {
          //焦点获取事件

        })

      Text('忘记密码')
        .fontColor('#377DFF')
        .fontSize(12)
        .alignSelf(ItemAlign.End)
        .margin({
          right : 24,
          top : 15
        })
        .onClick(() => {
          //忘记密码点击事件
          this.onShowToast('忘记密码')
        })

      Button('登录')
        // .type(ButtonType.Normal)//设置按钮样式风格 Capsule（胶囊类型）、Circle（圆形按钮）和Normal（普通按钮
        .borderRadius(50)
        .backgroundColor('#377DFF')
        .margin({
          top : 60,
        })
        .width('90%')
        .onClick(view => {
          this.onShowToast("账号：" + this.userName + "    密码：" + this.passWord)
        })
    }
    .backgroundColor('#FFFFFF')
    .width('100%')
    .height('100%')
  }
}