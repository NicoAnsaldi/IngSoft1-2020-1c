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
	instanceVariableNames: 'Xmarks Omarks playerTurn hasPlayerXWon hasPlayerOWon'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TerniLapilli methodsFor: 'put' stamp: 'na 6/17/2020 14:49:00'!
addMarkFromPlayerOAt: aPosition

	Omarks add: aPosition.
	playerTurn := PuttingX new: self.
	Omarks size = 3 ifTrue: [playerTurn := MovingX new: self].
	(self hasThisActionWon: Omarks) ifTrue: [playerTurn := GameOver new:self. hasPlayerOWon := true].
	
	! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/17/2020 14:35:33'!
addMarkFromPlayerXAt: aPosition

	Xmarks add: aPosition.
	playerTurn := PuttingO new: self.
	(self hasThisActionWon: Xmarks) ifTrue:[playerTurn := GameOver new:self. hasPlayerXWon := true].! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/15/2020 12:32:26'!
putOat: aPosition

	self checkIfItIsAValidPosition: aPosition.
	^ playerTurn putOat: aPosition
	
	

	! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/15/2020 12:32:32'!
putXat: aPosition

	self checkIfItIsAValidPosition: aPosition.
	^ playerTurn putXat: aPosition! !


!TerniLapilli methodsFor: 'move' stamp: 'na 6/17/2020 16:20:26'!
moveMark: aMark FromPlayerOAt: aPosition

	(Omarks includes: aMark) ifFalse: [^self error: self class MarkMoveErrorDescription].
	Omarks remove: aMark.
	Omarks add: aPosition.
	playerTurn := MovingX new: self.
	(self hasThisActionWon: Omarks) ifTrue: [hasPlayerOWon := true. playerTurn := GameOver new: self]..
	
	
! !

!TerniLapilli methodsFor: 'move' stamp: 'na 6/17/2020 16:19:42'!
moveMark: aMark FromPlayerXAt: aPosition

	(Xmarks includes: aMark) ifFalse: [^self error: self class MarkMoveErrorDescription].
	Xmarks remove: aMark.
	Xmarks add: aPosition.
	playerTurn := MovingO new: self.
	(self hasThisActionWon: Xmarks) ifTrue: [hasPlayerXWon := true. playerTurn := GameOver new: self]..
	
	
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


!TerniLapilli methodsFor: 'visualice' stamp: 'na 6/17/2020 14:29:49'!
hasntFinishedYet
	^ playerTurn hasntFinishedYet ! !

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


!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/17/2020 14:01:31'!
checkIfItIsAValidPosition: aPosition

	(aPosition y > 3 or: [aPosition y < 1 ] ) ifTrue: [^ self error: self class InvalidMarkPositionErrorDescription .].
	(aPosition x > 3 or: [aPosition x < 1 ] ) ifTrue: [^ self error: self class InvalidMarkPositionErrorDescription .].
	
	((Omarks includes: aPosition) or: [Xmarks includes: aPosition]) ifTrue: [^ self error: self class InvalidMarkPlaceErrorDescription].! !

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/15/2020 19:00:16'!
checkIfThisPosition: aPosition isAdyacentToThisMark: aMark

	| vecinos |
	
	vecinos := self neighbors: aMark.
	(vecinos includes: aPosition ) ifFalse: [^self error: self class invalidDistanceOfMarksErrorDescription ].
	
	^ true! !

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/17/2020 14:48:04'!
hasThisActionWon: aCollection 
	|res|
	res := false.
	"Rows"
	res := res or:[(aCollection includesAllOf: {1 @ 1. 2 @ 1. 3 @ 1})].
	res := res or:[(aCollection includesAllOf: {1 @ 2. 2 @ 2. 3 @ 2})].
	res := res or:[(aCollection includesAllOf: {1 @ 3. 2 @ 3. 3 @ 3})].
	
	"Columns"
	res := res or: [(aCollection includesAllOf: {1 @ 1. 1 @ 2. 1 @ 3})].
	res := res or: [(aCollection includesAllOf: {2 @ 1. 2 @ 2. 2 @ 3})].
	res := res or: [(aCollection includesAllOf: {3 @ 1. 3 @ 2. 3 @ 3})].
	
	"Diagonals"
	res := res or:[(aCollection includesAllOf: {1 @ 1. 2 @ 2. 3 @ 3})].
	res := res or:[(aCollection includesAllOf: {3 @ 1. 2 @ 2. 1 @ 3})].
	
	^res! !

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/15/2020 18:39:54'!
neighbors: aPosition

	aPosition = (1 @ 3) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (3 @ 3) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (1 @ 1) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (3 @ 1) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (2 @ 2) ifTrue: [^aPosition eightNeighbors.].
			
	^aPosition fourNeighbors.! !


!TerniLapilli methodsFor: 'inicialization' stamp: 'na 6/17/2020 14:29:20'!
initialize

	Xmarks := OrderedCollection new.
	Omarks := OrderedCollection new.
	playerTurn := PuttingX new: self.
	hasPlayerXWon := false.
	hasPlayerOWon := false.! !


