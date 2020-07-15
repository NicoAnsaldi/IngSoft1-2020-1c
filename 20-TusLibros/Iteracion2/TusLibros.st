!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'objectFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'na 7/15/2020 08:38:21'!
test01NewCartsAreCreatedEmpty

	self assert: objectFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'na 7/15/2020 08:38:36'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := objectFactory createCart.
	
	self 
		should: [ cart add: objectFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'na 7/15/2020 08:38:53'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := objectFactory createCart.
	
	cart add: objectFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'na 7/15/2020 08:39:11'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := objectFactory createCart.
	
	self 
		should: [cart add: 0 of: objectFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'na 7/15/2020 08:39:28'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := objectFactory createCart.
	
	self 
		should: [cart add: 2 of: objectFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'na 7/15/2020 08:39:47'!
test06CartRemembersAddedItems

	| cart |
	
	cart := objectFactory createCart.
	
	cart add: objectFactory itemSellByTheStore.
	self assert: (cart includes: objectFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'na 7/15/2020 08:40:00'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := objectFactory createCart.
	
	self deny: (cart includes: objectFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'na 7/15/2020 08:40:17'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := objectFactory createCart.
	
	cart add: 2 of: objectFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: objectFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setUp' stamp: 'na 7/15/2020 08:38:12'!
setUp

	objectFactory := StoreTestObjectFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'objectFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'setUp' stamp: 'na 7/15/2020 08:43:32'!
setUp

	objectFactory := StoreTestObjectFactory new.! !


!CashierTest methodsFor: 'test' stamp: 'na 7/15/2020 09:31:56'!
test01CanNotCheckoutAnEmptyCart

	self
		should: [Cashier checkOut: objectFactory createCart 
							on: objectFactory createDateForSale 
							registerIn: objectFactory createSalesBook 
							debitOn: objectFactory createMerchantProcessor 
							using: objectFactory notExpiredCreditCard]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError |
								self assert: anError messageText = Cashier cartIsEmptyErrorDescription ]

		



	! !

!CashierTest methodsFor: 'test' stamp: 'na 7/15/2020 09:07:08'!
test02ChekoutACartWithAValidCard

	| cart cashier |
	
	cart := objectFactory createCart.
	cart add: 2 of: objectFactory itemSellByTheStore .
	
	cashier := Cashier checkOut: cart 
							on: objectFactory createDateForSale 
							registerIn: objectFactory createSalesBook 
							debitOn: objectFactory createMerchantProcessor 
							using: objectFactory notExpiredCreditCard.
	
	self assert: (cashier checkout) equals: 5000.! !

!CashierTest methodsFor: 'test' stamp: 'na 7/15/2020 09:33:29'!
test03DoNotRegisterWithAnExpiredCard

	| cart salesBook  |
	
	cart := objectFactory createCart.
	cart add: 1 of: objectFactory itemSellByTheStore.
	salesBook := objectFactory createSalesBook.
	
	self
		should: [Cashier checkOut: cart 
							on: objectFactory createDateForSale 
							registerIn: salesBook 
							debitOn: objectFactory createMerchantProcessor 
							using: objectFactory expiredCreditCard]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
								self assert: anError messageText = Cashier  expiredCardErrorDescription.
							  	self assert: (salesBook isEmpty).]! !

!CashierTest methodsFor: 'test' stamp: 'na 7/15/2020 09:28:54'!
test04RegisterASale

	| cart cashier salesBook|
	
	cart := objectFactory createCart.
	cart add: 1 of: objectFactory itemSellByTheStore.
	salesBook := objectFactory createSalesBook.
	cashier := Cashier checkOut: cart 
							on: objectFactory createDateForSale 
							registerIn: salesBook 
							debitOn: objectFactory createMerchantProcessor 
							using: objectFactory notExpiredCreditCard.
	
	self assert: (cashier checkout) equals: 2500.
	self assert: salesBook equals: (OrderedCollection newFrom: {2500}).! !

!CashierTest methodsFor: 'test' stamp: 'na 7/15/2020 09:34:09'!
test05DoNotRegisterASaleWithEmptyCard

	| cart salesBook|
	
	cart := objectFactory createCart.
	cart add: 1 of: objectFactory itemSellByTheStore.
	salesBook := objectFactory createSalesBook.
	
	self
		should: [Cashier checkOut: cart 
							on: objectFactory createDateForSale 
							registerIn: salesBook 
							debitOn: objectFactory createMerchantProcessor 
							using: objectFactory emptyCreditCard]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |  
							self assert: (salesBook isEmpty).
							self assert: anError messageText = Cashier  emptyCardErrorDescription ]! !


!classDefinition: #CreditCardTest category: #TusLibros!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'test' stamp: 'rjs 7/13/2020 20:58:36'!
test01CreateCreditCard

	| visa |

	visa := CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) thisOwner: 'Pepito' thisLimit: 15000 andThisAmount: 0.

	self assert: visa number equals: '1234567891234567'.
	self assert: visa date equals: (Month month: 2 year: 2020).
	self assert: visa owner equals: 'Pepito'.
	self assert: visa limit equals: 15000.
	self assert: visa amount equals: 0.
	! !

!CreditCardTest methodsFor: 'test' stamp: 'rjs 7/13/2020 20:59:55'!
test02ValidNumber

	self
	should: [ CreditCard createWithANumber: '123456789123456' thisDate: (Month month: 2 year: 2020) thisOwner: 'Pepe' thisLimit: 15000 andThisAmount: 0.  ]
	raise: Error
	withMessageText: [ CreditCard  InvalidCardErrorDescription ]! !

!CreditCardTest methodsFor: 'test' stamp: 'rjs 7/13/2020 21:00:06'!
test03ValidOwner

	self
	should: [ CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) thisOwner: ' ' thisLimit: 15000 andThisAmount: 0.  ]
	raise: Error
	withMessageText: [ CreditCard  InvalidCardErrorDescription ]
	! !

