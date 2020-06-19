!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:48:43'!
test01AnEmptyPortfolioHasAnEmptyBalance

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0.

	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:48:48'!
test02AddAccount

	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	
	self assert: portfolio insides equals: (OrderedCollection newFrom: {account}).

	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:48:53'!
test03SeesIfAnAccountsHasMadeATransaction

	| portfolio account aTransaction|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	aTransaction := Deposit register: 100 on: account.
	
	
	self assert: portfolio insides equals: (OrderedCollection newFrom: {account}).
	self assert: (portfolio hasRegistered: aTransaction).
	
	

	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:48:58'!
test04SeeAllTransactions

	| portfolio account aTransaction1 aTransaction2 aTransaction3|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	aTransaction1 := Deposit register: 100 on: account.
	aTransaction2 := Deposit register: 10 on: account.
	aTransaction3 := Deposit register: 90 on: account.
	
	
	self assert: portfolio insides equals: (OrderedCollection newFrom: {account}).
	self assert: portfolio transactions equals: (OrderedCollection newFrom: {aTransaction1. aTransaction2. aTransaction3}).
	
	

	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:49:03'!
test05Balance

	| portfolio account aTransaction1 aTransaction2 aTransaction3|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	aTransaction1 := Deposit register: 100 on: account.
	aTransaction2 := Deposit register: 10 on: account.
	aTransaction3 := Deposit register: 90 on: account.
	
	
	self assert: portfolio insides equals: (OrderedCollection newFrom: {account}).
	self assert: portfolio transactions equals: (OrderedCollection newFrom: {aTransaction1. aTransaction2. aTransaction3}).
	self assert: portfolio balance equals: 200.
	
	

	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:57:42'!
test06CanHandleMoreThanOneAccount

	| portfolio account1 account2 account3 aTransaction1 aTransaction2 aTransaction3|
	
	portfolio := Portfolio new.
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	
	portfolio add: account1.
	portfolio add: account2.
	portfolio add: account3.
	aTransaction1 := Deposit register: 100 on: account1.
	aTransaction2 := Deposit register: 10 on: account2.
	aTransaction3 := Deposit register: 90 on: account3.
	
	self assert: (portfolio hasRegistered: aTransaction1).
	self assert: (portfolio hasRegistered: aTransaction2).
	self assert: (portfolio hasRegistered: aTransaction3).
	self assert: portfolio insides equals: (OrderedCollection newFrom: {account1. account2. account3.}).
	self assert: portfolio transactions equals:  (OrderedCollection newFrom: {aTransaction1. aTransaction2. aTransaction3}).
	self assert: portfolio balance equals: 200.
	
	

	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 21:14:28'!
test07PortfolioDoNotKnowNotRegisteredTransactions

	| portfolio account aTransaction1 aTransaction2 |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio add: account.
	aTransaction1 :=  Deposit for: 100.
	aTransaction2 := Withdraw for: 50.
		
	self assert: portfolio balance equals: 0.
	self deny: (portfolio hasRegistered: aTransaction1).
	self deny: (portfolio hasRegistered: aTransaction2).

	self assert: portfolio insides equals: (OrderedCollection newFrom: {account}).
	self assert: portfolio transactions equals:  (OrderedCollection newFrom: {}).

	
	

	
	! !


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
	instanceVariableNames: 'cuentas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:11:13'!
add: anAccount

	cuentas add: anAccount! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 21:18:33'!
balance

	^ cuentas inject: 0 into: [ :sum :each  | sum + each balance ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 21:16:08'!
hasRegistered: aTransaction

 	^ self transactions  includes: aTransaction
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:13:52'!
initialize

	cuentas := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:11:03'!
insides

	^ cuentas copy! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 21:09:07'!
transactions

	| res |
	
	res := OrderedCollection  new.
	
	cuentas do: [ :each |  res addAllLast: (each transactions) ].
	
	^ res.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'rjs 6/18/2020 20:09:54'!
new
 ^ self basicNew initialize .! !


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
