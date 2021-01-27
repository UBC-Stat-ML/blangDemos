package demos

import blang.runtime.internals.DefaultPostProcessor
import blang.runtime.Runner
import java.io.File
import blang.inits.experiments.tabwriters.factories.CSV

class EigthSchoolsProcessor extends DefaultPostProcessor {
  
  override run() {
    
    val samples = new File(blangExecutionDirectory.get, Runner::SAMPLES_FOLDER)
    
    val thetas = CSV.csvFile(samples, "thetas")
    val tau = CSV.csvFile(samples, "tau")
    val mu = CSV.csvFile(samples, "mu")
    val rScript = new File(blangExecutionDirectory.get, ".eight-schools-post-process.r")
    
    callR(rScript, '''
      require("ggplot2")
      require("dplyr")
      
      thetas <- read.csv("«thetas.absolutePath»")
      tau <- read.csv("«tau.absolutePath»")
      mu <- read.csv("«mu.absolutePath»")
            
            
      muTau <- data.frame(mus = mu$value, taus = tau$value)
      p <- ggplot(muTau, aes(y = log(taus), x = mus)) + geom_point() + theme_bw()
             
      ggsave("«blangExecutionDirectory.get»/muTau.pdf", p) 
      
      «FOR s : #['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']»
      theta«s» <- thetas %>% filter(schools == "«s»")
      
      combined <- data.frame(logtau = log(tau$value), theta = theta«s»$value)
      
      p <- ggplot(combined, aes(y = logtau, x = theta)) + geom_point() + theme_bw()
      
      ggsave("«blangExecutionDirectory.get»/joint«s».pdf", p)
      «ENDFOR»
      
    ''')
    
    super.run
  }
}