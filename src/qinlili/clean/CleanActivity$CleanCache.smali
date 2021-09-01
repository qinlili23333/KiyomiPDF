.class Lqinlili/clean/CleanActivity$CleanCache;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lqinlili/clean/CleanActivity;


# direct methods
.method constructor <init>(Lqinlili/clean/CleanActivity;)V
    .registers 2

    iput-object p1, p0, Lqinlili/clean/CleanActivity$CleanCache;->a:Lqinlili/clean/CleanActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    sget-object v0, Lqinlili/clean/CleanActivity;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lqinlili/clean/CacheUtils;->clearAllCache(Landroid/content/Context;)V

    return-void
.end method
