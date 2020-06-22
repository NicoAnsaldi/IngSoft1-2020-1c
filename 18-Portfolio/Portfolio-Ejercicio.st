!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:23:44'!
test01AnEmptyPortfolioHasAnEmptyBalanceAndEmptyTransactions

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0.
	self assert: portfolio transactions equals: (OrderedCollection new).

	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:31:23'!
test02TransactionOfAPortfolioAreTheTransactionsOfTheReceptiveAccount

	| portfolio account aTransaction |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	aTransaction := Deposit register: 100 on: account.
	
	self assert: portfolio transactions equals: (OrderedCollection newFrom: {aTransaction.}).

	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:31:36'!
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

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:31:50'!
test04TransactionsOfAPortfolioOfAccountsAndPortfoliosResolveRecursively

	| portfolioChild portfolioFather account1 account2 account3 aTransaction1 aTransaction2 aTransaction3 |
	
	portfolioChild := Portfolio new.
	portfolioFather := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3:= ReceptiveAccount new.
	
	portfolioChild add: account1.
	portfolioChild add: account2.
	portfolioFather add: portfolioChild.
	portfolioFather add: account3.
	
	
	aTransaction1 := Deposit register: 1 on: account1.
	aTransaction2 := Deposit register: 2 on: account2.
	aTransaction3 := Deposit register: 3 on: account3.
	
	self assert: portfolioFather transactions equals: (OrderedCollection newFrom: {aTransaction1. aTransaction2. aTransaction3}).
	self assert: portfolioChild transactions equals: (OrderedCollection newFrom: {aTransaction1.aTransaction2}).
	
	
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

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:33:21'!
test06BalanceOfAPortfolioIsTheBalanceOfAccountsAndPortofoliosBalances

	| portfolioChild portfolioFather account1 account2 account3 |
	
	portfolioChild := Portfolio new.
	portfolioFather := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3:= ReceptiveAccount new.
	
	portfolioChild add: account1.
	portfolioChild add: account2.
	portfolioFather add: portfolioChild.
	portfolioFather add: account3.
	
	Deposit register: 1 on: account1.
	Deposit register: 2 on: account2.
	Deposit register: 3 on: account3.
	
	self assert: portfolioFather balance equals: portfolioChild balance + account3 balance.
	self assert: portfolioChild balance equals: account1 balance + account2 balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'rjs 6/21/2020 17:06:39'!
test07HasRegisteredOfAPortfolioIsTheHasRegisteredOfTheReceptiveAccount

	| portfolio account aTransaction |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	aTransaction := Deposit register: 100 on: account.
	
	self assert: (portfolio hasRegistered: aTransaction)
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:34:37'!
test08HasRegisteredOfAPortfolioIsTheHasRegisteredOfTheAccountsAndPortfolios

	| portfolioChild portfolioFather account1 account2 account3 aTransaction1 aTransaction2 aTransaction3 |
	
	portfolioChild := Portfolio new.
	portfolioFather := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3:= ReceptiveAccount new.
	
	portfolioChild add: account1.
	portfolioChild add: account2.
	portfolioFather add: portfolioChild.
	portfolioFather add: account3.
	
	aTransaction1 := Deposit register: 1 on: account1.
	aTransaction2 := Deposit register: 2 on: account2.
	aTransaction3 := Deposit register: 3 on: account3.
	
	self assert: (portfolioFather hasRegistered: aTransaction1).
	self assert: (portfolioFather hasRegistered: aTransaction2).
	self assert: (portfolioFather hasRegistered: aTransaction3).
	self assert: (portfolioChild hasRegistered: aTransaction1).
	self assert: (portfolioChild hasRegistered: aTransaction2).! !

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:37:31'!
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
								Portfolio canNotAddAnAccountTwiceErrorDescription ]
