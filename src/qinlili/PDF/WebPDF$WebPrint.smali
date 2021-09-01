.class final Lqinlili/PDF/WebPDF$WebPrint;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Landroid/webkit/WebView;

.field final synthetic b:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/webkit/WebView;)V
    .registers 3

    iput-object p1, p0, Lqinlili/PDF/WebPDF$WebPrint;->b:Landroid/app/Activity;

    iput-object p2, p0, Lqinlili/PDF/WebPDF$WebPrint;->a:Landroid/webkit/WebView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-object v1, p0, Lqinlili/PDF/WebPDF$WebPrint;->a:Landroid/webkit/WebView;

    iget-object v0, p0, Lqinlili/PDF/WebPDF$WebPrint;->b:Landroid/app/Activity;

    const-string v2, "print"

    invoke-virtual {v0, v2}, Lqinlili/PDF/WebPDF;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/print/PrintManager;

    const-string v2, "小轻PDF打印"

    invoke-virtual {v1}, Landroid/webkit/WebView;->createPrintDocumentAdapter()Landroid/print/PrintDocumentAdapter;

    move-result-object v1

    new-instance v3, Landroid/print/PrintAttributes$Builder;

    invoke-direct {v3}, Landroid/print/PrintAttributes$Builder;-><init>()V

    invoke-virtual {v3}, Landroid/print/PrintAttributes$Builder;->build()Landroid/print/PrintAttributes;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3}, Landroid/print/PrintManager;->print(Ljava/lang/String;Landroid/print/PrintDocumentAdapter;Landroid/print/PrintAttributes;)Landroid/print/PrintJob;

    return-void
.end method
