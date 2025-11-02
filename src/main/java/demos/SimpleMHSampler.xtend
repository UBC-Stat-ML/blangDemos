package demos

import bayonet.distributions.Random
import blang.core.WritableRealVar
import blang.mcmc.MHSampler
import blang.mcmc.SampledVariable
import blang.mcmc.internals.Callback

class SimpleMHSampler extends MHSampler {
	
	@SampledVariable
  	protected WritableRealVar variable;
 
	override propose(Random random, Callback callback)
  	{
	    val oldValue = variable.doubleValue()
	    callback.setProposalLogRatio(0.0)
	    variable.set(oldValue + random.nextGaussian())
	    if (!callback.sampleAcceptance())
	      variable.set(oldValue);
  	}
			
}