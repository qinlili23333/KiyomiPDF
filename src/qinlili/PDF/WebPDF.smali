.class public Lqinlili/PDF/WebPDF;
.super Landroid/app/Activity;


# static fields
.field private static final PICK_PDF_FILE:I = 0x2

.field static progressbox:Landroid/app/ProgressDialog;


# instance fields
.field et:Landroid/widget/EditText;

.field url:Ljava/lang/String;

.field w:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public getPermission()V
    .registers 10

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_c

    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    if-eqz v0, :cond_d

    :cond_c
    return-void

    :cond_d
    const-string v0, "请勾选允许管理所有文件\nKiyomiPDF依赖此权限读取文档"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    new-instance v1, Landroid/content/Intent;

    const-string v0, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "package"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-static {v2, v3, v0}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 7

    const/4 v2, 0x0

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/4 v0, 0x2

    if-ne p1, v0, :cond_4f

    const/4 v0, -0x1

    if-ne p2, v0, :cond_4f

    if-eqz p3, :cond_4f

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_4f

    invoke-virtual {p0, v0}, Lqinlili/PDF/WebPDF;->savefile(Landroid/net/Uri;)V

    iget-object v0, p0, Lqinlili/PDF/WebPDF;->url:Ljava/lang/String;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_42

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file:///android_asset/pdf/web/viewer.html?file="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lqinlili/PDF/WebPDF;->w:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    sget-object v0, Lqinlili/PDF/WebPDF;->progressbox:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_41

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V

    :cond_41
    :goto_41
    return-void

    :cond_42
    const-string v0, "读取PDF失败！\n请确认文件状态正常！"

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Lqinlili/PDF/WebPDF;->finishAndRemoveTask()V

    goto :goto_41

    :cond_4f
    const-string v0, "未指定PDF！"

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Lqinlili/PDF/WebPDF;->finishAndRemoveTask()V

    goto :goto_41
.end method

