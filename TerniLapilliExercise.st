!classDefinition: #TestTerniLapilli category: #TerniLapilliExercise!
TestCase subclass: #TestTerniLapilli
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test01StartsGameWithEmptyBoardAndMovesX

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
		self assert: juegoNuevo whoIsPlaying equals: 'X'.
		self assert: juegoNuevo hasntFinishedYet equals: true.! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test02PlayerXMadeAMove

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
		self assert: juegoNuevo whoIsPlaying equals: 'O'.! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test03XPlayedNowPlaysO
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
		self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2}).
		self assert: juegoNuevo whoIsPlaying equals: 'X'.
! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test04OCanNotPutAMarkInAXMarksPlace
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo putOat: 1 @ 1. ]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo whoIsPlaying equals: 'O'.
									TerniLapilli InvalidMarkPlaceErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test05XCanNotPutAMarkInAOMarksPlace
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self
		should: [ juegoNuevo putXat: 1 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2}).
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli InvalidMarkPlaceErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test06CoordinateYCanNotBeGreaterThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 1 @ 10.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test07CoordinateYCanNotBeLowerThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 1 @ 0.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test08CoordinateXCanNotBeGreaterThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 10 @ 1.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test09CoordinateXCanNotBeLowerThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 0 @ 1.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test10XCanNotPlayTwoTimesInARow
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo putXat: 1 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo whoIsPlaying equals: 'O'.
									TerniLapilli invalidPlayerErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test11OCanNotPlayTwoTimesInARow
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self
		should: [ juegoNuevo putOat: 1 @ 3.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2}).
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli invalidPlayerErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test12XCanNotPlayFourMarks
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		self
		should: [ juegoNuevo putXat: 2 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli invalidNumberOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test13OCanNotPlayFourMarks
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2. 
		
		self
		should: [ juegoNuevo putOat: 1 @ 1.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo whoIsPlaying equals: 'O'.
									TerniLapilli invalidNumberOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test14XCanNotMoveAMarkBeforePlacingThree
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: OrderedCollection new.
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli invalidLessNumberOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 19:01:06'!
test15OCanNotMoveAMarkBeforePlacingThree
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo moveOMarkAt: 1 @ 2 to: 2 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1}).
									self assert: juegoNuevo visualizeOMarks equals: OrderedCollection new.
									self assert: juegoNuevo whoIsPlaying equals: 'O'.
									TerniLapilli invalidLessNumberOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test16XCanNotMoveAMarkOutOfBoard
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 3 to: 1 @ 4.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 17:46:57'!
test17OCanNotMoveAMarkOutOfBoard
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2. 
		
		self
		should: [ juegoNuevo moveOMarkAt: 3 @ 2 to: 4 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}). 
									self assert: juegoNuevo whoIsPlaying equals: 'O'.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 18:57:47'!
test18XCanNotMoveAMarkDiagonallyIfItIsNotOnCornersOrCenter
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 2.
		juegoNuevo putOat: 1 @ 1.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1. 
		
		self
		should: [juegoNuevo moveXMarkAt: 1 @ 2 to: 2 @ 3.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 1. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 2. 1 @ 3. 3 @ 3}). 
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli invalidDistanceOfMarksErrorDescription]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 18:57:57'!
test19OCanNotMoveAMarkDiagonallyIfItIsNotOnCornersOrCenter
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2. 
		
		self
		should: [ juegoNuevo moveOMarkAt: 1 @ 2 to: 2 @ 3.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}). 
									self assert: juegoNuevo whoIsPlaying equals: 'O'.
									TerniLapilli invalidDistanceOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 18:44:18'!
test20XCanNotMoveAMarkMoreThanOnePlace
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 3 to: 3 @ 1.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli invalidDistanceOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 18:44:04'!
test21OCanNotMoveAMarkMoreThanOnePlace
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2. 
		
		self
		should: [ juegoNuevo moveOMarkAt: 2 @ 1 to: 2 @ 3.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo whoIsPlaying equals: 'O'.
									TerniLapilli invalidDistanceOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 18:43:45'!
test22XCanOnlyMoveHisMarks
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 2 to: 2 @ 2.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli MarkMoveErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 18:43:40'!
test23OCanOnlyMoveHisMarks
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2. 
		
		self
		should: [ juegoNuevo moveOMarkAt: 1 @ 3 to: 2 @ 3.]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo whoIsPlaying equals: 'O'.
									TerniLapilli MarkMoveErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 18:43:31'!
test24XCanMoveOnlyInHisTurn
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 3 to: 2 @ 3. ]
		raise: Error
		withMessageText: [ 	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2.}).
									self assert: juegoNuevo whoIsPlaying equals: 'O'.
									TerniLapilli invalidPlayerErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 18:43:23'!