! !

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:37:31'!
test10APortfolioCanNotAddTheSameAccountThatHasHisDirectFather

	| portfolioChild portfolioFather account1 |
	
	portfolioChild := Portfolio new.
	portfolioFather := Portfolio new.
	account1 := ReceptiveAccount new.
	
	portfolioFather add: account1.
	portfolioFather add: portfolioChild.
	
	
	self
	should: [ portfolioChild add: account1. ]
	raise: Error
	withMessageText: [ Portfolio canNotAddAnAccountTwiceErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:38:01'!
test11APortfolioCanNotAddTheSameAccountThatHasHisDirectSon

	| portfolioChild portfolioFather account1 |
	
	portfolioChild := Portfolio new.
	portfolioFather := Portfolio new.
	account1 := ReceptiveAccount new.
	
	portfolioChild add: account1.
	portfolioFather add: portfolioChild.
	
	
	self
	should: [ portfolioFather add: account1.]
	raise: Error
	withMessageText: [Portfolio canNotAddAnAccountTwiceErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:38:28'!
test12APortfolioWithAnAccountCanNotAddItSelf

	| portfolio  account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	
	self
	should: [ portfolio add: portfolio]
	raise: Error
	withMessageText: [Portfolio canNotAddAnAccountTwiceErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:40:54'!
test13APortfolioCanNotAddAnAccountThatItsOwnedByARoot

	| portfolioRootLeft portfolioFatherLeft portfolioChild portfolioFatherRight portfolioRootRight account |
	
	portfolioRootLeft := Portfolio new.
	portfolioFatherLeft := Portfolio new.
	portfolioChild := Portfolio new.
	portfolioFatherRight := Portfolio new.
	portfolioRootRight := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolioRootLeft add: portfolioFatherLeft.
	portfolioFatherLeft add: portfolioChild.
	portfolioFatherRight add: portfolioChild.
	portfolioRootRight add: portfolioFatherRight.
	portfolioRootLeft add: account.
	portfolioRootRight add: account.
	
	self
	should: [ portfolioChild add: account]
	raise: Error
	withMessageText: [Portfolio canNotAddAnAccountTwiceErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'na 6/22/2020 08:42:35'!
test14CannotAddPortfoliosTwiceWithNoDirectParentsInBetween

	| otherPortfolio portfolioFather portfolioChild account |
	
	otherPortfolio := Portfolio new.
	portfolioFather := Portfolio new.
	portfolioChild := Portfolio new.
	account := ReceptiveAccount new.
	
	otherPortfolio add: account.
	portfolioFather add: account.
	portfolioFather add: portfolioChild.
	
	self
	should: [ portfolioChild add: otherPortfolio]
	raise: Error
	withMessageText: [Portfolio canNotAddAnAccountTwiceErrorDescription ]! !


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


!classDefinition: #Account category: #'Portfolio-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Account methodsFor: 'add - private' stamp: 'na 6/22/2020 08:44:26'!
addParent: aPortfolio

	^self subclassResponsibility ! !

!Account methodsFor: 'add - private' stamp: 'na 6/22/2020 08:45:07'!
hasRegisteredThisAccount: anAccount

	^self subclassResponsibility ! !


!Account methodsFor: 'accsesing' stamp: 'na 6/22/2020 08:44:42'!
balance

	^self subclassResponsibility ! !

!Account methodsFor: 'accsesing' stamp: 'na 6/22/2020 08:44:54'!
hasRegistered: aTransaction

	^self subclassResponsibility ! !

!Account methodsFor: 'accsesing' stamp: 'na 6/22/2020 08:45:46'!
transactions

	^self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Account subclass: #Portfolio
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

!Portfolio methodsFor: 'add - private' stamp: 'na 6/22/2020 08:37:31'!
hasRegisteredThisAccount: anAccount

		(accounts select: [:each | (each hasRegisteredThisAccount: anAccount) or: [anAccount hasRegisteredThisAccount: each] ]  ) size > 0 ifTrue: [ ^ self error: self class canNotAddAnAccountTwiceErrorDescription. ].
		
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

!Portfolio methodsFor: 'accesing' stamp: 'na 6/22/2020 08:55:00'!
transactions

	| res |
	
	res := OrderedCollection  new.
	
	accounts do: [ :each |  res addAllLast: (each transactions) ].
	
	^ res
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


!Portfolio class methodsFor: 'error' stamp: 'na 6/22/2020 08:37:31'!
canNotAddAnAccountTwiceErrorDescription
	 ^ ' No podes Agregar la misma cuenta 2 veces '.! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Account subclass: #ReceptiveAccount
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


!ReceptiveAccount methodsFor: 'add - private' stamp: 'rjs 6/21/2020 17:39:37'!
addParent: aPortfolio

	^ self! !

!ReceptiveAccount methodsFor: 'add - private' stamp: 'rjs 6/21/2020 18:19:02'!
hasRegisteredThisAccount: anAccount

	^ self = anAccount! !


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
