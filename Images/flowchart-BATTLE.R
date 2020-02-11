#install.packages('diagram')
library(diagram)

################################################################################
### Generic workflow for adaptive trials
################################################################################
pdf("battle.pdf",width=8.5, height=10)
par(mar = c(0, 0, 0, 0), mai=c(0,0,0,0))
openplotmat()
elpos <- coordinates (c(1, 1, 2, 1, 1)) #, mx = 0.1, my = -0.1)
elpos[3,] <- c(0.2, 0.5)
elpos[4,] <- c(0.8, 0.5)
elpos[6,] <- c(0.2, 0.1)

straightarrow(from = elpos[1, ], to = elpos[2, ], arr.pos=0.73, arr.col = "blue", lcol = "blue")
straightarrow(from = elpos[2, ], to = elpos[4, ], arr.pos=0.73, arr.col = "blue", lcol = "blue")
straightarrow(from = elpos[3, ], to = elpos[2, ], arr.pos=0.73, arr.col = "blue", lcol = "blue")
straightarrow(from = elpos[4, ], to = elpos[5, ], arr.pos=0.73, arr.col = "blue", lcol = "blue")
straightarrow(from = elpos[5, ], to = elpos[3, ], arr.pos=0.73, arr.col = "blue", lcol = "blue")
straightarrow(from = elpos[5, ], to = elpos[6, ], arr.pos=0.73, arr.col = "blue", lcol = "blue")

textround(elpos[1, ], lab = "Begin Study",
          cex = 1.8, radx=0.15, rady=0.06, shadow.size=0)
textround(elpos[2, ], lab = "Enroll Subject",
          cex = 1.8, radx=0.15, rady=0.06, shadow.size=0)
textround(elpos[3, ], lab = "Alter Randamization \n Ratio",
          cex = 1.8, radx=0.15, rady=0.06, shadow.size=0)
textround(elpos[4, ], lab = "Analyze \n Patient Data",
          cex = 1.8, radx=0.15, rady=0.06, shadow.size=0)
textround(elpos[5, ], lab = "Stopping Rule Met? \n Enrolled Max Subjects?",
          cex = 1.8, radx=0.15, rady=0.06, shadow.size=0)
textround(elpos[6, ], lab = "Drugs graduate \n to next phase / \n drugs shut down",
          cex = 1.8, radx=0.15, rady=0.06, shadow.size=0)

text(x=0.657, y=0.625, "Interim Looks",
     pos=4, cex = 1.8, col = "green")
text(x=0.370, y=0.413, "No",
     pos=4, cex = 1.8, col = "green")
text(x=0.382, y=0.178, "Yes",
     pos=4, cex = 1.8, col = "green")
dev.off()