test25OCanMoveOnlyInHisTurn
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		self
		should: [ juegoNuevo moveOMarkAt: 2 @ 1 to: 2 @ 2. ]
		raise: Error
		withMessageText: [ 	self assert: juegoNuevo hasntFinishedYet equals: true.
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									self assert: juegoNuevo whoIsPlaying equals: 'X'.
									TerniLapilli invalidPlayerErrorDescription ]! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 19:02:42'!
test26XCanMoveOneOfHisMarks
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		
		juegoNuevo moveXMarkAt: 1 @ 3 to: 2 @ 3.
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 3 @ 3. 2 @ 3}).
		self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
		self assert: juegoNuevo whoIsPlaying equals: 'O'.
		! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:03:11'!
test27OCanMoveOneOfHisMarks
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		juegoNuevo putXat: 1 @ 3.
		juegoNuevo putOat: 3 @ 2.
		juegoNuevo putXat: 3 @ 3.
		juegoNuevo putOat: 2 @ 1.
		juegoNuevo moveXMarkAt: 1 @ 3 to: 2 @ 3.
		juegoNuevo moveOMarkAt: 2 @ 1 to: 3 @ 1. 
		
		self assert: juegoNuevo hasntFinishedYet equals: true.
		self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 3 @ 3. 2 @ 3}).
		self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 3 @ 1}).
		self assert: juegoNuevo whoIsPlaying equals: 'X'.! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:27:43'!
test28XWinsPuttingAColumn

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 1 @ 2.
	juegoNuevo putXat: 2 @ 1.
	juegoNuevo putOat: 2 @ 2.
	juegoNuevo putXat: 3 @ 1.
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerXWon).
	self deny: (juegoNuevo hasPlayerOWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 1}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 2 @ 2}).! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:27:54'!
test29OWinsPuttingAColumn

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 2.
	juegoNuevo putOat: 1 @ 1.
	juegoNuevo putXat: 2 @ 3.
	juegoNuevo putOat: 2 @ 1.
	juegoNuevo putXat: 3 @ 3.
	juegoNuevo putOat: 3 @ 1.
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerOWon).
	self deny: (juegoNuevo hasPlayerXWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 2. 2 @ 3. 3 @ 3}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 1}).! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:28:04'!
test30XWinsPuttingARow

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 2 @ 2.
	juegoNuevo putXat: 2 @ 1.
	juegoNuevo putOat: 1 @ 2.
	juegoNuevo putXat: 3 @ 1.
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerXWon).
	self deny: (juegoNuevo hasPlayerOWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 1}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {2 @ 2. 1 @ 2}).! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:28:12'!
test31OWinsPuttingARow

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 1 @ 3.
	juegoNuevo putXat: 1 @ 2.
	juegoNuevo putOat: 2 @ 3.
	juegoNuevo putXat: 3 @ 1.
	juegoNuevo putOat: 3 @ 3.
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerOWon).
	self deny: (juegoNuevo hasPlayerXWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 2. 3 @ 1}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 3. 2 @ 3. 3 @ 3}).

	! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 19:54:05'!
test32XWinsPuttingADiagonal
	
	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 1 @ 3.
	juegoNuevo putXat: 2 @ 2.
	juegoNuevo putOat: 2 @ 3.
	juegoNuevo putXat: 3 @ 3.
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerXWon).
	self deny: (juegoNuevo hasPlayerOWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 2 @ 2. 3 @ 3}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 3. 2 @ 3}).! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 19:56:35'!
test33OWinsPuttingADiagonal

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 2 @ 1.
	juegoNuevo putOat: 1 @ 3.
	juegoNuevo putXat: 3 @ 2.
	juegoNuevo putOat: 2 @ 2.
	juegoNuevo putXat: 3 @ 3.
	juegoNuevo putOat: 3 @ 1.
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerOWon).
	self deny: (juegoNuevo hasPlayerXWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {2 @ 1. 3 @ 2. 3 @ 3}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 3. 2 @ 2. 3 @ 1}).! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 19:59:39'!
