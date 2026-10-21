# Cau hinh dung chung cho tat ca cac Part (Project_chap4_dataEA)
# Duoc goi bang: source(here::here("config", "setup.R")) trong main.Rmd.
# Moi duong dan du lieu dung here::here(...) de khong phu thuoc working directory.

if (!requireNamespace("here", quietly = TRUE)) install.packages("here")

packages <- c(
  "here",      # xac dinh thu muc goc project
  "rstatix",   # mshapiro_test, box_m, levene_test, welch_anova_test, t_test, ...
  "car",       # Manova, Anova
  "vegan",     # adonis2 (PERMANOVA), betadisper
  "corrplot",  # ma tran tuong quan
  "tidyr",     # pivot_longer
  "dplyr",     # xu ly du lieu
  "knitr"      # kable, child document
)

missing_pkgs <- setdiff(packages, rownames(installed.packages()))
if (length(missing_pkgs) > 0) install.packages(missing_pkgs)
invisible(lapply(packages, library, character.only = TRUE))

set.seed(2026)

# So lan lap cho hoan vi / bootstrap
B_lan <- 999

# Dinh dang p-gia tri: 3 chu so co nghia, giu dang luy thua cho so rat nho
fp <- function(x) sapply(x, function(v) format(signif(v, 3), digits = 3))

# Muc do vi pham gia dinh theo quy uoc cua mon hoc
muc_do <- function(pv) ifelse(pv >= 0.05, "Thỏa", ifelse(pv >= 1e-4, "Vi phạm nhẹ", "Vi phạm nặng"))