!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 19:17:56'!
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
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
initializeFor: aTerniLapilli.
	 
	game := aTerniLapilli.! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:26:48'!
whoIsPlaying
	
	^ self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilliExercise!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:25:48'!
for: aTerniLapilli

	^(self allSubclasses detect: [:aState | aState isFor: aTerniLapilli]) new initializeFor: aTerniLapilli. ! !

!TerniLapilliState class methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:26:36'!
isFor: aTernilaPilli

	^self subclassResponsibility! !


!classDefinition: #GameOver category: #TerniLapilliExercise!
TerniLapilliState subclass: #GameOver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!GameOver methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 16:25:52'!
hasntFinishedYet

	^false.! !

!GameOver methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
moveOMarkAt: aMark to: aPosition
	
	^ game error: game class gameOverErrorDescription.! !

!GameOver methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
moveXMarkAt: aMark to: aPosition
	
	^ game error: game class gameOverErrorDescription.! !

!GameOver methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
putOat: aPosition

	^ game error: game class gameOverErrorDescription.! !

!GameOver methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
putXat: aPosition
	
	^ game error: game class gameOverErrorDescription.! !

!GameOver methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
whoIsPlaying

	^game error: game class gameOverErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOver class' category: #TerniLapilliExercise!
GameOver class
	instanceVariableNames: ''!

!GameOver class methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:30:01'!
isFor: aTerniliLapilli

	^aTerniliLapilli hasPlayerXWon or: [aTerniliLapilli hasPlayerOWon].! !


!classDefinition: #PlayingO category: #TerniLapilliExercise!
TerniLapilliState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PlayingO methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 14:30:38'!
hasntFinishedYet 

	^true! !

!PlayingO methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:16'!
whoIsPlaying
	
	^ 'O'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingO class' category: #TerniLapilliExercise!
PlayingO class
	instanceVariableNames: ''!

!PlayingO class methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:30:27'!
isFor: aTerniLapilli

	^false! !


!classDefinition: #MovingO category: #TerniLapilliExercise!
PlayingO subclass: #MovingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
moveOMarkAt: aMark to: aPosition
	
	game moveMark: aMark FromPlayerOAt: aPosition! !

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
moveXMarkAt: aMark to: aPosition
	
	^ game error: game class invalidPlayerErrorDescription.! !

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
putOat: aPosition

	^game error: game class invalidNumberOfMarksErrorDescription! !

!MovingO methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
putXat: aPosition
	
	^game error: game class invalidPlayerErrorDescription! !


!classDefinition: #PuttingO category: #TerniLapilliExercise!
PlayingO subclass: #PuttingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
moveOMarkAt: aMark to: aPosition
	
	^ game error: game class invalidLessNumberOfMarksErrorDescription! !

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
moveXMarkAt: aMark to: aPosition
	 
	^ game error: game class invalidPlayerErrorDescription.! !

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
putOat: aPosition
	
	game addMarkFromPlayerOAt: aPosition! !

!PuttingO methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
putXat: aPosition
	 
	^ game error: game class invalidPlayerErrorDescription .! !


!classDefinition: #PlayingX category: #TerniLapilliExercise!
TerniLapilliState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PlayingX methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 14:32:03'!
hasntFinishedYet 

	^true! !

!PlayingX methodsFor: 'as yet unclassified' stamp: 'na 6/15/2020 12:35:22'!
whoIsPlaying
	
	^ 'X'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingX class' category: #TerniLapilliExercise!
PlayingX class
	instanceVariableNames: ''!

!PlayingX class methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:30:43'!
isFor: aTerniLapilli

	^false! !


!classDefinition: #MovingX category: #TerniLapilliExercise!
PlayingX subclass: #MovingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
moveOMarkAt: aMark to: aPosition
	
	^ game error: game class invalidPlayerErrorDescription .! !

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
moveXMarkAt: aMark to: aPosition
	
	game moveMark: aMark FromPlayerXAt: aPosition! !

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
putOat: aPosition
	 
	^ game error: game class invalidPlayerErrorDescription .! !

!MovingX methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
putXat: aPosition
	
	^ game error: game class invalidNumberOfMarksErrorDescription! !


!classDefinition: #PuttingX category: #TerniLapilliExercise!
PlayingX subclass: #PuttingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
moveOMarkAt: aMark to: aPosition
	
	^ game error: game class invalidPlayerErrorDescription .! !

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
moveXMarkAt: aMark to: aPosition
	
	^ game error: game class invalidLessNumberOfMarksErrorDescription! !

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
putOat: aPosition
	 
	^ game error: game class invalidPlayerErrorDescription .! !

!PuttingX methodsFor: 'as yet unclassified' stamp: 'na 6/17/2020 20:21:07'!
putXat: aPosition
	
	game addMarkFromPlayerXAt: aPosition! !
