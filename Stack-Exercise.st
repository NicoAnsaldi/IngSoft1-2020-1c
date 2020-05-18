!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:56:35'!
canPop

	^elements removeFirst.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:57:58'!
canTop
	
	^elements at:1! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:55:37'!
cantPop

	^self error: self class stackEmptyErrorDescription ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:57:46'!
cantTop
	
	^self error: self class stackEmptyErrorDescription ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:44:12'!
initialize

	elements := OrderedCollection new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/14/2020 23:50:46'!
isEmpty

	^elements isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:47:44'!
pop
	
	^self state pop
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/15/2020 00:01:18'!
push: anElement

	elements addFirst: anElement.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/15/2020 00:11:50'!
size

	^elements size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:48:23'!
state 

	^OOStackStates new: self! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:57:03'!
top

	^self state top! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'na 5/18/2020 18:44:01'!
new
	
	^self basicNew initialize! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackStates category: #'Stack-Exercise'!
Object subclass: #OOStackStates
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStates methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 19:02:50'!
initializeWith: aStack
	
	stack := aStack! !

!OOStackStates methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:53:43'!
pop
	
	^self subclassResponsibility ! !

!OOStackStates methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 19:02:16'!
top
	
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStates class' category: #'Stack-Exercise'!
OOStackStates class
	instanceVariableNames: ''!

!OOStackStates class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 19:03:18'!
for: aStack

	^self subclassResponsibility ! !

!OOStackStates class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:50:38'!
new: aStack

	^(self subclasses detect: [:aStateClass | aStateClass state = aStack isEmpty]) for: aStack! !


!classDefinition: #OOStackEmpty category: #'Stack-Exercise'!
OOStackStates subclass: #OOStackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:57:11'!
pop

	^stack cantPop

	! !

!OOStackEmpty methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 19:01:56'!
top

	^stack cantTop	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackEmpty class' category: #'Stack-Exercise'!
OOStackEmpty class
	instanceVariableNames: ''!

!OOStackEmpty class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:51:15'!
for: aStack

	^self basicNew initializeWith: aStack! !

!OOStackEmpty class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:51:44'!
state

	^true! !


!classDefinition: #OOStackNotEmpty category: #'Stack-Exercise'!
OOStackStates subclass: #OOStackNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:56:09'!
pop

	^stack canPop! !

!OOStackNotEmpty methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 19:00:28'!
top

	^stack canTop! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmpty class' category: #'Stack-Exercise'!
OOStackNotEmpty class
	instanceVariableNames: ''!

!OOStackNotEmpty class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:51:21'!
for: aStack

	^self basicNew initializeWith: aStack! !

!OOStackNotEmpty class methodsFor: 'as yet unclassified' stamp: 'na 5/18/2020 18:52:06'!
state

	^false! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
