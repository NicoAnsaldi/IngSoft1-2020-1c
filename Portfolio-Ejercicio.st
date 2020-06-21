!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 19:42:03'!
test01AnEmptyPortfolioHasAnEmptyBalance

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0.
	self assert: portfolio transactions equals: (OrderedCollection new).

	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 16:41:26'!
test02TransactionOfAPortfolioAreTheTransactionsOfTheReceptiveAccount

	| portfolio account aTransaction |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	aTransaction := Deposit register: 100 on: account.
	
	self assert: portfolio transactions equals: (OrderedCollection newFrom: {aTransaction.}).

	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 16:43:40'!
test03TransactionOfAPortfolioAreTheTransactionsOfTwoTheReceptiveAccounts

	| portfolio account1 account2 aTransaction1 aTransaction2|
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	portfolio add: account1.
	portfolio add: account2.
	aTransaction1 := Deposit register: 100 on: account1.
	aTransaction2 := Deposit register: 100 on: account2.
	
	self assert: portfolio transactions equals: (OrderedCollection newFrom: {aTransaction1.aTransaction2}).

	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 16:56:23'!
test04TransactionsOfAPortfolioOfAccountsAndPortfoliosResolveRecursively

	| portfolio1 portfolio2 account1 account2 account3 aTransaction1 aTransaction2 aTransaction3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3:= ReceptiveAccount new.
	
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio2 add: portfolio1.
	portfolio2 add: account3.
	
	
	aTransaction1 := Deposit register: 1 on: account1.
	aTransaction2 := Deposit register: 2 on: account2.
	aTransaction3 := Deposit register: 3 on: account3.
	
	self assert: portfolio2 transactions equals: (OrderedCollection newFrom: {aTransaction1. aTransaction2. aTransaction3}).

	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 17:02:04'!
test05BalanceOfAPortfolioIsTheBalanceOfTheReceptiveAccount

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	Deposit register: 100 on: account.
	
	self assert: portfolio balance equals: 100
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 17:04:47'!
test06BalanceOfAPortfolioIsTheBalanceOfAccountsAndPortofoliosBalances

	| portfolio1 portfolio2 account1 account2 account3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3:= ReceptiveAccount new.
	
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio2 add: portfolio1.
	portfolio2 add: account3.
	
	Deposit register: 1 on: account1.
	Deposit register: 2 on: account2.
	Deposit register: 3 on: account3.
	
	self assert: portfolio2 balance equals: 6.! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 17:06:39'!