.method public onBackPressed()V
    .registers 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lqinlili/PDF/WebPDF;->moveTaskToBack(Z)Z

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 15

    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lqinlili/PDF/WebPDF;->w:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-static {p0}, Lqinlili/stub/Tools;->getDarkModeStatus(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_40

    const-string v1, "FORCE_DARK"

    invoke-static {v1}, Landroidx/webkit/WebViewFeature;->isFeatureSupported(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1d

    const v2, 0x2

    invoke-static {v0, v2}, Landroidx/webkit/WebSettingsCompat;->setForceDark(Landroid/webkit/WebSettings;I)V

    :cond_1d
    const-string v1, "FORCE_DARK_STRATEGY"

    invoke-static {v1}, Landroidx/webkit/WebViewFeature;->isFeatureSupported(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_29

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroidx/webkit/WebSettingsCompat;->setForceDarkStrategy(Landroid/webkit/WebSettings;I)V

    :cond_29
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    const v1, -0xffffff

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    return-void

    :cond_40
    const-string v1, "FORCE_DARK"

    invoke-static {v1}, Landroidx/webkit/WebViewFeature;->isFeatureSupported(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4e

    const v2, 0x0

    invoke-static {v0, v2}, Landroidx/webkit/WebSettingsCompat;->setForceDark(Landroid/webkit/WebSettings;I)V

    :cond_4e
    const-string v1, "FORCE_DARK_STRATEGY"

    invoke-static {v1}, Landroidx/webkit/WebViewFeature;->isFeatureSupported(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5a

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroidx/webkit/WebSettingsCompat;->setForceDarkStrategy(Landroid/webkit/WebSettings;I)V

    :cond_5a
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x2010

    const/4 v5, -0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    invoke-virtual {v0, v5}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {v0, v5}, Landroid/view/Window;->setNavigationBarColor(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 16

    const/4 v4, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x1

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lqinlili/PDF/WebPDF;->getPermission()V

    const/4 v4, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x1

    const v0, 0x7f030013

    invoke-virtual {p0, v0}, Lqinlili/PDF/WebPDF;->setContentView(I)V

    const v0, 0x7f060001

    invoke-virtual {p0, v0}, Lqinlili/PDF/WebPDF;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lqinlili/PDF/WebPDF;->w:Landroid/webkit/WebView;

    iget-object v0, p0, Lqinlili/PDF/WebPDF;->w:Landroid/webkit/WebView;

    const-string v1, "AndroidPrinter"

    invoke-virtual {v0, p0, v1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    sget-object v1, Landroid/webkit/WebSettings$RenderPriority;->HIGH:Landroid/webkit/WebSettings$RenderPriority;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setRenderPriority(Landroid/webkit/WebSettings$RenderPriority;)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setMixedContentMode(I)V

    invoke-static {p0}, Lqinlili/stub/Tools;->getDarkModeStatus(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_6f

    const-string v1, "FORCE_DARK"

    invoke-static {v1}, Landroidx/webkit/WebViewFeature;->isFeatureSupported(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_63

    const v2, 0x2

    invoke-static {v0, v2}, Landroidx/webkit/WebSettingsCompat;->setForceDark(Landroid/webkit/WebSettings;I)V

    :cond_63
    const-string v1, "FORCE_DARK_STRATEGY"

    invoke-static {v1}, Landroidx/webkit/WebViewFeature;->isFeatureSupported(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6f

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroidx/webkit/WebSettingsCompat;->setForceDarkStrategy(Landroid/webkit/WebSettings;I)V

    :cond_6f
    const/4 v2, 0x1

    invoke-virtual {p0}, Lqinlili/PDF/WebPDF;->getIntent()Landroid/content/Intent;

    move-result-object v4

    if-eqz v4, :cond_de

    invoke-virtual {v4}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_de

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x1

    const-string v1, "content://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_a4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file:///android_asset/pdf/web/viewer.html?file="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lqinlili/PDF/WebPDF;->w:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :goto_a3
    return-void

    :cond_a4
    const-string v0, "正在读取PDF...\n白屏属正常现象"

    invoke-static {p0, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Lqinlili/PDF/WebPDF;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lqinlili/PDF/WebPDF;->savefile(Landroid/net/Uri;)V

    iget-object v0, p0, Lqinlili/PDF/WebPDF;->url:Ljava/lang/String;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_f6

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file:///android_asset/pdf/web/viewer.html?file="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lqinlili/PDF/WebPDF;->w:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void

    :cond_de
    const-string v0, "moe.qinlili.pdf.OPEN_PDF"

    invoke-virtual {p0}, Lqinlili/PDF/WebPDF;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_103

    const-string v0, "moe.qinlili.pdf.PDF_URL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_144

    :cond_f6
    const-string v0, "未指定PDF！"

    invoke-static {p0, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Lqinlili/PDF/WebPDF;->finishAndRemoveTask()V

    goto :goto_a3

    :cond_103
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    sput-object v0, Lqinlili/PDF/WebPDF;->progressbox:Landroid/app/ProgressDialog;

    const-string v1, "读取文件中..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    const-string v1, "正在读取PDF文件...\n视文件大小和手机性能可能需要数秒到数分钟"

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    iget-object v0, p0, Lqinlili/PDF/WebPDF;->w:Landroid/webkit/WebView;

    const-string v1, "file:///android_asset/pdf/web/viewer.html"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "application/pdf"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v4, 0x2

    invoke-virtual {p0, v0, v4}, Lqinlili/PDF/WebPDF;->startActivityForResult(Landroid/content/Intent;I)V

    const v0, 0x0

    const v1, 0x0

    invoke-virtual {p0, v0, v1}, Lqinlili/PDF/WebPDF;->overridePendingTransition(II)V

    goto/16 :goto_a3

    :cond_144
    iget-object v0, p0, Lqinlili/PDF/WebPDF;->w:Landroid/webkit/WebView;

    const-string v1, "file:///android_asset/pdf/web/viewer.html"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lqinlili/PDF/WebPDF;->et:Landroid/widget/EditText;

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "PDF地址"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lqinlili/PDF/WebPDF;->et:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "确定"

    new-instance v2, Lqinlili/PDF/WebPDF$Load;

    invoke-direct {v2, p0}, Lqinlili/PDF/WebPDF$Load;-><init>(Lqinlili/PDF/WebPDF;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "取消"

    new-instance v0, Lqinlili/PDF/WebPDF$Exit;

    invoke-direct {v0, p0}, Lqinlili/PDF/WebPDF$Exit;-><init>(Lqinlili/PDF/WebPDF;)V

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    const v3, 0x0

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setCancelable(Z)V

    return-void
.end method

.method public pinchEnable()Ljava/lang/String;
    .registers 10
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    const-string v1, "true"

    return-object v1
.end method

.method public print()V
    .registers 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    const-string v0, "正在准备打印..."

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Lqinlili/PDF/WebPDF;->w:Landroid/webkit/WebView;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lqinlili/PDF/WebPDF$WebPrint;

    invoke-direct {v2, p0, v0}, Lqinlili/PDF/WebPDF$WebPrint;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public savefile(Landroid/net/Uri;)V
    .registers 9

    const/4 v1, 0x0

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lqinlili/PDF/WebPDF;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    sget-char v4, Ljava/io/File;->separatorChar:C

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, ".pdf"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lqinlili/PDF/WebPDF;->url:Ljava/lang/String;

    move-object v0, v1

    check-cast v0, Ljava/io/BufferedInputStream;

    check-cast v1, Ljava/io/BufferedOutputStream;

    :try_start_4f
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-virtual {p0}, Lqinlili/PDF/WebPDF;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_5c
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_5c} :catch_b1
    .catchall {:try_start_4f .. :try_end_5c} :catchall_b6

    :try_start_5c
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v0, Ljava/io/FileOutputStream;

    const/4 v5, 0x0

    invoke-direct {v0, v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v2, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_67} :catch_83
    .catchall {:try_start_5c .. :try_end_67} :catchall_8b

    const/16 v0, 0x400

    :try_start_69
    new-array v0, v0, [B

    invoke-virtual {v3, v0}, Ljava/io/BufferedInputStream;->read([B)I

    :cond_6e
    invoke-virtual {v2, v0}, Ljava/io/BufferedOutputStream;->write([B)V

    invoke-virtual {v3, v0}, Ljava/io/BufferedInputStream;->read([B)I
    :try_end_74
    .catch Ljava/io/IOException; {:try_start_69 .. :try_end_74} :catch_a8
    .catchall {:try_start_69 .. :try_end_74} :catchall_a3

    move-result v1

    const/4 v4, -0x1

    if-ne v1, v4, :cond_6e

    :goto_78
    if-eqz v3, :cond_7d

    :try_start_7a
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V

    :cond_7d
    if-eqz v2, :cond_82

    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_82
    .catch Ljava/io/IOException; {:try_start_7a .. :try_end_82} :catch_9e

    :cond_82
    :goto_82
    return-void

    :catch_83
    move-exception v0

    move-object v2, v3

    :goto_85
    :try_start_85
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_88
    .catchall {:try_start_85 .. :try_end_88} :catchall_ac

    move-object v3, v2

    move-object v2, v1

    goto :goto_78

    :catchall_8b
    move-exception v0

    move-object v2, v0

    move-object v0, v3

    :goto_8e
    if-eqz v0, :cond_93

    :try_start_90
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    :cond_93
    if-eqz v1, :cond_98

    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_90 .. :try_end_98} :catch_99

    :cond_98
    :goto_98
    throw v2

    :catch_99
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_98

    :catch_9e
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_82

    :catchall_a3
    move-exception v0

    move-object v1, v2

    move-object v2, v0

    move-object v0, v3

    goto :goto_8e

    :catch_a8
    move-exception v0

    move-object v1, v2

    move-object v2, v3

    goto :goto_85

    :catchall_ac
    move-exception v0

    move-object v6, v0

    move-object v0, v2

    move-object v2, v6

    goto :goto_8e

    :catch_b1
    move-exception v2

    move-object v6, v2

    move-object v2, v0

    move-object v0, v6

    goto :goto_85

    :catchall_b6
    move-exception v2

    goto :goto_8e
.end method
