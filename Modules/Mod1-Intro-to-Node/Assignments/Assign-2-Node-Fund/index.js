function insertionSort(unsortedList) {
  let n = unsortedList.length;

  for (let i = 1; i < n; i++) {
    let temp = unsortedList[i];
    let j = i - 1;

    while (j >= 0 && unsortedList[j] > temp) {
      unsortedList[j + 1] = unsortedList[j];
      j--;
    }

    unsortedList[j + 1] = temp;
  }

  return unsortedList;
}
  
  console.log(insertionSort([14, 33, 27, 10, 35, 19, 42, 44]));


const isPrime = (num) => {
    for (let i = 2, s = Math.sqrt(num); i <= s; i++) {
      if (num % i === 0) return false;
    }
    return num > 1;
  };
  
function primeNumberDetector(possiblePrimeNumber) {
  console.log(`Is ${possiblePrimeNumber} a prime number?`);
  if (isPrime(possiblePrimeNumber)) {
    console.log(`Yes, ${possiblePrimeNumber} is a prime number`);
    return possiblePrimeNumber;
  }
  console.log(`No, ${possiblePrimeNumber} is not a prime number`);

  let higherPrime = possiblePrimeNumber;
  let lowerPrime = possiblePrimeNumber;
  const primeNumbers = [];
  while (true) {
    lowerPrime -= 1;
    if (isPrime(lowerPrime)) {
      console.log(`The next prime number after ${lowerPrime}`);
      primeNumbers.push(lowerPrime);
      break;
    }
  }
  while (true) {
    higherPrime += 1;
    if (isPrime(higherPrime)) {
      console.log(`The next prime number after ${higherPrime}`);
      primeNumbers.push(higherPrime);
      break;
    }
  }

  return primeNumbers;
}

function reverseList(inputList) {
  const reversed = [];
  const n = inputList.length;
  for (let i = n - 1; i >= 0; i--) {
    reversed.push(inputList[i]);
  }
  return reversed;
}

function unluckyLooping(inputArray) {
  let i = 0;
  while (i < inputArray.length) {
    console.log(inputArray[i]);
    if (inputArray[i] === 13) {
      console.log("Unlucky");
      break;
    } else if (isPrime(inputArray[i])) {
      inputArray.push(4);
    } else if (inputArray[i] % 2 !== 0) {
      i += 1;
    }
    i += 1;
  }
}
