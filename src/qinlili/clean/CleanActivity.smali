.class public Lqinlili/clean/CleanActivity;
.super Landroid/app/Activity;

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field static mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private Clean(Ljava/io/File;ZLjava/io/FilenameFilter;)V
    .registers 9

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_9

    :cond_8
    :goto_8
    return-void

    :cond_9
    :try_start_9
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    :cond_12
    invoke-virtual {p1, p3}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_25

    array-length v2, v1

    const/4 v0, 0x0

    :goto_1a
    if-ge v0, v2, :cond_25

    aget-object v3, v1, v0

    const/4 v4, 0x1

    invoke-direct {p0, v3, v4, p3}, Lqinlili/clean/CleanActivity;->Clean(Ljava/io/File;ZLjava/io/FilenameFilter;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_25
    if-eqz p2, :cond_8

    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_2a} :catch_2b

    goto :goto_8

    :catch_2b
    move-exception v0

    goto :goto_8
.end method

.method private ConfigFilenameFilter()Ljava/io/FilenameFilter;
    .registers 2

    new-instance v0, Lqinlili/clean/AllConfigFilenameFilter;

    invoke-direct {v0, p0}, Lqinlili/clean/AllConfigFilenameFilter;-><init>(Lqinlili/clean/CleanActivity;)V

    return-object v0
.end method

.method private ExternalCache()Ljava/io/File;
    .registers 3

    invoke-virtual {p0}, Lqinlili/clean/CleanActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_15

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_15

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method private FilenameFilter()Ljava/io/FilenameFilter;
    .registers 2

    new-instance v0, Lqinlili/clean/AllDataFilenameFilter;

    invoke-direct {v0, p0}, Lqinlili/clean/AllDataFilenameFilter;-><init>(Lqinlili/clean/CleanActivity;)V

    return-object v0
.end method

.method private FilesDir()Ljava/io/File;
    .registers 3

    invoke-virtual {p0}, Lqinlili/clean/CleanActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_15

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_15

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method private ProtectedStorage()Ljava/io/File;
    .registers 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_1f

    invoke-virtual {p0}, Lqinlili/clean/CleanActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->createDeviceProtectedStorageContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1f

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    :goto_1e
    return-object v0

    :cond_1f
    const/4 v0, 0x0

    goto :goto_1e
.end method

.method public static clearWebViewCachesCustom(Landroid/content/Context;)V
    .registers 4

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, "/app_webview/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lqinlili/clean/CacheUtils;->RecursionDeleteFile(Ljava/io/File;)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2c} :catch_2d

    :goto_2c
    return-void

    :catch_2d
    move-exception v0

    goto :goto_2c
.end method


