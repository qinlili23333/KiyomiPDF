.class Lqinlili/PDF/WebPDF$Load;
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

    iput-object p1, p0, Lqinlili/PDF/WebPDF$Load;->this$0:Lqinlili/PDF/WebPDF;

    return-void
.end method

.method static access$0(Lqinlili/PDF/WebPDF$Load;)Lqinlili/PDF/WebPDF;
    .registers 2

    iget-object v0, p0, Lqinlili/PDF/WebPDF$Load;->this$0:Lqinlili/PDF/WebPDF;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 8

    const/4 v4, 0x0

    iget-object v0, p0, Lqinlili/PDF/WebPDF$Load;->this$0:Lqinlili/PDF/WebPDF;

    iget-object v0, v0, Lqinlili/PDF/WebPDF;->et:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_30

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file:///android_asset/pdf/web/viewer.html?file="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lqinlili/PDF/WebPDF$Load;->this$0:Lqinlili/PDF/WebPDF;

    iget-object v1, v1, Lqinlili/PDF/WebPDF;->w:Landroid/webkit/WebView;

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :goto_2f
    return-void

    :cond_30
    iget-object v0, p0, Lqinlili/PDF/WebPDF$Load;->this$0:Lqinlili/PDF/WebPDF;

    const-string v1, "你啥也没输入"

    invoke-static {v0, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lqinlili/PDF/WebPDF;->et:Landroid/widget/EditText;

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "PDF地址"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, v0, Lqinlili/PDF/WebPDF;->et:Landroid/widget/EditText;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "确定"

    new-instance v3, Lqinlili/PDF/WebPDF$Load;

    invoke-direct {v3, v0}, Lqinlili/PDF/WebPDF$Load;-><init>(Lqinlili/PDF/WebPDF;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "取消"

    new-instance v3, Lqinlili/PDF/WebPDF$Exit;

    invoke-direct {v3, v0}, Lqinlili/PDF/WebPDF$Exit;-><init>(Lqinlili/PDF/WebPDF;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog;->setCancelable(Z)V

    goto :goto_2f
.end method
