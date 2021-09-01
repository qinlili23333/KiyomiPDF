.class Lqinlili/clean/AllConfigFilenameFilter;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/FilenameFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lqinlili/clean/CleanActivity;->ConfigFilenameFilter()Ljava/io/FilenameFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic YZ:Lqinlili/clean/CleanActivity;


# direct methods
.method constructor <init>(Lqinlili/clean/CleanActivity;)V
    .registers 2

    iput-object p1, p0, Lqinlili/clean/AllConfigFilenameFilter;->YZ:Lqinlili/clean/CleanActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 4

    const/4 v0, 0x1

    return v0
.end method
