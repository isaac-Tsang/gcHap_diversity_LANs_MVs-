#提前第一个文件
haplo_data <- read.table("Os04t0585200-01.gene-lanCDS.haplo", header = TRUE)
haplo_col3 <- haplo_data[, 3]  # 提取第三列
write.table(haplo_col3, "Os04t0585200-01.gene-lanCDS_col3.txt", col.names=FALSE, row.names=FALSE)
#提取第二个文件
haplo_data <- read.table("Os02t0117500-01.xian-lanCDS.haplo", header = TRUE)
haplo_col3 <- haplo_data[, 3]  # 提取第三列
write.table(haplo_col3, "Os02t0117500-01.xian-lanCDS_col3.txt", col.names=FALSE, row.names=FALSE)

# 读取第一个文件
gene1 <- readLines("Os04t0585200-01.gene-lanCDS_col3.txt")

# 读取第二个文件
gene2 <- readLines("Os02t0117500-01.xian-lanCDS_col3.txt")

# 统计Os02t0117500-01.geng-lanCDS.haplo_col3.txt在Os02t0117500-01.gene-mvCDS.haplo_col3.txt中的相同和不同序列数
common_genes_1_2 = length(intersect(gene1, gene2))
different_genes_1_2 = length(setdiff(gene1, gene2))

# 统计Os02t0117500-01.gene-mvCDS.haplo_col3.txt在Os02t0117500-01.geng-lanCDS.haplo_col3.txt中的相同和不同序列数
common_genes_2_1 = length(intersect(gene2, gene1))
different_genes_2_1 = length(setdiff(gene2, gene1))

# 将结果写入文件
write(paste("在gene1.txt中，与gene2.txt共有", common_genes_1_2, "个相同序列，", different_genes_1_2, "个不同序列。\n在gene2.txt中，与gene1.txt共有", common_genes_2_1, "个相同序列，", different_genes_2_1, "个不同序列。"), file = "Os02t0117500-01.xian_comparison_result.txt")
