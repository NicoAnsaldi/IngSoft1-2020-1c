!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook johnLennon paulMcCartney'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'nn 5/5/2020 16:04:21'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

		self should: [customerBook addCustomerNamed: johnLennon .] takesLessThan: 50.
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nn 5/5/2020 16:04:21'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	customerBook  addCustomerNamed: paulMcCartney.
	
	self should:  [customerBook removeCustomerNamed: paulMcCartney] takesLessThan: 100.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nn 5/5/2020 15:57:15'!
test03CanNotAddACustomerWithEmptyName 

	self should: [ customerBook addCustomerNamed: ''] 
	raise: Error  
	assertions: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
		
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'rjs 5/6/2020 17:50:42'!
test04CanNotRemoveAnInvalidCustomer
	
	customerBook addCustomerNamed: johnLennon.
	
	self should: [ customerBook removeCustomerNamed: 'Paul McCartney'] 
	raise: NotFound 
	assertions:  [ :anError | self inTheBook: customerBook thereIsOnly: johnLennon ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'rjs 5/6/2020 18:28:53'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	self addAndSuspendTheCustomer: paulMcCartney.
	
	self checkIfTheBook: customerBook hasThisNumberOfSuspendedCustomers: 1 andThisNumberOfActiveCustomers: 0.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'rjs 5/6/2020 18:28:53'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	self addAndSuspendTheCustomer: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self checkIfTheBook: customerBook hasThisNumberOfSuspendedCustomers: 0 andThisNumberOfActiveCustomers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'rjs 5/6/2020 17:50:42'!
test07CanNotSuspendAnInvalidCustomer
	
	customerBook addCustomerNamed: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: 'Ringo Starr'.] 
	raise: CantSuspend 
	assertions: [ :anError | self inTheBook: customerBook thereIsOnly: johnLennon]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'rjs 5/6/2020 17:50:42'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	self addAndSuspendTheCustomer: johnLennon.
	
	self should: [ customerBook suspendCustomerNamed: johnLennon] 
	raise: CantSuspend 
	assertions: [ :anError | self inTheBook: customerBook thereIsOnly: johnLennon ]
! !


!CustomerBookTest methodsFor: 'setUp' stamp: 'nn 5/5/2020 15:18:06'!
setUp

	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	paulMcCartney := 'Paul McCartney'.! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'nn 5/5/2020 16:05:31'!
addAndSuspendTheCustomer: aCustomer

	
	customerBook addCustomerNamed: aCustomer.
	customerBook suspendCustomerNamed: aCustomer.
	
	 ! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'rjs 5/6/2020 18:31:09'!
checkIfTheBook: aCustomerBook hasThisNumberOfSuspendedCustomers: suspended andThisNumberOfActiveCustomers: active 

	self assert: active equals: aCustomerBook numberOfActiveCustomers.
	self assert: suspended equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: (suspended + active) equals: aCustomerBook numberOfCustomers.
	! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'rjs 5/6/2020 17:50:42'!
inTheBook: aCustomerBook thereIsOnly: aCustomer

	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: aCustomer)

! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'nn 5/5/2020 16:02:33'!
should: aBlock raise: anError assertions: assertionsBlock

	 [aBlock value. self fail] on: anError do: assertionsBlock .
		
		! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'nn 5/5/2020 16:04:21'!
should: aBlock takesLessThan: aTime

	| millisecondsBeforeRunning millisecondsAfterRunning|
	
	
	millisecondsBeforeRunning := Time millisecondClockValue *millisecond.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ (millisecondsAfterRunning-millisecondsBeforeRunning) < (aTime * millisecond)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBookTest class' category: #'CodigoRepetido-Ejercicio'!
CustomerBookTest class
	instanceVariableNames: 'customerBook'!


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'rjs 5/6/2020 18:17:57'!
removeCustomerNamed: aName 

^ active remove: aName ifAbsent: [suspended remove: aName ifAbsent:[^ NotFound signal]]
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
