.class Lqinlili/PDF/WebPDF$Exit;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lqinlili/PDF/WebPDF;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Load"
.end annotation


# instance fields
.field private final this$0:Lqinlili/PDF/WebPDF;


# direct methods
.method constructor <init>(Lqinlili/PDF/WebPDF;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqinlili/PDF/WebPDF$Exit;->this$0:Lqinlili/PDF/WebPDF;

    return-void
.end method

.method static access$0(Lqinlili/PDF/WebPDF$Exit;)Lqinlili/PDF/WebPDF;
    .registers 2

    iget-object v0, p0, Lqinlili/PDF/WebPDF$Exit;->this$0:Lqinlili/PDF/WebPDF;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    iget-object v0, p0, Lqinlili/PDF/WebPDF$Exit;->this$0:Lqinlili/PDF/WebPDF;

    const-string v1, "用户取消了操作"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    invoke-virtual {v0}, Lqinlili/PDF/WebPDF;->finishAndRemoveTask()V

    return-void
.end method
