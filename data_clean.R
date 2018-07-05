library(haven)
idhs_data = read_dta("idhs_data.dta")
saveRDS(idhs_data, file = "idhs_data.rds")
idhs_data = readRDS("idhs_data.rds")
#Create country varible
idhs_data$country[which(idhs_data$sample == 7166)] = "Zimbabwe"
idhs_data$country[which(idhs_data$sample == 8005)] = "Uganda"
idhs_data$country[which(idhs_data$sample == 8346)] = "Tanzania"
idhs_data$country[which(idhs_data$sample == 8544)] = "Burkina Faso"
idhs_data$country[which(idhs_data$sample == 8945)] = "Zambia"
idhs_data$country[which(idhs_data$sample == 1204)] = "Cameroon"
idhs_data$country[which(idhs_data$sample == 1802)] = "Congo"
idhs_data$country[which(idhs_data$sample == 2044)] = "Benin"
idhs_data$country[which(idhs_data$sample == 507)] = "Bangladesh"
idhs_data$country[which(idhs_data$sample == 2886)] = "Ghana"
idhs_data$country[which(idhs_data$sample == 3243)] = "Guinea"
idhs_data$country[which(idhs_data$sample == 3563)] = "India"
idhs_data$country[which(idhs_data$sample == 3843)] = "Cote d'Ivoire"
idhs_data$country[which(idhs_data$sample == 4046)] = "Kenya"
idhs_data$country[which(idhs_data$sample == 4504)] = "Madagascar"
idhs_data$country[which(idhs_data$sample == 4545)] = "Malawi"
idhs_data$country[which(idhs_data$sample == 4665)] = "Mali"
idhs_data$country[which(idhs_data$sample == 5083)] = "Mozambique"
idhs_data$country[which(idhs_data$sample == 5624)] = "Niger"
idhs_data$country[which(idhs_data$sample == 5665)] = "Nigeria"
idhs_data$country[which(idhs_data$sample == 6465)] = "Rwanda"

# Number of month between interview date and children birth date
idhs_data$child_month_cmc = idhs_data$intdatecmc - idhs_data$kiddobcmc

# Truncate data with children have more than 12-month observation
data_idhs = idhs_data[which(idhs_data$child_month_cmc > 12), ]

# Mortality indicator under 12 months
data_idhs$mortality.under12m = 0
data_idhs$mortality.under12m[which(data_idhs$kidagediedimp <= 12)] = 1

saveRDS(data_idhs, file = "idhs_data_12mon.rds")



