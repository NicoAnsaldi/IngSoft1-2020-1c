!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #InterfaceRestTest category: #TusLibros!
TestCase subclass: #InterfaceRestTest
	instanceVariableNames: 'testObjectsFactory debitBehavior autSystem objectFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/16/2020 19:09:22'!
autentificateWith: anID and: aPassword

	^ autSystem value: anID value: aPassword.! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:51:37'!
createInterfaceRest

	^ InterfaceRest with: self aCatalog: objectFactory defaultCatalog aMerchantProcessor: self andASalesBook:  OrderedCollection new.! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:58:09'!
test01CanCreateACartWithValidUserAndPass

	|  interface |

	autSystem := [ :ID :Pass | ].
	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
	
	self 
		shouldnt: [ interface createCart: '1234' with: 'hola1234' ]
		raise: Error - MessageNotUnderstood.

! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:20:18'!
test02CanNotCreateACartWithInvalidUser

	|  interface |

	autSystem := [ :ID :Pass | ^ self error: InterfaceRest wrongIDErrorMessage].
	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
	
	self 
		should: [ interface createCart: '1234' with: 'hola1234' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest wrongIDErrorMessage.]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:20:25'!
test03CanNotCreateACartWithInvalidPass

	|  interface |

	autSystem := [ :ID :Pass | ^ self error: InterfaceRest wrongPassErrorMessage].
	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
	
	self 
		should: [ interface createCart: '1234' with: 'hola1234' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest wrongPassErrorMessage.]! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:20:30'!
test04CreateCartReturnsAnId
	|  interface cartID |

	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
	cartID := interface createCart: '1234' with: 'hola1234'.
	
	self 
		shouldnt: [ cartID := interface createCart: '1234' with: 'hola1234' ]
		raise: Error - MessageNotUnderstood.

	
	
	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:20:35'!
test05DifferentCartsReturnDifferentIds

	|  interface user1 user2 user3 |

	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
	user1 := interface createCart: 'L' with: '678'.
	user2 := interface createCart: 'N' with: '123'.
	user3 := interface createCart: 'R' with: '454'.
	
	self assert: ((user1 = user2) not).
	self assert: ((user2 = user3) not).
	self assert: ((user1 = user3) not).
	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:05:38'!
test06CanAddBooksToAValidCart

	|  interface cartID |

	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
	cartID := interface createCart: '1234' with: 'hola1234'.
	
	interface addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartID.
	
	
	self assert: ((interface listCart: cartID) includes: objectFactory itemSellByTheStore).
	self assert: ((interface listCart: cartID) occurrencesOf: objectFactory itemSellByTheStore) equals: 1
	



	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:26:07'!
test07CanNotAddItemToNotCreatedCart

	|  interface  |

	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
		

	self 
		should: [ interface addBook: objectFactory itemSellByTheStore quantity: 1 cart: 3. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest CanNotAddBookToNotCreatedCartErrorMessage.]
	


	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:24:16'!
test08CanNotAddItemNotSellByTheStore

	|  interface  cartID |

	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
	cartID := interface createCart: '1234' with: 'hola1234'.
		

	self 
		should: [ interface addBook: objectFactory itemNotSellByTheStore quantity: 1 cart: cartID. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest CanNotAddBookNotInCatalogToCartErrorMessage.]
	
	"es necesario hacer este test?, porque, cart ya tiene el mismo?"
	
	


	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:55:31'!
test09CanCheckoutACart

	|  interface cartID |

	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
	cartID := interface createCart: '1234' with: 'hola1234'.
	
	interface addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartID.
	"interface checkout: cartID charging: aCreditCard"
	
	self assert: ((interface listCart: cartID) isEmpty)


	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:32:46'!
test10CanNotCheckoutWithAnExpiredCard

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:32:28'!
test11CanNotCheckoutAnEmptyCart

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:22:38'!
test12CanNotCheckoutACartUsingAnInvalidCard

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:24:22'!
test13CanNotCheckoutANotCreatedCart

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:32:58'!
test14CanNotDoOperationsOnACheckoutACart

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:35:27'!
test16ListCartOfAnEmptyCartIsEmpty
	
	|  interface cartID |

	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
	cartID := interface createCart: '1234' with: 'hola1234'.
		
	self assert: ((interface listCart: cartID) isEmpty).


	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:37:09'!
