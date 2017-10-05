# r-ifelse-makes-no-gd-sense

## How binary operators work in R
### (or, how R turned boolean operations into bastardized ternary operations and made everything make no sense whatsoever)

Here's how R evaluates the boolean values of an object, its negation, the or operator, and the and operator.  Also, how ifelse uses those to decide what to return.

I still need to sit down and figure out exactly how R handles order of operation.

#### A

if A == NA: return NA

else if A == FALSE or A == 0: return FALSE

else: return TRUE

#### !A

if A == NA: return NA

else if A == FALSE or A == 0: return TRUE

else: return FALSE

#### A|B

if A == TRUE or B == TRUE: return TRUE

else if A == NA or B == NA: return NA

else: return FALSE

#### A&B

if A == FALSE or B == FALSE: return FALSE

else if A == NA or B == NA: return NA

else: return TRUE

#### ifelse(A, YES, NO)

if A == NA: return NA

else if A == TRUE: return YES

else: return NO
