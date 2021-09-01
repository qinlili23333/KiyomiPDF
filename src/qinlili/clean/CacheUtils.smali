.class public Lqinlili/clean/CacheUtils;
.super Ljava/lang/Object;


# direct methods
.method public static RecursionDeleteFile(Ljava/io/File;)V
    .registers 4

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    :cond_9
    :goto_9
    return-void

    :cond_a
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_19

    array-length v0, v1

    if-nez v0, :cond_1d

    :cond_19
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    goto :goto_9

    :cond_1d
    const/4 v0, 0x0

    :goto_1e
    array-length v2, v1

    if-lt v0, v2, :cond_25

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    goto :goto_9

    :cond_25
    aget-object v2, v1, v0

    invoke-static {v2}, Lqinlili/clean/CacheUtils;->RecursionDeleteFile(Ljava/io/File;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1e
.end method

.method public static clearAllCache(Landroid/content/Context;)V
    .registers 2

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lqinlili/clean/CacheUtils;->RecursionDeleteFile(Ljava/io/File;)V

    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lqinlili/clean/CacheUtils;->RecursionDeleteFile(Ljava/io/File;)V

    return-void
.end method

.method public static getFolderSize(Ljava/io/File;)J
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v2, 0x0

    int-to-long v0, v2

    :try_start_2
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_24

    move-result-object v3

    :goto_6
    :try_start_6
    array-length v4, v3

    if-lt v2, v4, :cond_a

    :goto_9
    return-wide v0

    :cond_a
    aget-object v4, v3, v2

    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1c

    aget-object v4, v3, v2

    invoke-static {v4}, Lqinlili/clean/CacheUtils;->getFolderSize(Ljava/io/File;)J

    move-result-wide v4

    add-long/2addr v0, v4

    :goto_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_1c
    aget-object v4, v3, v2

    invoke-virtual {v4}, Ljava/io/File;->length()J
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_21} :catch_29

    move-result-wide v4

    add-long/2addr v0, v4

    goto :goto_19

    :catch_24
    move-exception v2

    :goto_25
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_9

    :catch_29
    move-exception v2

    goto :goto_25
.end method

.method public static getFormatSize(D)Ljava/lang/String;
    .registers 12

    const/16 v9, 0x400

    const/4 v8, 0x4

    const/4 v7, 0x2

    const/4 v6, 0x1

    int-to-double v0, v9

    div-double v0, p0, v0

    int-to-double v2, v6

    cmpg-double v2, v0, v2

    if-gez v2, :cond_10

    const-string v0, "0K"

    :goto_f
    return-object v0

    :cond_10
    int-to-double v2, v9

    div-double v2, v0, v2

    int-to-double v4, v6

    cmpg-double v4, v2, v4

    if-gez v4, :cond_3d

    new-instance v2, Ljava/math/BigDecimal;

    invoke-static {v0, v1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v7, v8}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "KB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_f

    :cond_3d
    int-to-double v0, v9

    div-double v0, v2, v0

    int-to-double v4, v6

    cmpg-double v4, v0, v4

    if-gez v4, :cond_6a

    new-instance v0, Ljava/math/BigDecimal;

    invoke-static {v2, v3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, v7, v8}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "MB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_f

    :cond_6a
    int-to-double v2, v9

    div-double v2, v0, v2

    int-to-double v4, v6

    cmpg-double v4, v2, v4

    if-gez v4, :cond_98

    new-instance v2, Ljava/math/BigDecimal;

    invoke-static {v0, v1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v7, v8}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "GB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_f

    :cond_98
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, v2, v3}, Ljava/math/BigDecimal;-><init>(D)V

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, v7, v8}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "TB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_f
.end method

.method public static getTotalCacheSize(Landroid/content/Context;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lqinlili/clean/CacheUtils;->getFolderSize(Ljava/io/File;)J

    move-result-wide v0

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    const-string v3, "mounted"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lqinlili/clean/CacheUtils;->getFolderSize(Ljava/io/File;)J

    move-result-wide v2

    add-long/2addr v0, v2

    :cond_1d
    long-to-double v0, v0

    invoke-static {v0, v1}, Lqinlili/clean/CacheUtils;->getFormatSize(D)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