!CreditCardTest methodsFor: 'test' stamp: 'rjs 7/13/2020 21:00:39'!
test04isExpired

	| today visa |
	
	visa := CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) thisOwner: 'Pepito' thisLimit: 15000 andThisAmount: 0.

	today := DateAndTime now.
	
	self assert: (visa isExpired: today).
	
	


	! !


!classDefinition: #MerchantProcessorAdapterTest category: #TusLibros!
TestCase subclass: #MerchantProcessorAdapterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorAdapterTest methodsFor: 'as yet unclassified' stamp: 'rjs 7/13/2020 20:37:47'!
test01! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'rjs 7/12/2020 17:15:19'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

!Cart methodsFor: 'adding' stamp: 'rjs 7/12/2020 17:24:06'!
total

	^ items inject: 0 into: [:res :each | res + (catalog at: each)]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook cart date merchantProcessor creditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'na 7/15/2020 09:00:38'!
initializeWith: aCart on: aDate registerIn: aSalesBook debitOn: aMerchantProcessor using: aCreditCard.

	cart := aCart.
	date := aDate.
	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor.
	creditCard := aCreditCard.
	! !


!Cashier methodsFor: 'actions' stamp: 'na 7/15/2020 09:16:47'!
checkout

	salesBook add: cart total.
	^ cart total.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error' stamp: 'na 7/15/2020 09:18:58'!
cartIsEmptyErrorDescription

	^ ' el carrito esta vacio'! !

!Cashier class methodsFor: 'error' stamp: 'rjs 7/13/2020 21:07:37'!
emptyCardErrorDescription

	^ ' tarjeta sin saldo suficiente'! !

!Cashier class methodsFor: 'error' stamp: 'rjs 7/12/2020 17:30:30'!
expiredCardErrorDescription

	^ ' tarjeta expirada'! !


!Cashier class methodsFor: 'initialization' stamp: 'na 7/15/2020 09:32:13'!
checkOut: aCart on: aDate registerIn: aSalesBook debitOn: aMerchantProcessor using: aCreditCard  

	(aCart isEmpty) ifTrue: [ ^ self error: self cartIsEmptyErrorDescription ].
	(aCreditCard isExpired: aDate)  ifTrue: [ ^ self error: self expiredCardErrorDescription ].
	(aCreditCard canSell: aCart total) ifFalse: [ ^ self error: self emptyCardErrorDescription].

	^ self new initializeWith: aCart on: aDate registerIn: aSalesBook debitOn: aMerchantProcessor using: aCreditCard.
! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'owner number date limit amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'rjs 7/13/2020 20:55:00'!
initializeWithANumber: aNumber andADate: aDate andAnOwner: anOwner andALimit: aLimit andAnAmount: anAmount.

	number := aNumber.
	date := aDate.
	owner := anOwner.
	limit := aLimit.
	amount := anAmount.
	! !


