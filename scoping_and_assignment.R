# These six functions demonstrate what <<- operator actually does... and its perils.

# "Observe the plans within plans within plans." -- Baron Vladimir Harkonnen

# This file can be sourced in its entirety.

# <<- assignment operator tries to "re"-assign a value to an object in the parent environment.
# If there is no such object, it goes up, until it reaches the global environment (the regular
# workspace, that is). And then it assigns globally.

# The clue to what this means is that in R it is possible to define functions within functions 
# within functions, and the environment in which a function is defined is the one that is parent 
# to whatever is inside that function. I.e., if I define a function in my workspace, the 
# workspace is parent. If I define functionprime within function, function becomes parent to
# functionprime. If functiondoubleprime is defined within functionprime, functionprime is its
# parent environment. And so forth. That's "lexical scoping" in action.

# The potential trap is in the sentence from "Assignment Operators" help page: <<- searches 
# "through parent environments ... If such a variable is found ... then its value is redefined, 
# otherwise assignment takes place in the global environment." These operators can by design or,
# more likely, inadvertently escape their function environments and invade the workspace, possibly
# corrupting objects already in it.

# Here is a demonstration.    

# msf stands for mysumfunction 

# This is our benign appetizer:

msf0 <- function(x){
	summa <- sum(x)
	return(summa)
}

msf1 <- function(x, y = 2){
	summa <- sum(x)
	randommagicvariable <<- y # Where did this one come from? It is now global!
	return(summa)
}

# Try running ls()... you'll discover an unexpected object in your workspace.

msf2 <- function(x){
	summa <- sum(x)
	msf1 <<- NULL # Look at this monster... it silently kills the sourced msf1 function!
	return(summa)
}

# If you try running msf1 AFTER msf2, R will complain that there is no such function!

msf3 <- function(x, y = 2){
	summa <- sum(x)
	summapower <- function(p, q){
		pwr <- p ^ q
		randomjunk <<- q # randomjunk also escapes globally from all the way inside msf3!
		return(pwr)
		}
	powr <- summapower(summa, y)
	return(powr)
}

msf4 <- function(x, y = 2){
	randomjunk <- NULL
	summa <- sum(x)
	summapower <- function(p, q){
		pwr <- p ^ q
		randomjunk <<- q # This time randomjunk can't escape because by now there is 
					# a (NULL) object with that name in summapower's parent environment
		return(pwr)
		}
	powr <- summapower(summa, y)
	cat("Newly locally stored value of randomjunk:", randomjunk, "\n")
	cat("Here is a list of objects in msf4 environment:\n", ls(), "\n")
	return(powr)
}

# msf4 includes code to list local objects inside it - just to show the difference between
# the various environments. It has things like summa and randomjunk in it, but it doesn't
# have either global objects (such as other msf-family functions) or objects from the inside
# of summapower, such as p and q, objects local to summapower. Since randomjunk belongs to
# msf4 and isn't returned by it, it doesn't escape to the global workspace.

msf5 <- function(x, y = 2){
	summa <- sum(x)
	summapower <- function(p, q){
		pwr <- p ^ q
		return(pwr)
		}
	powr <- summapower(summa, y)
	msf0 <<- NULL
	msf1 <<- NULL
	msf2 <<- NULL
	msf3 <<- NULL
	msf4 <<- NULL
	msf5 <<- NULL # This is a suicidal function. It NULLs itself and the rest of the family.
	return(powr)
}
