.class Lqinlili/clean/CleanActivity$Export;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final this$0:Lqinlili/clean/CleanActivity;


# direct methods
.method constructor <init>(Lqinlili/clean/CleanActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqinlili/clean/CleanActivity$Export;->this$0:Lqinlili/clean/CleanActivity;

    return-void
.end method

.method static access$0(Lqinlili/clean/CleanActivity$Export;)Lqinlili/clean/CleanActivity;
    .registers 2

    iget-object v0, p0, Lqinlili/clean/CleanActivity$Export;->this$0:Lqinlili/clean/CleanActivity;

    return-object v0
.end method


# virtual methods
.method public run()V
    .registers 3
    .annotation runtime Ljava/lang/Override;
    .end annotation

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    const-string v1, "cp /data/user/0/moe.qinlili.kiyomipdf /storage/emulated/0//Download/KiyomiDataExport -RT"

    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_a

    :goto_9
    return-void

    :catch_a
    move-exception v0

    goto :goto_9
.end method