test34XWinsMovingToAColumn

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 3.
	juegoNuevo putOat: 2 @ 1.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 2 @ 3.
	juegoNuevo putXat: 2 @ 2.
	juegoNuevo putOat: 3 @ 2.
	
	juegoNuevo moveXMarkAt: 2 @ 2 to: 1 @ 2. 
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerXWon).
	self deny: (juegoNuevo hasPlayerOWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 1 @ 1. 1 @ 2}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {2 @ 1. 2 @ 3. 3 @ 2}).
	! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:07:18'!
test35OWinsMovingToAColumn

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 2 @ 3.
	juegoNuevo putOat: 1 @ 3.
	juegoNuevo putXat: 2 @ 1.
	juegoNuevo putOat: 1 @ 1.
	juegoNuevo putXat: 3 @ 3.
	juegoNuevo putOat: 2 @ 2.
	
	juegoNuevo moveXMarkAt: 3 @ 3 to: 3 @ 2.
	juegoNuevo moveOMarkAt: 2 @ 2 to: 1 @ 2. 
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerOWon).
	self deny: (juegoNuevo hasPlayerXWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {2 @ 3. 2 @ 1. 3 @ 2}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 3. 1 @ 1. 1 @ 2}).
	! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:09:32'!
test36XWinsMovingToARow

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 3.
	juegoNuevo putOat: 1 @ 1.
	juegoNuevo putXat: 3 @ 3.
	juegoNuevo putOat: 2 @ 1.
	juegoNuevo putXat: 2 @ 2.
	juegoNuevo putOat: 3 @ 2.
	
	juegoNuevo moveXMarkAt: 2 @ 2 to: 2 @ 3. 
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerXWon).
	self deny: (juegoNuevo hasPlayerOWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 3}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 2}).
	! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:14:18'!
test37OWinsMovingToARow

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 1 @ 3.
	juegoNuevo putXat: 2 @ 1.
	juegoNuevo putOat: 3 @ 3.
	juegoNuevo putXat: 3 @ 2.
	juegoNuevo putOat: 2 @ 2.
	
	juegoNuevo moveXMarkAt: 1 @ 1 to: 1 @ 2.
	juegoNuevo moveOMarkAt: 2 @ 2 to: 2 @ 3. 
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerOWon).
	self deny: (juegoNuevo hasPlayerXWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {2 @ 1. 3 @ 2. 1 @ 2}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 3}).
	! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:17:19'!
test38XWinsMovingToADiagonal

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 3.
	juegoNuevo putOat: 1 @ 1.
	juegoNuevo putXat: 1 @ 2.
	juegoNuevo putOat: 2 @ 1.
	juegoNuevo putXat: 3 @ 1.
	juegoNuevo putOat: 3 @ 3.
	
	juegoNuevo moveXMarkAt: 1 @ 2 to: 2 @ 2. 
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerXWon).
	self deny: (juegoNuevo hasPlayerOWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 1. 2 @ 2}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 3}).! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:19:38'!
test39OWinsMovingToADiagonal

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 1 @ 3.
	juegoNuevo putXat: 2 @ 1.
	juegoNuevo putOat: 1 @ 2.
	juegoNuevo putXat: 3 @ 3.
	juegoNuevo putOat: 3 @ 1.
	
	juegoNuevo moveXMarkAt: 3 @ 3 to: 3 @ 2.
	juegoNuevo moveOMarkAt: 1 @ 2 to: 2 @ 2. 
	
	self assert: juegoNuevo hasntFinishedYet equals: false.
	self assert: (juegoNuevo hasPlayerOWon).
	self deny: (juegoNuevo hasPlayerXWon).
	self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 2}).
	self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 1. 2 @ 2}).
	! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:31:15'!
test40OCanNotPutAMarkIfXHasWon

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 1 @ 2.
	juegoNuevo putXat: 2 @ 1.
	juegoNuevo putOat: 2 @ 2.
	juegoNuevo putXat: 3 @ 1.
	
	self
		should: [ juegoNuevo putOat: 3 @ 3]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: false.
									self assert: (juegoNuevo hasPlayerXWon).
									self deny: (juegoNuevo hasPlayerOWon).
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 1}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 2. 2 @ 2}).
									TerniLapilli gameOverErrorDescription ].
	
	! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:33:47'!
