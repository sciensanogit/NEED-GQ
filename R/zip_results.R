fs::file_delete("results/results.zip")
res <- fs::dir_ls(
  c("results/figures", "results/tables"),
  recurse = TRUE
)
zip("results/results.zip", res)
