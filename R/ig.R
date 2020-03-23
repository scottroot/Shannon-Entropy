ig <- function(root, df, ignore){
  library(entropy)

  # CALC ROOT ENTROPY
  e0 = entropy.empirical(table(df[,root])/length(df[,root]), unit="log2")
  # GET TARGET VARIABLES
  vars = colnames(df)                  # get names of all variables in dataset
  vars = vars[vars != root]            # remove the parent name

  if(missing(ignore)) {                # remove the ignored columns
  } else {
    remove_length <- length(ignore)
    for(i in 1:remove_length){ vars = vars[vars != ignore[i]] }
  }  #close if(...) missing 'ignore' argument
  varsTotal = length(vars)             # store how many variables (columns) there are, aside from the parent
  nameRoot = unique(df[,root])         # get all the values of the root (e.g. Yes/No)
  lenRoot = length(nameRoot)           # store how many diff values Root variable has
  for(k in 1:varsTotal){               # loop through all vars
    nameVar = unique(df[,vars[k]])   # get all the values of the var (e.g. Yes/No)
    lenVar = length(nameVar)         # store how many diff value this var has
    ent_sum = 0                      # initialize ent_sum as 0 so it starts over for each iteration
    for(i in 1:lenVar){              # for-loop through # of factors in variable
      assign( paste("varVal",i,sep=''), as.character(nameVar[i]) ) # stored as varVal
      tempVar <- subset(df, eval(parse(text = vars[k])) == eval(parse(text = paste("varVal",i, sep=''))))
      tempEnt <- entropy.empirical(table(tempVar[root])/length(tempVar), unit="log2")
      tempPct <- nrow(tempVar)/nrow(df)
      ent_sum = ent_sum + tempEnt*tempPct
      assign(paste("ig_", vars[k], sep=''), e0-ent_sum)
      assign(paste("ent_", vars[k], sep=''), ent_sum)
    }
  }   # close loop on columns

  ig_df <- data.frame(matrix(ncol = 3))  # create output dataframe
  colnames(ig_df)<- c("name","entropy", "info_gain")  # give colnames to dataframe
  ig_df <- rbind(ig_df, c(name = paste("root = ",root,sep=''), value = round(e0,6), info_gain=0 ))   # add root entropy to the dataframe
  for(i in 1:varsTotal){              # add the names and values to the dataframe
    key <-  vars[i]
    val <-  as.numeric(round(eval(parse(text = paste("ig_",vars[i],sep=''))), 6))
    ent <-  as.numeric(round(eval(parse(text = paste("ent_",vars[i],sep=''))), 6))
    ig_df <- rbind(ig_df,  c(name=key,  entropy=ent,  info_gain = val)  )
  }

  results <- na.omit(data.frame(ig_df))
  results.sort <- data.frame(do.call(cbind, lapply( results[order(results$info_gain),] , rev)))
  return(results.sort)
}


# ig(root = "pep", df = bank, ignore = c("id"))