!CreditCard methodsFor: 'accesing' stamp: 'rjs 7/13/2020 20:58:57'!
amount

	^ amount! !

!CreditCard methodsFor: 'accesing' stamp: 'rjs 7/13/2020 21:05:39'!
canSell: anAmount

	^ (amount + anAmount) < limit! !

!CreditCard methodsFor: 'accesing' stamp: 'rjs 7/6/2020 19:57:48'!
date

	^ date! !

!CreditCard methodsFor: 'accesing' stamp: 'rjs 7/13/2020 20:58:51'!
limit

	^ limit! !

!CreditCard methodsFor: 'accesing' stamp: 'rjs 7/6/2020 19:57:34'!
number

	^ number! !

!CreditCard methodsFor: 'accesing' stamp: 'rjs 7/6/2020 19:57:55'!
owner

	^ owner! !


!CreditCard methodsFor: 'actions' stamp: 'rjs 7/12/2020 16:33:01'!
isExpired: today

	^  (today yearNumber > date yearNumber) or: [ (today yearNumber = date yearNumber) and:[ (today monthIndex > date monthIndex) ] ]


! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'error' stamp: 'rjs 7/12/2020 16:11:10'!
InvalidCardErrorDescription

 	^ 'Tarjeta invalida'! !


!CreditCard class methodsFor: 'assertions' stamp: 'rjs 7/12/2020 16:15:13'!
checkName: anOwner

	(anOwner = ' ' ) ifTrue: [ ^ self error: self InvalidCardErrorDescription ]! !

!CreditCard class methodsFor: 'assertions' stamp: 'rjs 7/12/2020 16:14:56'!
checkNumber: aNumber.

	(aNumber size = 16) ifFalse: [ ^ self error: self InvalidCardErrorDescription ]! !


!CreditCard class methodsFor: 'initialization' stamp: 'rjs 7/13/2020 20:56:26'!
createWithANumber: aNumber thisDate: aDate thisOwner: anOwner thisLimit: aLimit andThisAmount: anAmount.

	self checkName: anOwner.
	self checkNumber: aNumber.

	^ self new initializeWithANumber: aNumber andADate: aDate andAnOwner: anOwner andALimit: aLimit andAnAmount: anAmount.! !


!classDefinition: #MerchantProcessorAdapter category: #TusLibros!
Object subclass: #MerchantProcessorAdapter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!classDefinition: #StoreTestObjectFactory category: #TusLibros!
Object subclass: #StoreTestObjectFactory
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectFactory methodsFor: 'as yet unclassified' stamp: 'na 7/15/2020 08:37:04'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectFactory methodsFor: 'as yet unclassified' stamp: 'na 7/15/2020 08:41:36'!
createDateForSale
	
	^ (Month month: 07 year: 2019)
		! !

!StoreTestObjectFactory methodsFor: 'as yet unclassified' stamp: 'na 7/15/2020 09:02:57'!
createMerchantProcessor

	^MerchantProcessorAdapter new.! !

!StoreTestObjectFactory methodsFor: 'as yet unclassified' stamp: 'na 7/15/2020 08:41:45'!
createSalesBook
	
	^ OrderedCollection new.! !

!StoreTestObjectFactory methodsFor: 'as yet unclassified' stamp: 'na 7/15/2020 08:41:27'!
defaultCatalog
	
	^ Dictionary new at: self itemSellByTheStore put: 2500; yourself.! !

!StoreTestObjectFactory methodsFor: 'as yet unclassified' stamp: 'na 7/15/2020 08:41:59'!
emptyCreditCard
	
	^ CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2025) thisOwner: 'Pepito' thisLimit: 1500 andThisAmount: 1500.
		
! !

!StoreTestObjectFactory methodsFor: 'as yet unclassified' stamp: 'na 7/15/2020 08:42:14'!
expiredCreditCard
	
	^ CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2018) thisOwner: 'Pepito' thisLimit: 150000 andThisAmount: 0.
		
! !

!StoreTestObjectFactory methodsFor: 'as yet unclassified' stamp: 'na 7/15/2020 08:37:23'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectFactory methodsFor: 'as yet unclassified' stamp: 'na 7/15/2020 08:37:34'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectFactory methodsFor: 'as yet unclassified' stamp: 'na 7/15/2020 08:42:45'!
notExpiredCreditCard
	
	^ CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2025) thisOwner: 'Pepito' thisLimit: 150000 andThisAmount: 0.
		
! !