test41XCanNotMoveAMarkIfOHasWon

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 1 @ 3.
	juegoNuevo putXat: 1 @ 2.
	juegoNuevo putOat: 2 @ 3.
	juegoNuevo putXat: 3 @ 1.
	juegoNuevo putOat: 3 @ 3.
	
	self
		should: [ juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 1]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: false.
									self assert: (juegoNuevo hasPlayerOWon).
									self deny: (juegoNuevo hasPlayerXWon).
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 1. 1 @ 2. 3 @ 1}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 3. 2 @ 3. 3 @ 3}).
									TerniLapilli gameOverErrorDescription ].
	
	

	! !

!TestTerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:36:15'!
test42OCanNotMoveAMarkIfXHasWon

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 3.
	juegoNuevo putOat: 1 @ 1.
	juegoNuevo putXat: 3 @ 3.
	juegoNuevo putOat: 2 @ 1.
	juegoNuevo putXat: 2 @ 2.
	juegoNuevo putOat: 3 @ 2.
	
	juegoNuevo moveXMarkAt: 2 @ 2 to: 2 @ 3. 
	
	self
		should: [ juegoNuevo moveOMarkAt: 1 @ 1 to: 1 @ 2 ]
		raise: Error
		withMessageText: [	self assert: juegoNuevo hasntFinishedYet equals: false.
									self assert: (juegoNuevo hasPlayerXWon).
									self deny: (juegoNuevo hasPlayerOWon).
									self assert: juegoNuevo visualizeXMarks equals: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 3}).
									self assert: juegoNuevo visualizeOMarks equals: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 2}).
									TerniLapilli gameOverErrorDescription ].
! !


!classDefinition: #TerniLapilli category: #TerniLapilliExercise!
Object subclass: #TerniLapilli
	instanceVariableNames: 'Xmarks Omarks playerTurn hasntFinishedYet hasPlayerXWon hasPlayerOWon'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TerniLapilli methodsFor: 'put' stamp: 'na 6/15/2020 20:24:59'!
addMarkFromPlayerOAt: aPosition

	Omarks add: aPosition.
	self hasThisCollectionWon: Omarks.
	playerTurn := PuttingX new: self.
	Omarks size = 3 ifTrue: [playerTurn := MovingX new: self].
	hasntFinishedYet ifFalse: [hasPlayerOWon := true. playerTurn := GameOverState new: self].! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/15/2020 20:24:30'!
addMarkFromPlayerXAt: aPosition

	Xmarks add: aPosition.
	self hasThisCollectionWon: Xmarks.
	playerTurn := PuttingO new: self.
	hasntFinishedYet ifFalse: [hasPlayerXWon := true. playerTurn := GameOverState new: self].! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/15/2020 19:45:42'!
hasThisCollectionWon: aCollection 

	"Columns"
	(aCollection includesAllOf: {1 @ 1. 2 @ 1. 3 @ 1}) ifTrue: [^hasntFinishedYet := false].
	(aCollection includesAllOf: {1 @ 2. 2 @ 2. 3 @ 2}) ifTrue: [^hasntFinishedYet := false].
	(aCollection includesAllOf: {1 @ 3. 2 @ 3. 3 @ 3}) ifTrue: [^hasntFinishedYet := false].
	
	"Rows"
	(aCollection includesAllOf: {1 @ 1. 1 @ 2. 1 @ 3}) ifTrue: [^hasntFinishedYet := false].
	(aCollection includesAllOf: {2 @ 1. 2 @ 2. 2 @ 3}) ifTrue: [^hasntFinishedYet := false].
	(aCollection includesAllOf: {3 @ 1. 3 @ 2. 3 @ 3}) ifTrue: [^hasntFinishedYet := false].
	
	"Diagonals"
	(aCollection includesAllOf: {1 @ 1. 2 @ 2. 3 @ 3}) ifTrue: [^hasntFinishedYet := false].
	(aCollection includesAllOf: {3 @ 1. 2 @ 2. 1 @ 3}) ifTrue: [^hasntFinishedYet := false].
	
	^hasntFinishedYet := true.! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/15/2020 12:32:26'!
putOat: aPosition

	self checkIfItIsAValidPosition: aPosition.
	^ playerTurn putOat: aPosition
	
	

	! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/15/2020 12:32:32'!
putXat: aPosition

	self checkIfItIsAValidPosition: aPosition.
	^ playerTurn putXat: aPosition! !


