library(cluster)
library(ggplot2)


##Vizulaizing the spread of keystone traits

setwd("C:/Users/Ishana/Documents/Hyperkeystone Thesis/R")
getwd()
dat<-read.csv("Diversity_of_keystones_suppList.csv")
head(dat)
summary(dat)

#Class x Role
class <- ggplot(data = dat, aes(x = class, fill = Type)) +
  geom_histogram(col = "black", position="stack", stat = "count") + xlab("Class") +
  ylab("Frequency") + theme_classic() + labs(fill = "Role") +
  theme(axis.text = element_text(size = 20))+
  theme(legend.text = element_text(size=25)) +
  theme(axis.title = element_text(size = 25)) + 
  scale_fill_manual(values = c("#EB949C", "#fcf3a7", "#99d6dc")) +
  theme(axis.text.x = element_text(angle = 33, hjust = 1)) +
  scale_x_discrete(limits = order) +
  theme(legend.title = element_text(size = 25)) +
  theme(legend.position = c(0.825,0.75))
class

# Mass x Role
dat$mass <- as.numeric(dat$mass)
mass_role <- ggplot(data = dat, aes(x=mass, fill = Type)) + 
  geom_histogram(col = "black", position="stack", bins = 9) +
  labs(fill = "Role") +
  theme_classic() + xlab("Mass") + ylab("Frequency")+
  theme(axis.text = element_text(size = 20))+
  theme(legend.text = element_text(size=25)) +
  theme(axis.title = element_text(size = 25)) + 
  scale_x_continuous(trans='log10') +
  scale_fill_manual(values = c("#EB949C", "#fcf3a7", "#99d6dc")) +
  theme(legend.title = element_text(size=25)) +
  theme(legend.position = c(0.85,0.8))
mass_role

#Community Response x Role
order <- c("Abundance", "Biodiversity", "Chemical and Energy Cycling", "Physical Effects", 
           "Life History" , "Behavioral")
CR_role <- ggplot(data = dat, aes(x = response_cat, fill = Type)) +
  geom_histogram(col = "black", position="stack", stat = "count") + xlab("Community Response") +
  ylab("Frequency") + theme_classic() + labs(fill = "Role") +
  theme(axis.text.x = element_text(angle = 33, hjust = 1)) +
  theme(axis.text = element_text(size = 17))+
  theme(legend.text = element_text(size=22)) +
  theme(axis.title = element_text(size = 25)) +
  scale_fill_manual(values = c("#EB949C", "#fcf3a7", "#99d6dc")) +
  theme(legend.title = element_text(size=25)) +
  scale_x_discrete(limits = order) +
  theme(legend.position = c(0.75,0.8))
CR_role

# Role x habitat
Role <- ggplot(data = dat, aes(x = Type, fill = habitat)) +
  geom_histogram(col = "black", position="stack", stat = "count") + xlab("Keystone Role") +
  ylab("Frequency") + theme_classic() + labs(fill = "Habitat") +
  theme(axis.text = element_text(size = 20))+
  theme(legend.text = element_text(size=25)) +
  theme(axis.title = element_text(size = 25)) + 
  theme(legend.title = element_text(size=25)) +
  theme(legend.position = c(0.85,0.8)) +
  scale_fill_manual(values = c("#355C7D", "#8FB9A8"))
Role
ggarrange(class, mass_role, CR_role, Role)

##K-means clustering Analysis

setwd("C:/Users/Ishana/Documents/Hyperkeystone Thesis/R")
getwd()
df<-read.csv("Diversity_of_keystones_index.csv")
head(df)
df <- df[,2:8]
df <- na.omit(df)
dat <- subset (df, select = - common_name)
dat <- subset(dat, select = - red_list)
dat$log.mass <- as.numeric(dat$log.mass)
str(dat)

dat <- scale(dat)
head(dat)

#Running an elbow validation analysis
k_num <-fviz_nbclust(dat, kmeans, method = "wss") 
k_num

#Running a sillhouette analysis
sil <- silhouette(km$cluster, dist(dat))
fviz_silhouette(sil)

#Running the k-means clustering analysis
set.seed(1)
km <- kmeans(dat, centers = 5, nstart = 25)
km
km$cluster
df$cluster <- km$cluster
df

#Vizualizing the cluster analysis
cluster <-fviz_cluster(km, data = dat,geom= "point") + theme_classic() 
cluster