# virtual methods
.method public export(Landroid/view/View;)V
    .registers 10

    const-string v0, "正在导出数据\n目标下载目录内KiyomiDataExport目录\n如未导出请检查是否授予小轻管理所有文件的权限"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lqinlili/clean/CleanActivity$Export;

    invoke-direct {v1, p0}, Lqinlili/clean/CleanActivity$Export;-><init>(Lqinlili/clean/CleanActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public onBackPressed()V
    .registers 1

    invoke-virtual {p0}, Lqinlili/clean/CleanActivity;->finishAndRemoveTask()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_74

    :goto_8
    :pswitch_8  #0x7f060006
    return-void

    :pswitch_9  #0x7f060005
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lqinlili/clean/CleanActivity$CleanCache;

    invoke-direct {v1, p0}, Lqinlili/clean/CleanActivity$CleanCache;-><init>(Lqinlili/clean/CleanActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_8

    :pswitch_17  #0x7f060004
    invoke-virtual {p0}, Lqinlili/clean/CleanActivity;->finishAndRemoveTask()V

    goto :goto_8

    :pswitch_1b  #0x7f060007
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/CookieManager;->removeAllCookies(Landroid/webkit/ValueCallback;)V

    goto :goto_8

    :pswitch_24  #0x7f060008
    invoke-direct {p0}, Lqinlili/clean/CleanActivity;->FilesDir()Ljava/io/File;

    move-result-object v0

    invoke-direct {p0}, Lqinlili/clean/CleanActivity;->FilenameFilter()Ljava/io/FilenameFilter;

    move-result-object v1

    invoke-direct {p0, v0, v2, v1}, Lqinlili/clean/CleanActivity;->Clean(Ljava/io/File;ZLjava/io/FilenameFilter;)V

    invoke-direct {p0}, Lqinlili/clean/CleanActivity;->ProtectedStorage()Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0, v2, v1}, Lqinlili/clean/CleanActivity;->Clean(Ljava/io/File;ZLjava/io/FilenameFilter;)V

    invoke-direct {p0}, Lqinlili/clean/CleanActivity;->ExternalCache()Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0, v2, v1}, Lqinlili/clean/CleanActivity;->Clean(Ljava/io/File;ZLjava/io/FilenameFilter;)V

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    goto :goto_8

    :pswitch_45  #0x7f060009
    invoke-direct {p0}, Lqinlili/clean/CleanActivity;->FilesDir()Ljava/io/File;

    move-result-object v0

    invoke-direct {p0}, Lqinlili/clean/CleanActivity;->ConfigFilenameFilter()Ljava/io/FilenameFilter;

    move-result-object v1

    invoke-direct {p0, v0, v2, v1}, Lqinlili/clean/CleanActivity;->Clean(Ljava/io/File;ZLjava/io/FilenameFilter;)V

    invoke-direct {p0}, Lqinlili/clean/CleanActivity;->ProtectedStorage()Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0, v2, v1}, Lqinlili/clean/CleanActivity;->Clean(Ljava/io/File;ZLjava/io/FilenameFilter;)V

    invoke-direct {p0}, Lqinlili/clean/CleanActivity;->ExternalCache()Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0, v2, v1}, Lqinlili/clean/CleanActivity;->Clean(Ljava/io/File;ZLjava/io/FilenameFilter;)V

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    goto :goto_8

    :pswitch_66  #0x7f06000a
    invoke-static {}, Landroid/webkit/WebStorage;->getInstance()Landroid/webkit/WebStorage;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebStorage;->deleteAllData()V

    sget-object v0, Lqinlili/clean/CleanActivity;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lqinlili/clean/CleanActivity;->clearWebViewCachesCustom(Landroid/content/Context;)V

    goto :goto_8

    nop

    :pswitch_data_74
    .packed-switch 0x7f060004
        :pswitch_17  #7f060004
        :pswitch_9  #7f060005
        :pswitch_8  #7f060006
        :pswitch_1b  #7f060007
        :pswitch_24  #7f060008
        :pswitch_45  #7f060009
        :pswitch_66  #7f06000a
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 14

    const/4 v4, 0x1

    const/4 v3, -0x1

    const v2, -0xffffff

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lqinlili/clean/CleanActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lqinlili/clean/CleanActivity;->mContext:Landroid/content/Context;

    invoke-static {p0}, Lqinlili/stub/Tools;->getDarkModeStatus(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_6f

    invoke-virtual {p0}, Lqinlili/clean/CleanActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x2010

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    invoke-virtual {v0, v3}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {v0, v3}, Landroid/view/Window;->setNavigationBarColor(I)V

    invoke-virtual {p0}, Lqinlili/clean/CleanActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_36
    const v0, 0x7f030005

    invoke-virtual {p0, v0}, Lqinlili/clean/CleanActivity;->setContentView(I)V

    const v0, 0x7f060005

    invoke-virtual {p0, v0}, Lqinlili/clean/CleanActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f060007

    invoke-virtual {p0, v0}, Lqinlili/clean/CleanActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f060008

    invoke-virtual {p0, v0}, Lqinlili/clean/CleanActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f060009

    invoke-virtual {p0, v0}, Lqinlili/clean/CleanActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f06000a

    invoke-virtual {p0, v0}, Lqinlili/clean/CleanActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_6f
    invoke-virtual {p0}, Lqinlili/clean/CleanActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {v0, v2}, Landroid/view/Window;->setNavigationBarColor(I)V

    invoke-virtual {p0}, Lqinlili/clean/CleanActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_36
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 3
    .annotation runtime Ljava/lang/Override;
    .end annotation

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_12

    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_b
    return v0

    :pswitch_c  #0x102002c
    invoke-virtual {p0}, Lqinlili/clean/CleanActivity;->finishAndRemoveTask()V

    const/4 v0, 0x0

    goto :goto_b

    nop

    :pswitch_data_12
    .packed-switch 0x102002c
        :pswitch_c  #0102002c
    .end packed-switch
.end method