!TerniLapilli methodsFor: 'move' stamp: 'na 6/15/2020 20:25:37'!
moveMark: aMark FromPlayerOAt: aPosition

	(Omarks includes: aMark) ifFalse: [^self error: self class MarkMoveErrorDescription].
	Omarks remove: aMark.
	Omarks add: aPosition.
	self hasThisCollectionWon: Omarks.
	playerTurn := MovingX new: self.
	hasntFinishedYet ifFalse: [hasPlayerOWon := true. playerTurn := GameOverState new: self].
	
! !

!TerniLapilli methodsFor: 'move' stamp: 'na 6/15/2020 20:25:15'!
moveMark: aMark FromPlayerXAt: aPosition

	(Xmarks includes: aMark) ifFalse: [^self error: self class MarkMoveErrorDescription].
	Xmarks remove: aMark.
	Xmarks add: aPosition.
	self hasThisCollectionWon: Xmarks.
	playerTurn := MovingO new: self.
	hasntFinishedYet ifFalse: [hasPlayerXWon := true. playerTurn := GameOverState new: self].
	! !

!TerniLapilli methodsFor: 'move' stamp: 'na 6/15/2020 12:36:50'!
moveOMarkAt: aMark to: aPosition

	self checkIfItIsAValidPosition: aPosition.
	self checkIfThisPosition: aPosition isAdyacentToThisMark: aMark.
	
	^ playerTurn moveOMarkAt: aMark to: aPosition.

! !

!TerniLapilli methodsFor: 'move' stamp: 'na 6/15/2020 12:30:36'!
moveXMarkAt: aMark to: aPosition

	self checkIfItIsAValidPosition: aPosition.
	self checkIfThisPosition: aPosition isAdyacentToThisMark: aMark.
	
	^ playerTurn moveXMarkAt: aMark to: aPosition.! !


!TerniLapilli methodsFor: 'visualice' stamp: 'na 6/15/2020 18:04:47'!
hasntFinishedYet
	^ hasntFinishedYet ! !

!TerniLapilli methodsFor: 'visualice' stamp: 'rjs 6/13/2020 19:51:50'!
visualizeOMarks
	
	^ Omarks copy
	! !

!TerniLapilli methodsFor: 'visualice' stamp: 'rjs 6/13/2020 19:44:22'!
visualizeXMarks
	
	^ Xmarks copy
	! !

!TerniLapilli methodsFor: 'visualice' stamp: 'na 6/15/2020 17:46:56'!
whoIsPlaying
	^ playerTurn whoIsPlaying! !


!TerniLapilli methodsFor: 'asserts' stamp: 'rjs 6/13/2020 18:52:26'!
checkIfItIsAValidPosition: aPosition

	(aPosition y > 3 or: [aPosition y < 1 ] ) ifTrue: [^ self error: self class InvalidMarkPositionErrorDescription .].
	(aPosition x > 3 or: [aPosition x < 1 ] ) ifTrue: [^ self error: self class InvalidMarkPositionErrorDescription .].
	
	((Omarks includes: aPosition) or: [Xmarks includes: aPosition]) ifTrue: [^ self error: self class InvalidMarkPlaceErrorDescription].
	
	^ true! !

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/15/2020 19:00:16'!
checkIfThisPosition: aPosition isAdyacentToThisMark: aMark

	| vecinos |
	
	vecinos := self neighbors: aMark.
	(vecinos includes: aPosition ) ifFalse: [^self error: self class invalidDistanceOfMarksErrorDescription ].
	
	^ true! !

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/15/2020 18:39:54'!
neighbors: aPosition

	aPosition = (1 @ 3) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (3 @ 3) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (1 @ 1) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (3 @ 1) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (2 @ 2) ifTrue: [^aPosition eightNeighbors.].
			
	^aPosition fourNeighbors.! !


!TerniLapilli methodsFor: 'inicialization' stamp: 'na 6/15/2020 19:34:08'!
initialize

	Xmarks := OrderedCollection new.
	Omarks := OrderedCollection new.
	playerTurn := PuttingX new: self.
	hasntFinishedYet := true.
	hasPlayerXWon := false.
	hasPlayerOWon := false.! !


!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 19:38:08'!
hasPlayerOWon

	^hasPlayerOWon ! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 19:38:01'!
hasPlayerXWon

	^hasPlayerXWon ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilliExercise!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 18:52:26'!
InvalidMarkPlaceErrorDescription

	^ ' ya hay ficha ahi, gil!! '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 17:45:53'!
