package demos

import briefj.BriefIO
import java.util.ArrayList
import java.util.Map
import blang.runtime.Runner

class Main {
  public static val name = "name"
  public static val description = "description"
  public static val arguments = "arguments"
  public static val classColumn = "class"
  
  def static void main(String [] args) {
    if (args.length === 0) {
      System.err.println("First argument is a demo name from this list:")
      printModels
      System.exit(1)
    }
    else {
      val modelInfo = findModel(args.get(0))
      val combined = new ArrayList
      combined.addAll(args.subList(1, args.length))
      combined.addAll(modelInfo.get(arguments).split("\\s+")) 
      combined.addAll(#["--model", modelInfo.get(classColumn)])
      val String[] combinedArray = newArrayOfSize(combined.size)
      System.exit(Runner.start(combined.toArray(combinedArray)))
    }
  }
  
  def static Map<String,String> findModel(String requestedName) {
    for (line : readModels)
      if (line.get(name) == requestedName)
        return line
    System.err.println("Model not found: " + requestedName)
    System.err.println("Available:")
    printModels
    System.exit(1);
    throw new RuntimeException
  }
  
  def static void printModels() {
    for (line : readModels)
      System.err.println("\t" + line.get(name) + ":\t" + line.get(description))
  }
  
  def static readModels() {
    return BriefIO::readLinesFromResource("/demos/models.csv").indexCSV
  }
}