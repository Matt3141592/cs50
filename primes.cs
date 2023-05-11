<?
	set_time_limit(60); // problem must be completed within a minute
	$max = 1000000; // the highest possible number
	
	$primes = array(2, 3); // start the prime numbers array
	// this uses a prime seive, see the MC FAQ for info on that
	for ($a = 5; $a < $max; $a+=2)
	{
		$is_prime = true; // guilty until proven innocent ;)
		foreach($primes as $prime)
		{
			// if the current prime is over the square root just break, nothing else needs to be checked
			if ($prime > sqrt($a))
				break;
			// see if it divides exactly	
			if (!($a % $prime))
			{
				// if so, it can't be prime
				$is_prime = false;
				break;
			}
		}
		// if the number didn't divide into anything, it must be prime. so add it the primes array
		if ($is_prime)
			$primes[] = $a;
		
		// this is used so only numbers either side of intervals of six are checked i.e. 5/7 11/13 17/19 23/25 etc
		if ($switch)
			$a+=2;
		// reverse switch	
		$switch = !$switch;
	}	
	// loop through all the primes. this loop never completes, it is always terminated early
	for($a = 0; $a < count($primes); $a++)
	{
		// only check sequences that have a length of above the current longest sequence, otherwise there's no point checking it. for example (using primes 2, 3, 5, 7):
		// first run: check 2 3 then 2 3 5 then 2 3 5 7
		// second run: check 3 5 then 3 5 7
		// third run: check 5 7
		// although it usually gets terminated early because it reaches a point where no more numbers would be valid		
		for ($b = $highest[0]+1; $b < count($primes)-$a; $b++)
		{
			// add up the prime numbers contained in this slice
			$all = array_sum(array_slice($primes, $a, $b));
			// check if the amount is in the prime array
			if (in_array($all, $primes))
				// length, prime
				$highest = array($b, $all);
			// if the current sequence is over the limit all the following will be as well, so break
			if ($all >= $max)
			{
				// if we break on the first time this loop has been run, the maximum must have been found because everything else will be too high. so set 'a' to be it's maximum which breaks out of both loops
				if ($b == $highest[0]+1)
					$a = count($primes);
				// break out of the current loop	
				$b = count($primes);
			}	
		}
	}		
	// show the highest prime number
	echo $highest[1];
?>