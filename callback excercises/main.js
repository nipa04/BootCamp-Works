const transactions = [
  {
    type: 'sale',
    paymentMethod: 'cash',
    customer: 'Isaac Asimov',
    items: [
      { name: 'Byte', price: 1.00 },
      { name: 'Bit', price: 0.125 }
    ]
  },
  {
    type: 'sale',
    paymentMethod: 'credit',
    customer: 'CJ Cherryh',
    items: [
      { name: 'Bit', price: 0.125 },
      { name: 'Bit', price: 0.125 },
      { name: 'Bit', price: 0.125 }
    ]
  },
  {
    type: 'purchase',
    paymentMethod: 'credit',
    vendor: 'Dick\'s Doodads',
    items: [
      { name: 'XL Doodad', price: -3.00 },
      { name: 'XS Doodad', price: -0.50 },
      { name: 'XS Doodad', price: -0.50 }
    ]
  },
  {
    type: 'purchase',
    paymentMethod: 'cash',
    vendor: 'Gibson Gadgets',
    items: [
      { name: 'Basic Gadget', price: -2.00 },
      { name: 'Advanced Gadget', price: -3.50  }
    ]
  },
  {
    type: 'sale',
    paymentMethod: 'credit',
    customer: 'Frederik Pohl',
    items: [
      { name: 'Byte', price: 1.00 },
      { name: 'Byte', price: 1.00 },
      { name: 'Bit', price: 0.125 },
      { name: 'Bit', price: 0.125 },
      { name: 'Bit', price: 0.125 }
    ]
  },
  {
    type: 'purchase',
    paymentMethod: 'cash',
    vendor: 'Clarke Computing',
    items: [
      { name: 'Floppy Disk', price: -0.10 },
      { name: 'Floppy Disk', price: -0.10 },
      { name: 'Floppy Disk', price: -0.10 },
      { name: 'Floppy Disk', price: -0.10 },
      { name: 'Floppy Disk', price: -0.10 },
      { name: 'Floppy Disk', price: -0.10 },
      { name: 'Floppy Disk', price: -0.10 }
    ]
  },
  {
    type: 'sale',
    paymentMethod: 'credit',
    customer: 'Neal Stephenson',
    items: [
      { name: 'kilobyte', price: 1024.00 }
    ]
  },
  {
    type: 'purchase',
    paymentMethod: 'credit',
    vendor: 'Gibson Gadgets',
    items: [
      { name: 'Advanced Gadget', price: -3.50  },
      { name: 'Advanced Gadget', price: -3.50  },
      { name: 'Advanced Gadget', price: -3.50  },
      { name: 'Advanced Gadget', price: -3.50  }
    ]
  },
  {
    type: 'purchase',
    paymentMethod: 'credit',
    vendor: 'Dick\'s Doodads',
    items: [
      { name: 'XL Doodad', price: -3.00 },
      { name: 'XL Doodad', price: -3.00 },
      { name: 'XL Doodad', price: -3.00 }
    ]
  },
  {
    type: 'sale',
    paymentMethod: 'cash',
    customer: 'Isaac Asimov',
    items: [
      { name: 'Bit', price: 0.125 },
      { name: 'Bit', price: 0.125 },
      { name: 'Bit', price: 0.125 },
      { name: 'Bit', price: 0.125 },
      { name: 'Bit', price: 0.125 },
      { name: 'Bit', price: 0.125 },
      { name: 'Bit', price: 0.125 },
      { name: 'Bit', price: 0.125 },
    ]
  }
];


// --------------------------------------------------
// EXAMPLE QUESTION
// --------------------------------------------------
/*
  Calculate the total number of transactions.
*/
const totalTransactions = transactions.length;

console.log( 'The total number of transactions is:', totalTransactions );


// --------------------------------------------------
// QUESTION 01
// --------------------------------------------------
/*
  Calculate the total number of 'sales'.

  HINT(S):
  - Not all transactions are 'sales'.
*/


// Using Loop
const numSales = [];
transactions.forEach(function(transaction) {
  if (transaction['type'] == 'sale') {
    numSales.push(transaction);
  }
})

console.log( 'The total number of sales is:', numSales.length );


/*
  Hey, welcome to the first question!

  Here's a breakdown of the question, and some pointers on how to get started!
    - A variable has been declared a few lines above (`numSales`).
    - Just below, the contents of the `numSales` variable are logged to the console.
    - Your job is to assign the variable to the correct value (in this case: the total number of sales) *BEFORE* it is logged out.
    - You can do this by:
      - Adding an `=` sign (we are *assigning* something after all)
      - Starting with the `transactions` variable (see the example question);
      - Adding one or more methods to transform/extract the value we're looking for.
      - If your solution is correct, `numSales` should be equal to 5.

  You can solve the remaining questions in the same way!

  P.S.
  The breakdown above takes up a lot of space, feel free to move it to the top or bottom of the file!
*/
//
// console.log( 'The total number of sales is:', totalNumSales );


// --------------------------------------------------
// QUESTION 02
// --------------------------------------------------
/*
  Calculate the total number of 'purchases'.
*/
// using loop
const numPurchases = [];

transactions.forEach(function(transaction) {
  if (transaction['type'] == 'purchase') {
    numPurchases.push(transaction);
  }
})

console.log( 'The total number of purchases is:', numPurchases.length );


// --------------------------------------------------
// QUESTION 03
// --------------------------------------------------
/*
  Calculate the total number of 'cash' 'sales'.

  HINT(S):
  - Don't forget that 'purchases' can also be made in 'cash'!
*/

// using forEach
const numCashSales = [];

numSales.forEach(function(saleTransaction) {
  if (saleTransaction['paymentMethod'] == 'cash') {
    numCashSales.push(saleTransaction);
  }
})

