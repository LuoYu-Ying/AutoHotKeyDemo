#SingleInstance, Force

blogSite := "https://luoyu-ying.github.io/" ; 更改为自己的博客网址
rootFolderPath := "E:\XXX\HexoBlog" ; 更改为自己的博客根目录地址

SetWorkingDir, %rootFolderPath%

; 控件添加
Gui, Add, Text , w200 h27 center section , `nHexo Blog Updater 
Gui, Add, Text , w200 0x10 ; 横向分割线
Gui, Add, Button, w200 h35 , New Post
Gui, Add, Text , w200 0x10 
Gui, Add, Button, w200 h35 , Open Root Folder
Gui, Add, Button, w200 h35 , Open Post Folder
Gui, Add, Button, w200 h35 , Open Draft Folder
Gui, Add, Button, w200 h35 ys , Open Blog
Gui, Add, Text , w200 0x10
Gui, Add, Button, w200 h35 , Clean && Generate && Server
Gui, Add, Text , w200 0x10 
Gui, Add, Button, w200 h35 , Clean && Generate && Deploy
Gui, Add, Button, w200 h35 , Generate && Deploy
Gui, Add, Button, w200 h35 , Deploy

Gui, Show, Center , Hexo Blog Updater
Return

; 按钮事件监听

; 打开博客
ButtonOpenBlog:
    Run, %blogSite%
Return

; 清理、生成和本地部署
ButtonCleanGenerateServer:
    Run, %comSpec% /c hexo clean && hexo g && hexo s && pause
Return

; 清理、生成和服务器部署
ButtonCleanGenerateDeploy:
    Run, %comSpec% /c hexo clean && hexo g && hexo d && pause
Return

; 生成和服务器部署
ButtonGenerateDeploy:
    Run, %comSpec% /c hexo g && hexo d && pause
Return

; 服务器部署
ButtonDeploy:
    Run, %comSpec% /c hexo d && pause
Return

; 打开根目录文件夹
ButtonOpenRootFolder:
    Run, %rootFolderPath%
Return

; 打开已发布文章文件夹
ButtonOpenPostFolder:
    Run, source\_posts
Return

; 打开草稿文章文件夹
ButtonOpenDraftFolder:
    Run, source\_drafts
Return

; 添加新文章
ButtonNewPost:
    InputBox, FileName, NewPostTitle, Please enter the title of new post., , , 130
    if ErrorLevel
        Return
    Gui, Msg:+Disabled -SysMenu +Owner
    Gui, Msg:Add, Text, w200 center, File creating...`nPlease wait...
    Gui, Msg:Show, NoActivate ; NoActivate 让当前活动窗口继续保持活动状态.
    RunWait, %comSpec% /c hexo new post "%FileName%", , Hide
    Gui, Msg:Destroy
    newFileName := StrReplace(FileName, A_Space, "-") ".md"
    Run, %newFileName%, source\_posts, Hide
Return

; 退出程序
GuiEscape:
GuiClose:
ExitApp