InvalidMarkPositionErrorDescription

	^ ' Posicion de Marca invalida, Probá del 1 al 3 '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 19:01:12'!
MarkMoveErrorDescription

	^ ' Solo podes elegir tus fichas para moverlas '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:23:02'!
gameOverErrorDescription
	
	^ 'se termino el juego.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 18:35:34'!
invalidDistanceOfMarksErrorDescription

	^ ' No podes mover una ficha mas de un casillero de distancia '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/13/2020 18:08:59'!
invalidLessNumberOfMarksErrorDescription

	^ '  No pusiste las 3 fichas todavia '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 18:17:41'!
invalidNumberOfMarksErrorDescription

	^ ' No podes poner más fichas, move las que tenés '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 18:10:20'!
invalidPlayerErrorDescription

	^ ' Ya jugaste vos pibe, compartí '! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'rjs 6/11/2020 20:19:00'!
new
	^ self basicNew initialize.! !


!classDefinition: #TerniLapilliState category: #TerniLapilliExercise!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'terniLapilli'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:26:00'!
initialize: aTerniLapilli.
	 
	terniLapilli := aTerniLapilli.! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:21:19'!
whoIsPlaying
	^ self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilliExercise!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'rjs 6/12/2020 19:07:48'!
new: aTerniLapilli
	^ self basicNew initialize: aTerniLapilli.! !


!classDefinition: #GameOverState category: #TerniLapilliExercise!
TerniLapilliState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!GameOverState methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:22:46'!
moveOMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class gameOverErrorDescription.! !

!GameOverState methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:23:20'!
moveXMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class gameOverErrorDescription.! !

!GameOverState methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:23:24'!
putOat: aPosition

	^ terniLapilli error: terniLapilli class gameOverErrorDescription.! !

!GameOverState methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:23:30'!
putXat: aPosition
	
	^ terniLapilli error: terniLapilli class gameOverErrorDescription.! !

!GameOverState methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 20:38:13'!
whoIsPlaying

	^terniLapilli error: terniLapilli class gameOverErrorDescription ! !


!classDefinition: #PlayingO category: #TerniLapilliExercise!
TerniLapilliState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PlayingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:16'!
whoIsPlaying
	
	^ 'O'! !


!classDefinition: #MovingO category: #TerniLapilliExercise!
PlayingO subclass: #MovingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:34:38'!
moveOMarkAt: aMark to: aPosition
	
	terniLapilli moveMark: aMark FromPlayerOAt: aPosition! !

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:34:33'!
moveXMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription.! !

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 11:50:15'!
putOat: aPosition

	^terniLapilli error: terniLapilli class invalidNumberOfMarksErrorDescription! !

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 11:55:41'!
putXat: aPosition
	
	^terniLapilli error: terniLapilli class invalidPlayerErrorDescription! !


!classDefinition: #PuttingO category: #TerniLapilliExercise!
PlayingO subclass: #PuttingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:01:47'!
moveOMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class invalidLessNumberOfMarksErrorDescription! !

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:34:54'!
moveXMarkAt: aMark to: aPosition
	 
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription.! !

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:01'!
putOat: aPosition
	
	terniLapilli addMarkFromPlayerOAt: aPosition! !

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:05'!
putXat: aPosition
	 
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !


!classDefinition: #PlayingX category: #TerniLapilliExercise!
TerniLapilliState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PlayingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:22'!
whoIsPlaying
	
	^ 'X'! !


!classDefinition: #MovingX category: #TerniLapilliExercise!
PlayingX subclass: #MovingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:28'!
moveOMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:33'!
moveXMarkAt: aMark to: aPosition
	
	terniLapilli moveMark: aMark FromPlayerXAt: aPosition! !

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:37'!
putOat: aPosition
	 
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:43'!
putXat: aPosition
	
	^ terniLapilli error: terniLapilli class invalidNumberOfMarksErrorDescription! !


!classDefinition: #PuttingX category: #TerniLapilliExercise!
PlayingX subclass: #PuttingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:36:28'!
moveOMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:36:24'!
moveXMarkAt: aMark to: aPosition
	
	^ terniLapilli error: terniLapilli class invalidLessNumberOfMarksErrorDescription! !

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:36:18'!
putOat: aPosition
	 
	^ terniLapilli error: terniLapilli class invalidPlayerErrorDescription .! !

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:05:14'!
putXat: aPosition
	
	terniLapilli addMarkFromPlayerXAt: aPosition! !