console.log( 'The total number of cash sales is:', numCashSales.length );



// --------------------------------------------------
// QUESTION 04
// --------------------------------------------------
/*
  Calculate the total number of 'credit' 'purchases'.

  HINT(S):
  - Make sure to exclude any 'sales' made by 'credit'!
*/

// using forEach
var numCreditPurchases = [];

numPurchases.forEach(function(purchaseTransaction){
  if (purchaseTransaction['paymentMethod'] == 'credit'){
    numCreditPurchases.push(purchaseTransaction);
  }
})

console.log( 'The total number of credit purchases is:', numCreditPurchases.length );


// --------------------------------------------------
// QUESTION 05
// --------------------------------------------------
/*
  Create an array that includes all of vendors which appear in the transactions data set.
  eg. `[ 'vendor one', 'vendor two', ... ]

  HINT(S):
  - Not all transactions have a 'vendor'!
  - The assembled array should be made up of strings, not full `transaction` objects.
  - This array is allowed to contain duplicate values.
*/
var allVendors = [];

transactions.forEach(function(transaction){
  if (transaction['vendor']){
    allVendors.push(transaction['vendor'])
  }
})

console.log( 'The vendors are:', allVendors );


// --------------------------------------------------
// QUESTION 06
// --------------------------------------------------
/*
  Create an array that includes all of the *unique* customers which appear in the transactions data set.
  eg. `[ 'customer one', 'customer two', ... ]

  HINT(S):
  - Not all transactions have a 'customer'!
  - The assembled array should be made up of strings, not full `transaction` objects.
  - Make sure that the resulting array *does not* include any duplicates.
*/
const customersWithDuplicates = [];

transactions.forEach(function(transaction){
  if (transaction['customer']){
    customersWithDuplicates.push(transaction['customer'])
  }
})

const notDuplicatedCustomer = (customer, index) => customersWithDuplicates.indexOf(customer) >= index;

var uniqueCustomers = customersWithDuplicates.filter(notDuplicatedCustomer);
console.log( 'The unique customers are:', uniqueCustomers );


// --------------------------------------------------
// QUESTION 07
// --------------------------------------------------
/*
  Create an array of information about the 'sale' transactions which include 5 or more items.

  The array should resemble the following:
  [ { name: 'Customer Name', numItems: 5 }, ... ]

  HINT(S):
  - There may be more than 1 'sale' that includes 5 or more items.
  - Individual transactions do not have either `name` or `numItems` properties, we'll have to add them to the output.
*/
const bigSpenders = [];


numSales.forEach(function(saleTransaction) {
  if (saleTransaction['items'].length >= 5) {
    bigSpenders.push({ 'name': saleTransaction['customer'], 'numItems': saleTransaction['items'].length })
  }
})

console.log( 'The "big spenders" are:', bigSpenders );


// --------------------------------------------------
// QUESTION 08
// --------------------------------------------------
/*
  Calculate the sum of the *first* 'sale' transaction.

  HINT(S):
  - Transactions don't have 'prices', but their 'items' do!
*/

// var firstSale = numSales[0];
var prices = [];
var sumFirstSale;

numSales[0]['items'].forEach(function(item) {
  prices.push(item['price']);
  sumFirstSale = prices.reduce(function(a, b) { return a + b });
})

console.log( 'The sum of the first sale items is:', sumFirstSale );


// --------------------------------------------------
// QUESTION 09
// --------------------------------------------------
/*
  Calculate the sum of *all* 'purchase' transactions.

  HINT(S):
  - Your solution to 'QUESTION 08' is a good starting point!
  - Make sure to include 'price' information from *all* purchases.
*/

var sumPurchases;
var prices = [];

numPurchases.forEach(function(purchaseTransaction) {
    purchaseTransaction['items'].forEach(function(item) {
    prices.push(item['price']);
    sumPurchases = prices.reduce(function(a, b) { return a + b });
  })
})

// console.log(prices);
console.log( 'The sum of all purchases is:', sumPurchases );


// --------------------------------------------------
// QUESTION 10
// --------------------------------------------------
/*
  Calculate the company's net profit.

  This number will be positive if the sum of the sales is greater than the amount spent on purchases.

  Otherwise, this number will be negative.

  HINT(S):
  - Unlike 'QUESTION 08' and 'QUESTION 09', here we're interested in both 'sale' and 'purchase' transactions.
*/


var netProfit;
var prices = [];

transactions.forEach(function(transaction) {
  transaction['items'].forEach(function(item) {
    prices.push(item['price']);
    netProfit = prices.reduce(function(a, b) { return a + b });
  })
})

console.log( 'The net profit is:', netProfit );


// --------------------------------------------------
// QUESTION 11
// --------------------------------------------------
/*
  Calculate the most items sold as part of single transaction.

  HINTS:
  - The result of this calculation should be a number (not an array, object, or other data type).
*/

var mostItems;
var numItems = [];

numSales.forEach(function(saleTransaction) {
  numItems.push(saleTransaction['items'].length);
  numItems.sort();
  mostItems = numItems[numItems.length - 1];
})

console.log( 'The most items sold in a single transaction is:', mostItems );


// --------------------------------------------------
// QUESTION 12
// --------------------------------------------------
/*
  Calculate the sum of the 'purchase' with the fewest items.
*/

var sumOfSmallestPurchase;
var numItems = [];

var smallestTransaction = numPurchases[0];

numPurchases.forEach(transaction => {
  if (transaction.items.length < smallestTransaction.items.length) {
    smallestTransaction = transaction;
  }
})

var sumOfSmallestPurchase = smallestTransaction.items.reduce((total, item) => total += item.price, 0)


console.log( 'The sum of the smallest purchase is:', sumOfSmallestPurchase );