test07HasRegisteredOfAPortfolioIsTheHasRegisteredOfTheReceptiveAccount

	| portfolio account aTransaction |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	aTransaction := Deposit register: 100 on: account.
	
	self assert: (portfolio hasRegistered: aTransaction)
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 17:08:18'!
test08HasRegisteredOfAPortfolioIsTheHasRegisteredOfTheAccountsAndPortfolios

	| portfolio1 portfolio2 account1 account2 account3 aTransaction1 aTransaction2 aTransaction3 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3:= ReceptiveAccount new.
	
	portfolio1 add: account1.
	portfolio1 add: account2.
	portfolio2 add: portfolio1.
	portfolio2 add: account3.
	
	aTransaction1 := Deposit register: 1 on: account1.
	aTransaction2 := Deposit register: 2 on: account2.
	aTransaction3 := Deposit register: 3 on: account3.
	
	self assert: (portfolio2 hasRegistered: aTransaction1).
	self assert: (portfolio2 hasRegistered: aTransaction2).
	self assert: (portfolio2 hasRegistered: aTransaction3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 17:21:06'!
test09APortfolioCanNotAddTheSameAccountTwice

	| portfolio account  |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.

	portfolio add: account.
		
	self
	should: [ portfolio add: account.]
	raise: Error
	withMessageText: [	self assert: portfolio balance equals: 0.
		 						self assert: portfolio transactions equals: OrderedCollection  new.
								Portfolio CanNotAddAnAccountTwiceErrorDescription ]
! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 19:30:53'!
test10APortfolioCanNotAddTheSameAccountThatHasHisDirectFather

	| portfolio1 portfolio2 account1 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	
	portfolio2 add: account1.
	portfolio2 add: portfolio1.
	
	
	self
	should: [ portfolio1 add: account1. ]
	raise: Error
	withMessageText: [Portfolio CanNotAddAnAccountTwiceErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 18:39:09'!
test11APortfolioCanNotAddTheSameAccountThatHasHisDirectSon

	| portfolio1 portfolio2 account1 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	account1 := ReceptiveAccount new.
	
	portfolio1 add: account1.
	portfolio2 add: portfolio1.
	
	
	self
	should: [ portfolio2 add: account1.]
	raise: Error
	withMessageText: [Portfolio CanNotAddAnAccountTwiceErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 18:56:04'!
test12APortfolioWithAnAccountCanNotAddItSelf

	| portfolio1  account1 |
	
	portfolio1 := Portfolio new.
	account1 := ReceptiveAccount new.
	
	portfolio1 add: account1.
	
	self
	should: [ portfolio1 add: portfolio1]
	raise: Error
	withMessageText: [Portfolio CanNotAddAnAccountTwiceErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 19:06:51'!
test13APortfolioCanNotAddAnAccountThatItsOwnedByARoot

	| portfolio1 portfolio2 portfolio3 portfolio4 portfolio5 account1 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio4 := Portfolio new.
	portfolio5 := Portfolio new.
	account1 := ReceptiveAccount new.
	
	portfolio1 add: portfolio2.
	portfolio2 add: portfolio3.
	portfolio4 add: portfolio3.
	portfolio5 add: portfolio4.
	portfolio1 add: account1.
	portfolio5 add: account1.
	
	self
	should: [ portfolio3 add: account1]
	raise: Error
	withMessageText: [Portfolio CanNotAddAnAccountTwiceErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 19:40:45'!
test14CannotAddPortfoliosTwiceWithNoDirectParentsInBetween

	| portfolio1 portfolio2 portfolio3 account1 |
	
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	account1 := ReceptiveAccount new.
	
	portfolio1 add: account1.
	portfolio2 add: account1.
	portfolio2 add: portfolio3.
	
	self
	should: [ portfolio3 add: portfolio1]
	raise: Error
	withMessageText: [Portfolio CanNotAddAnAccountTwiceErrorDescription ]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/18/2020 17:33:13'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:40:39'!
applyToBalance: aBalance

	^ aBalance + self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'rjs 6/18/2020 19:30:16'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:40:48'!
applyToBalance: aBalance

	^ aBalance - self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'assertions' stamp: 'rjs 6/21/2020 19:38:40'!
checkPortfolioCanAdd: anAccount

	self parentsRootSearch do: [:each | each hasRegisteredThisAccount: anAccount ].
! !


!Portfolio methodsFor: 'add - private' stamp: 'rjs 6/21/2020 17:42:32'!
addParent: aPortfolio

	parents add: aPortfolio.! !

!Portfolio methodsFor: 'add - private' stamp: 'rjs 6/21/2020 18:52:38'!
hasRegisteredThisAccount: anAccount

		(accounts select: [:each | (each hasRegisteredThisAccount: anAccount) or: [anAccount hasRegisteredThisAccount: each] ]  ) size > 0 ifTrue: [ ^ self error: self class CanNotAddAnAccountTwiceErrorDescription. ].
		
		^ false! !

!Portfolio methodsFor: 'add - private' stamp: 'rjs 6/21/2020 19:24:52'!
parentsRootSearch

	| res |
	
	res := OrderedCollection new.
	
	res add: self rootParents.
	
	^ res! !

!Portfolio methodsFor: 'add - private' stamp: 'rjs 6/21/2020 19:30:35'!
rootParents

	(parents isEmpty) ifTrue: [^self].
	
	parents do:[ :each | ^ each rootParents ]
! !


!Portfolio methodsFor: 'accesing' stamp: 'rjs 6/21/2020 17:38:06'!
balance

	^ accounts inject: 0 into: [ :sum :each  | sum + each balance ].! !

!Portfolio methodsFor: 'accesing' stamp: 'rjs 6/18/2020 21:16:08'!
hasRegistered: aTransaction

 	^ self transactions  includes: aTransaction
! !

!Portfolio methodsFor: 'accesing' stamp: 'rjs 6/21/2020 17:38:15'!
transactions

	| res |
	
	res := OrderedCollection  new.
	
	accounts do: [ :each |  res addAllLast: (each transactions) ].
	
	^ res.
! !


!Portfolio methodsFor: 'initialization' stamp: 'rjs 6/21/2020 17:37:45'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'actions' stamp: 'rjs 6/21/2020 19:38:52'!
add: anAccount

	self checkPortfolioCanAdd: anAccount.
	
	accounts add: anAccount.
	
	anAccount addParent: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'initialization' stamp: 'rjs 6/18/2020 20:09:54'!
new
 ^ self basicNew initialize .! !


!Portfolio class methodsFor: 'error' stamp: 'rjs 6/21/2020 17:16:54'!
CanNotAddAnAccountTwiceErrorDescription
	 ^ ' No podes Agregar la misma cuenta 2 veces '.! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'rjs 6/18/2020 20:43:07'!
balance
	
	^ transactions inject: 0 into: [ :sum :aTransaction | aTransaction applyToBalance: sum].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'private' stamp: 'rjs 6/21/2020 17:39:37'!
addParent: aPortfolio

	^ self! !

!ReceptiveAccount methodsFor: 'private' stamp: 'rjs 6/21/2020 18:19:02'!
hasRegisteredThisAccount: anAccount

	^ self = anAccount! !