test17CanNotListCartOfNotCreatedCart

	|  interface  |

	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
		

	self 
		should: [ interface listCart: 3. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
		self assert: anError messageText = InterfaceRest CanNotListANotCreatedCartErrorMessage.]

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:40:23'!
test18ListCartReturnsTheRightNumberOfItems

	|  interface cartID |

	interface := InterfaceRest with: self andACatalog: objectFactory defaultCatalog .
	cartID := interface createCart: '1234' with: 'hola1234'.
	
	interface addBook: objectFactory itemSellByTheStore quantity: 1 cart: cartID.
	interface addBook: objectFactory itemSellByTheStore quantity: 10 cart: cartID.
	interface addBook: objectFactory itemSellByTheStore quantity: 12 cart: cartID.
	
	
	self assert: ((interface listCart: cartID) includes: objectFactory itemSellByTheStore).
	self assert: ((interface listCart: cartID) occurrencesOf: objectFactory itemSellByTheStore) equals: 23

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 20:30:57'!
test20ListPurchasesOfEmptyCartIsEmpty



	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:46:09'!
test21CanListPurchasesOfOneUserCart

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:46:04'!
test22CanListPurchasesOfManyUserCarts

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:29:50'!
test23CanListPurchasesOfTwoDifferentChekoutCarts

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:46:29'!
test24CantListPurchasesOfAnInvalidUserName

	
	! !

!InterfaceRestTest methodsFor: 'test' stamp: 'rjs 7/20/2020 19:46:24'!
test25CantListPurchasesOfAValidUserNameWithInvalidPassword

	
	! !


!InterfaceRestTest methodsFor: 'setUp' stamp: 'rjs 7/16/2020 20:19:50'!
setUp

	autSystem := [ :ID :Pass | ].
	objectFactory := StoreTestObjectsFactory new.! !


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


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'rjs 7/20/2020 20:12:11'!
contents

	^ items copy! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #InterfaceRest category: #TusLibros!
Object subclass: #InterfaceRest
	instanceVariableNames: 'id autentificationSystem carts catalog merchant salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceRest methodsFor: 'initialization' stamp: 'rjs 7/20/2020 20:54:09'!
initializeWith: anAutentificationSystem and: aCatalog aMerchantProcessor: aMP andASalesBook:  aSalesBook

	autentificationSystem := anAutentificationSystem.
	id := 0.
	carts := Dictionary new.
	catalog := aCatalog.
	merchant :=aMP.
	salesBook := aSalesBook.! !


!InterfaceRest methodsFor: 'as yet unclassified' stamp: 'rjs 7/20/2020 20:29:57'!
addBook: aBook quantity: aQuantity cart: aCartID

	| cart |
	
	(catalog includesKey: aBook) ifFalse: [^ self error: self class CanNotAddBookNotInCatalogToCartErrorMessage ].
	cart := carts at: aCartID ifAbsent: [ ^ self error: self class CanNotAddBookToNotCreatedCartErrorMessage ].
		
	cart add: aQuantity of: aBook.

	
	! !

!InterfaceRest methodsFor: 'as yet unclassified' stamp: 'rjs 7/20/2020 20:55:44'!
checkout: aCart charging: aCreditCard

! !

!InterfaceRest methodsFor: 'as yet unclassified' stamp: 'rjs 7/20/2020 20:08:51'!
createCart: anID with: aPassword
	
	| cart |
	
	autentificationSystem autentificateWith: anID and: aPassword.
	
	id := id + 1.
	
	cart := Cart acceptingItemsOf: catalog.
	carts at: id put: cart.
	
	^ id.

	 ! !

!InterfaceRest methodsFor: 'as yet unclassified' stamp: 'rjs 7/20/2020 20:38:40'!
listCart: aCartID
	
	^ (carts at: aCartID ifAbsent: [ ^ self error: self class CanNotListANotCreatedCartErrorMessage ]) contents.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InterfaceRest class' category: #TusLibros!
InterfaceRest class
	instanceVariableNames: ''!

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/20/2020 20:20:43'!
CanNotAddBookNotInCatalogToCartErrorMessage
	^ ' No podes agregar un libro que no esta en el catalog a un changuito '! !

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/20/2020 20:17:06'!
CanNotAddBookToNotCreatedCartErrorMessage
	^ ' No podes agregar un libro a un changuito no creado '! !

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/20/2020 20:37:35'!
CanNotListANotCreatedCartErrorMessage
	^ ' No podes listar un carrito no creado '! !

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/16/2020 19:00:52'!
wrongIDErrorMessage
	^ ' usuario erroneo '! !

!InterfaceRest class methodsFor: 'error' stamp: 'rjs 7/16/2020 19:17:56'!
wrongPassErrorMessage
	^ ' Password erronea '! !


!InterfaceRest class methodsFor: 'initialization' stamp: 'rjs 7/20/2020 20:52:44'!
with: anAutentificationSystem aCatalog: aCatalog aMerchantProcessor: aMP andASalesBook:  aSalesBook

	^ self new initializeWith: anAutentificationSystem and: aCatalog aMerchantProcessor: aMP andASalesBook:  aSalesBook.! !


!classDefinition: #MerchantProcessor category: #TusLibros!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !
