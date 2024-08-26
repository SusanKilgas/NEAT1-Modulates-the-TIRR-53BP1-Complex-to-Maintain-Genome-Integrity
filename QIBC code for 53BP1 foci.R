library(ggplot2)

G1 <- which(10000<TIRR_KO$`TOTAL DAPI` & TIRR_KO$`TOTAL DAPI` < 45000 & TIRR_KO$`EDU MEAN` <800)
EarlyS <- which(10000<TIRR_KO$`TOTAL DAPI`& TIRR_KO$`TOTAL DAPI`< 45000 & 10<TIRR_KO$`EDU MEAN` & TIRR_KO$`EDU MEAN`<20000)
MidS <- which(45000<TIRR_KO$`TOTAL DAPI`& TIRR_KO$`TOTAL DAPI`< 60000 & 1000<TIRR_KO$`EDU MEAN` & TIRR_KO$`EDU MEAN`<22000)
LateS <- which(60000<TIRR_KO$`TOTAL DAPI` & TIRR_KO$`TOTAL DAPI`< 90000 & 800<TIRR_KO$`EDU MEAN` & TIRR_KO$`EDU MEAN`<22000)
G2 <- which(60000<TIRR_KO$`TOTAL DAPI`&TIRR_KO$`TOTAL DAPI` <90000 & TIRR_KO$`EDU MEAN`<800)


ggplot(TIRR_KO, aes(x=`TOTAL DAPI`, y= `EDU MEAN`, color= `EDU MEAN`))+
  scale_color_gradient(low = "GREY", high = "RED") +
  geom_point(data = TIRR_KO[G1, ], position = "jitter") +
  geom_point(data = TIRR_KO[EarlyS, ], position = "jitter") +
  geom_point(data = TIRR_KO[MidS, ], position = "jitter") +
  geom_point(data = TIRR_KO[LateS, ], position = "jitter") +
  geom_point(data= TIRR_KO[G2, ],  position = "jitter") +
  scale_y_log10(limit=c(50,50000), name= "Mean Intensity EDU (A.U.)") +
  scale_x_continuous(limit= c(10000,100000), name = "Total DAPI Intensity (A.U.)")+
  theme(panel.background = element_blank()) +
  ggtitle("U2OS TIRR KO")+
  theme(plot.title = element_text(hjust = 0.5)) 
  
 getwd()
 setwd("/Users/susankilgas/downloads")
 write.csv(TIRR_KO[G1, ], file= "Ctrl_G1_EDU_area.csv")
 write.csv(TIRR_KO[EarlyS, ], file= "Ctrl_EarlyS_EDU_area.csv")
 write.csv(TIRR_KO[MidS, ], file= "Ctrl_MidS_EDU_area.csv")
 write.csv(TIRR_KO[LateS, ], file= "Ctrl_LateS_EDU_area.csv")
 write.csv(TIRR_KO[G2, ], file= "Ctrl_G2_EDU_area.csv")
 


 