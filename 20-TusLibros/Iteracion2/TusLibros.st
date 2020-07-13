!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'rjs 7/12/2020 17:17:10'!
defaultCatalog
	
	^ Dictionary new at: self itemSellByTheStore put: 0; yourself.! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'rjs 7/12/2020 17:13:07'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'test' stamp: 'rjs 7/12/2020 16:47:55'!
createCatalog
	
	^ Dictionary new at: self libroValido put: 2500; yourself.
		

! !

!CashierTest methodsFor: 'test' stamp: 'rjs 7/12/2020 17:01:52'!
createDateForSale
	
	^ (Month month: 07 year: 2019)
		

! !

!CashierTest methodsFor: 'test' stamp: 'rjs 7/12/2020 17:55:10'!
createSalesBook
	
	^ OrderedCollection new.
		

! !

!CashierTest methodsFor: 'test' stamp: 'rjs 7/12/2020 17:25:16'!
expiredCreditCard
	
	^ CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2018) andThisOwner: 'Pepito'.
		
! !

!CashierTest methodsFor: 'test' stamp: 'rjs 7/12/2020 17:13:12'!
libroValido
	
	^ 'validBook'
		

! !

!CashierTest methodsFor: 'test' stamp: 'rjs 7/12/2020 17:55:28'!
test01CanNotCheckoutAnEmptyCart

	| aCart aCashier |
	
	aCart := Cart acceptingItemsOf: self createCatalog.
	aCashier := Cashier createWith: aCart and: self createDateForSale and: self createSalesBook .
	

	self
		should: [ aCashier checkoutWithACard: self validCreditCard ]
		raise: Error
		withMessageText: [ Cashier ErrorDescription ]

		



	! !

!CashierTest methodsFor: 'test' stamp: 'rjs 7/12/2020 17:55:33'!
test02CreateTicketWithAValidCard

	| aCart aCashier |
	
	aCart := Cart acceptingItemsOf: self createCatalog.
	aCart add: 1 of: self libroValido.
	
	aCashier := Cashier createWith: aCart and: self createDateForSale and: self createSalesBook.
	
	self assert: (aCashier checkoutWithACard: self validCreditCard) equals: 2500.! !

!CashierTest methodsFor: 'test' stamp: 'rjs 7/12/2020 17:59:37'!
test03CreateTicketWithAnExpiredCard

	| aCart aCashier aSalesBook  |
	
	aCart := Cart acceptingItemsOf: self createCatalog.
	aCart add: 1 of: self libroValido.
	aSalesBook := self createSalesBook.
	aCashier := Cashier createWith: aCart and: self createDateForSale and: aSalesBook.
	
	self
	should: [ aCashier checkoutWithACard: self expiredCreditCard  ]
	raise: Error
	withMessageText: [  self assert: (aSalesBook isEmpty).
							Cashier  expiredCardErrorDescription ]! !

!CashierTest methodsFor: 'test' stamp: 'rjs 7/12/2020 17:57:30'!
test04RegisterASale

	| aCart aCashier aSalesBook|
	
	aCart := Cart acceptingItemsOf: self createCatalog.
	aCart add: 1 of: self libroValido.
	aSalesBook := self createSalesBook.
	aCashier := Cashier createWith: aCart and: self createDateForSale and: aSalesBook.
	
	self assert: (aCashier checkoutWithACard: self validCreditCard) equals: 2500.
	self assert: aSalesBook equals: (OrderedCollection newFrom: {2500}).! !

!CashierTest methodsFor: 'test' stamp: 'rjs 7/12/2020 16:53:57'!
validCreditCard
	
	^ CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2025) andThisOwner: 'Pepito'.
		
! !


!classDefinition: #CreditCardTest category: #TusLibros!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'test' stamp: 'rjs 7/12/2020 16:18:10'!
test01CreateCreditCard

	| visa |

	visa := CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) andThisOwner: 'Pepito'.
	
	self assert: visa number equals: '1234567891234567'.
	self assert: visa date equals: (Month month: 2 year: 2020).
	self assert: visa owner equals: 'Pepito'.
	! !

!CreditCardTest methodsFor: 'test' stamp: 'rjs 7/12/2020 16:17:57'!
test02ValidName

	self
	should: [ CreditCard createWithANumber: '123456789123456' thisDate: (Month month: 2 year: 2020) andThisOwner: 'Pepe'.  ]
	raise: Error
	withMessageText: [ CreditCard  InvalidCardErrorDescription ]! !

!CreditCardTest methodsFor: 'test' stamp: 'rjs 7/12/2020 16:18:00'!
test03ValidOwner

	self
	should: [ CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) andThisOwner: ' '.  ]
	raise: Error
	withMessageText: [ CreditCard  InvalidCardErrorDescription ]
	! !

!CreditCardTest methodsFor: 'test' stamp: 'rjs 7/12/2020 16:33:32'!
test04isExpired

	| today visa |
	
	visa := CreditCard createWithANumber: '1234567891234567' thisDate: (Month month: 2 year: 2020) andThisOwner: 'Pepito'.

	today := DateAndTime now.
	
	self assert: (visa isExpired: today).
	
	


	! !


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
	instanceVariableNames: 'salesBook cart date'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'rjs 7/12/2020 17:53:35'!
initializeWith: aCart and: aDate and: aSalesBook

	cart := aCart.
	date := aDate.
	salesBook := aSalesBook.! !


!Cashier methodsFor: 'actions' stamp: 'rjs 7/12/2020 17:58:19'!
checkoutWithACard: aCard

	(cart isEmpty) ifTrue: [ ^ self error: self class ErrorDescription ].
	(aCard isExpired: date)  ifTrue: [ ^ self error: self class expiredCardErrorDescription ].
	
	salesBook add: cart total.
	
	^ cart total.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error' stamp: 'rjs 7/6/2020 20:44:31'!
ErrorDescription

	^ ' el carrito esta vacio'! !

!Cashier class methodsFor: 'error' stamp: 'rjs 7/12/2020 17:30:30'!
expiredCardErrorDescription

	^ ' tarjeta expirada'! !


!Cashier class methodsFor: 'initialization' stamp: 'rjs 7/12/2020 17:53:58'!
createWith: aCart and: aDate and: aSalesBook

	^ self new initializeWith: aCart and: aDate and: aSalesBook.
! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'owner number date'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'rjs 7/6/2020 19:52:54'!
initializeWithANumber: aNumber andADate: aDate andAnOwner: anOwner.

	number := aNumber.
	date := aDate.
	owner := anOwner.
	! !


!CreditCard methodsFor: 'accesing' stamp: 'rjs 7/6/2020 19:57:48'!
date

	^ date! !

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


!CreditCard class methodsFor: 'initialization' stamp: 'rjs 7/12/2020 16:13:25'!
createWithANumber: aNumber thisDate: aDate andThisOwner: anOwner.

	self checkName: anOwner.
	self checkNumber: aNumber.

	^ self new initializeWithANumber: aNumber andADate: aDate andAnOwner: anOwner.! !