!classDefinition: #TestTerniLapilli category: #TerniLapilliExercise!
TestCase subclass: #TestTerniLapilli
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 10:24:48'!
test01StartsGameWithEmptyBoardAndMovesX

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self assertInitialGameState: juegoNuevo.! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 12:10:29'!
test02PlayerXPutAMark

		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'O' withThisXMarks: (OrderedCollection newFrom: {1 @ 1}) andThisOMarks: OrderedCollection new. ! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 12:10:48'!
test03XPlayedNowOPutAMark
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'X' withThisXMarks: (OrderedCollection newFrom: {1 @ 1}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2})
! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 10:54:25'!
test04OCanNotPutAMarkInAXMarksPlace
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo putOat: 1 @ 1. ]
		raise: Error
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'O' withThisXMarks: (OrderedCollection newFrom: {1 @ 1}) andThisOMarks: OrderedCollection new. 
									TerniLapilli InvalidMarkPlaceErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 10:55:24'!
test05XCanNotPutAMarkInAOMarksPlace
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self
		should: [ juegoNuevo putXat: 1 @ 2.]
		raise: Error
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'X' withThisXMarks: (OrderedCollection newFrom: {1 @ 1}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2}).
									TerniLapilli InvalidMarkPlaceErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 10:26:42'!
test06CoordinateYCanNotBeGreaterThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 1 @ 10.]
		raise: Error
		withMessageText: [	self assertInitialGameState: juegoNuevo.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 10:26:59'!
test07CoordinateYCanNotBeLowerThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 1 @ 0.]
		raise: Error
		withMessageText: [	self assertInitialGameState: juegoNuevo.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 10:27:05'!
test08CoordinateXCanNotBeGreaterThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 10 @ 1.]
		raise: Error
		withMessageText: [	self assertInitialGameState: juegoNuevo.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 10:27:13'!
test09CoordinateXCanNotBeLowerThanValidPositions
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo putXat: 0 @ 1.]
		raise: Error
		withMessageText: [	self assertInitialGameState: juegoNuevo.
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 10:56:07'!
test10XCanNotPlayTwoTimesInARow
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo putXat: 1 @ 2.]
		raise: Error
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'O' withThisXMarks: (OrderedCollection newFrom: {1 @ 1}) andThisOMarks: OrderedCollection new.
									TerniLapilli isNotYourTurnErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 10:57:06'!
test11OCanNotPlayTwoTimesInARow
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		juegoNuevo putXat: 1 @ 1.
		juegoNuevo putOat: 1 @ 2.
		
		self
		should: [ juegoNuevo putOat: 1 @ 3.]
		raise: Error
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'X' withThisXMarks: (OrderedCollection newFrom: {1 @ 1}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2}).
									TerniLapilli isNotYourTurnErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 10:58:15'!
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
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'X' withThisXMarks: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									TerniLapilli canNotPutMoreMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 10:59:55'!
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
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'O' withThisXMarks: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									TerniLapilli canNotPutMoreMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:00:19'!
test14XCanNotMoveAMarkBeforePlacingThree
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		
		self
		should: [ juegoNuevo moveXMarkAt: 1 @ 1 to: 2 @ 2.]
		raise: Error
		withMessageText: [	self assertInitialGameState: juegoNuevo.
									TerniLapilli invalidLessNumberOfMarksInPlayErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:01:01'!
test15OCanNotMoveAMarkBeforePlacingThree
	
		| juegoNuevo |
		
		juegoNuevo := TerniLapilli new.
		juegoNuevo putXat: 1 @ 1.
		
		self
		should: [ juegoNuevo moveOMarkAt: 1 @ 2 to: 2 @ 2.]
		raise: Error
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'O' withThisXMarks: (OrderedCollection newFrom: {1 @ 1}) andThisOMarks: OrderedCollection new.
									TerniLapilli invalidLessNumberOfMarksInPlayErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:02:19'!
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
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'X' withThisXMarks: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:03:48'!
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
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'O' withThisXMarks: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									TerniLapilli InvalidMarkPositionErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:04:51'!
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
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'X' withThisXMarks: (OrderedCollection newFrom: {1 @ 2. 1 @ 3. 3 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 1. 3 @ 2. 2 @ 1}).
									TerniLapilli invalidDistanceOfMarksErrorDescription]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:05:51'!
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
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'O' withThisXMarks: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									TerniLapilli invalidDistanceOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:06:43'!
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
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'X' withThisXMarks: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									TerniLapilli invalidDistanceOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:10:10'!
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
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'O' withThisXMarks: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									TerniLapilli invalidDistanceOfMarksErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:14:12'!
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
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'X' withThisXMarks: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									TerniLapilli MarkMoveErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:15:14'!
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
		withMessageText: [	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'O' withThisXMarks: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 2}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									TerniLapilli MarkMoveErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:19:01'!
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
		withMessageText: [ 	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'O' withThisXMarks: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2.}).
									TerniLapilli isNotYourTurnErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:19:55'!
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
		withMessageText: [ 	self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'X' withThisXMarks: (OrderedCollection newFrom: {1 @ 1. 1 @ 3. 3 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
									TerniLapilli isNotYourTurnErrorDescription ]! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:20:38'!
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
		
		self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'O' withThisXMarks: (OrderedCollection newFrom: {1 @ 1. 3 @ 3. 2 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 2 @ 1}).
		! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:26:04'!
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
		
		self assertThatThisGame: juegoNuevo hasNotFinishWithThisPlayerPlaying: 'X' withThisXMarks: (OrderedCollection newFrom: {1 @ 1. 3 @ 3. 2 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 3 @ 2. 3 @ 1}).! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:43:03'!
test28XWinsPuttingAColumn

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 1 @ 2.
	juegoNuevo putXat: 2 @ 1.
	juegoNuevo putOat: 2 @ 2.
	juegoNuevo putXat: 3 @ 1.
	
	self assertThatInThisGameWonX: juegoNuevo.
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 1}) andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 2 @ 2})
	
	! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:43:51'!
test29OWinsPuttingAColumn

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 2.
	juegoNuevo putOat: 1 @ 1.
	juegoNuevo putXat: 2 @ 3.
	juegoNuevo putOat: 2 @ 1.
	juegoNuevo putXat: 3 @ 3.
	juegoNuevo putOat: 3 @ 1.
	
	self assertThatInThisGameWonO: juegoNuevo.
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 2. 2 @ 3. 3 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 1})! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:44:28'!
test30XWinsPuttingARow

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 2 @ 2.
	juegoNuevo putXat: 2 @ 1.
	juegoNuevo putOat: 1 @ 2.
	juegoNuevo putXat: 3 @ 1.
	
	self assertThatInThisGameWonX: juegoNuevo .
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 1}) andThisOMarks: (OrderedCollection newFrom: {2 @ 2. 1 @ 2}).! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:45:07'!
test31OWinsPuttingARow

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 1 @ 3.
	juegoNuevo putXat: 1 @ 2.
	juegoNuevo putOat: 2 @ 3.
	juegoNuevo putXat: 3 @ 1.
	juegoNuevo putOat: 3 @ 3.
	
	self assertThatInThisGameWonO: juegoNuevo.
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 1. 1 @ 2. 3 @ 1}) andThisOMarks: (OrderedCollection newFrom: {1 @ 3. 2 @ 3. 3 @ 3}).

	! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:46:51'!
test32XWinsPuttingADiagonal
	
	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 1 @ 1.
	juegoNuevo putOat: 1 @ 3.
	juegoNuevo putXat: 2 @ 2.
	juegoNuevo putOat: 2 @ 3.
	juegoNuevo putXat: 3 @ 3.
	
	self assertThatInThisGameWonX: juegoNuevo.
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 1. 2 @ 2. 3 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 3. 2 @ 3}).! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:47:44'!
test33OWinsPuttingADiagonal

	|juegoNuevo|
	juegoNuevo := TerniLapilli new.
	juegoNuevo putXat: 2 @ 1.
	juegoNuevo putOat: 1 @ 3.
	juegoNuevo putXat: 3 @ 2.
	juegoNuevo putOat: 2 @ 2.
	juegoNuevo putXat: 3 @ 3.
	juegoNuevo putOat: 3 @ 1.
	
	self assertThatInThisGameWonO: juegoNuevo.
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {2 @ 1. 3 @ 2. 3 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 3. 2 @ 2. 3 @ 1}).! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:48:47'!
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
	
	self assertThatInThisGameWonX: juegoNuevo.
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 3. 1 @ 1. 1 @ 2}) andThisOMarks: (OrderedCollection newFrom: {2 @ 1. 2 @ 3. 3 @ 2}).
	! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:50:00'!
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
	
	self assertThatInThisGameWonO: juegoNuevo.
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {2 @ 3. 2 @ 1. 3 @ 2}) andThisOMarks: (OrderedCollection newFrom: {1 @ 3. 1 @ 1. 1 @ 2}).
	! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:50:53'!
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
	
	self assertThatInThisGameWonX: juegoNuevo.
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 2}).
	! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:51:39'!
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
	
	self assertThatInThisGameWonO: juegoNuevo.
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {2 @ 1. 3 @ 2. 1 @ 2}) andThisOMarks: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 3}).
	! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:52:18'!
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
	
	self assertThatInThisGameWonX: juegoNuevo.
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 3. 3 @ 1. 2 @ 2}) andThisOMarks: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 3}).! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:53:26'!
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
	
	self assertThatInThisGameWonO: juegoNuevo.
	self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 2}) andThisOMarks: (OrderedCollection newFrom: {1 @ 3. 3 @ 1. 2 @ 2}).
	! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:54:34'!
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
		withMessageText: [	self assertThatInThisGameWonX: juegoNuevo.
									self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 1})  andThisOMarks: (OrderedCollection newFrom: {1 @ 2. 2 @ 2}).
									TerniLapilli gameOverErrorDescription ].
	
	! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:55:29'!
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
		withMessageText: [	self assertThatInThisGameWonO: juegoNuevo.
									self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 1. 1 @ 2. 3 @ 1}) andThisOMarks: (OrderedCollection newFrom: {1 @ 3. 2 @ 3. 3 @ 3}).
									TerniLapilli gameOverErrorDescription ].
	
	

	! !

!TestTerniLapilli methodsFor: 'tests' stamp: 'na 6/18/2020 11:56:22'!
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
		withMessageText: [	self assertThatInThisGameWonX: juegoNuevo.
									self assertThatThisGame: juegoNuevo hasFinishedWithThisXMarks: (OrderedCollection newFrom: {1 @ 3. 3 @ 3. 2 @ 3}) andThisOMarks: (OrderedCollection newFrom: {1 @ 1. 2 @ 1. 3 @ 2}).
									TerniLapilli gameOverErrorDescription ].
! !


!TestTerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 12:05:19'!
assertInThisGame: aTerniLapilliGame isPlaying: aPlayer

	self assert: aTerniLapilliGame whoIsPlaying equals: aPlayer.! !

!TestTerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 10:46:23'!
assertInitialGameState: aTerniLapilliGame

	self assert: aTerniLapilliGame visualizeXMarks equals: OrderedCollection new.
	self assert: aTerniLapilliGame whoIsPlaying equals: 'X'.
	self assert: aTerniLapilliGame hasNotFinishedYet equals: true.

	! !

!TestTerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 12:03:55'!
assertOHasThisMarks: anOMarksCollection inThisGame: aTerniLapilliGame

	self assert: aTerniLapilliGame visualizeOMarks equals: anOMarksCollection.! !

!TestTerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 11:42:31'!
assertThatInThisGameWonO: juegoNuevo

	self assert: juegoNuevo hasPlayerOWon.
	self deny: juegoNuevo hasPlayerXWon! !

!TestTerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 11:42:16'!
assertThatInThisGameWonX: juegoNuevo

	self assert: juegoNuevo hasPlayerXWon.
	self deny: juegoNuevo hasPlayerOWon! !

!TestTerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 12:08:05'!
assertThatThisGame: aTerniLapilliGame hasFinishedWithThisXMarks: aXMarksCollection andThisOMarks: anOMarksCollection

	self assertThisGameIsFinished: aTerniLapilliGame.
	self assertXHasThisMarks: aXMarksCollection inThisGame: aTerniLapilliGame.
	self assertOHasThisMarks: anOMarksCollection inThisGame: aTerniLapilliGame.! !

!TestTerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 12:05:13'!
assertThatThisGame: aTerniLapilliGame hasNotFinishWithThisPlayerPlaying: aPlayer withThisXMarks: aXMarksCollection andThisOMarks: anOMarksCollection 

	self assertThisGameIsNotFinished: aTerniLapilliGame.
	self assertXHasThisMarks: aXMarksCollection inThisGame: aTerniLapilliGame.
	self assertOHasThisMarks: anOMarksCollection inThisGame: aTerniLapilliGame.	
	self assertInThisGame: aTerniLapilliGame isPlaying: aPlayer.! !

!TestTerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 12:08:50'!
assertThisGameIsFinished: aTerniLapilliGame

	self assert: aTerniLapilliGame hasNotFinishedYet not.! !

!TestTerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 12:08:46'!
assertThisGameIsNotFinished: aTerniLapilliGame

	self assert: aTerniLapilliGame hasNotFinishedYet.! !

!TestTerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 12:02:54'!
assertXHasThisMarks: aXMarksCollection inThisGame: aTerniLapilliGame

	self assert: aTerniLapilliGame visualizeXMarks equals: aXMarksCollection.! !


!classDefinition: #TerniLapilli category: #TerniLapilliExercise!
Object subclass: #TerniLapilli
	instanceVariableNames: 'Xmarks Omarks hasPlayerXWon hasPlayerOWon state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TerniLapilli methodsFor: 'put' stamp: 'na 6/18/2020 09:39:36'!
addMarkFromPlayerOAt: aPosition

	Omarks add: aPosition.
	self updateState
	! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/18/2020 09:39:58'!
addMarkFromPlayerXAt: aPosition

	Xmarks add: aPosition.
	self updateState ! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/18/2020 00:46:09'!
putOat: aPosition

	self checkIfItIsAValidPosition: aPosition.
	^ state putOat: aPosition
	
	

	! !

!TerniLapilli methodsFor: 'put' stamp: 'na 6/18/2020 00:46:01'!
putXat: aPosition

	self checkIfItIsAValidPosition: aPosition.
	^ state putXat: aPosition! !


!TerniLapilli methodsFor: 'move' stamp: 'na 6/18/2020 09:46:44'!
moveMark: aMark FromPlayerOAt: aPosition

	Omarks remove: aMark ifAbsent: [^self error: self class MarkMoveErrorDescription].
	Omarks add: aPosition.
	self updateState 
	
	
! !

!TerniLapilli methodsFor: 'move' stamp: 'na 6/18/2020 09:47:09'!
moveMark: aMark FromPlayerXAt: aPosition

	Xmarks remove: aMark ifAbsent: [^self error: self class MarkMoveErrorDescription].
	Xmarks add: aPosition.
	self updateState 
	
	
	! !

!TerniLapilli methodsFor: 'move' stamp: 'na 6/18/2020 09:40:17'!
moveOMarkAt: aMark to: aPosition

	self checkIfItIsAValidPosition: aPosition.
	self checkIfThisPosition: aPosition isAdyacentToThisMark: aMark.
	state moveOMarkAt: aMark to: aPosition.

! !

!TerniLapilli methodsFor: 'move' stamp: 'na 6/18/2020 09:40:10'!
moveXMarkAt: aMark to: aPosition

	self checkIfItIsAValidPosition: aPosition.
	self checkIfThisPosition: aPosition isAdyacentToThisMark: aMark.
	state moveXMarkAt: aMark to: aPosition.! !


!TerniLapilli methodsFor: 'accesing' stamp: 'na 6/18/2020 09:58:32'!
hasNotFinishedYet
	
	^ state hasNotFinishedYet ! !

!TerniLapilli methodsFor: 'accesing' stamp: 'rjs 6/13/2020 19:51:50'!
visualizeOMarks
	
	^ Omarks copy
	! !

!TerniLapilli methodsFor: 'accesing' stamp: 'rjs 6/13/2020 19:44:22'!
visualizeXMarks
	
	^ Xmarks copy
	! !

!TerniLapilli methodsFor: 'accesing' stamp: 'na 6/18/2020 00:26:31'!
whoIsPlaying
	^ state whoIsPlaying! !


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

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 09:28:03'!
checkWinByAColumn: aCollection 
	 
	^(aCollection select:[:each | each x = (aCollection at:1) x]) size = 3! !

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 09:32:11'!
checkWinByADiagonal: aCollection
	 
	^(aCollection includesAllOf: {1 @ 1. 2 @ 2. 3 @ 3}) or:[(aCollection includesAllOf: {3 @ 1. 2 @ 2. 1 @ 3})].! !

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 09:26:42'!
checkWinByARow: aCollection 
	 
	^(aCollection select:[:each | each y = (aCollection at:1) y]) size = 3! !

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 09:34:36'!
hasPlayerOWon

	^self hasTheseMarksWon: Omarks.! !

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 09:34:36'!
hasPlayerXWon

	^self hasTheseMarksWon: Xmarks. ! !

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/18/2020 09:34:36'!
hasTheseMarksWon: aCollection 
	
	
	^(self checkWinByARow: aCollection) 
	or: [(self checkWinByAColumn: aCollection) 
	or: [self checkWinByADiagonal: aCollection]].
! !

!TerniLapilli methodsFor: 'asserts' stamp: 'na 6/15/2020 18:39:54'!
neighbors: aPosition

	aPosition = (1 @ 3) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (3 @ 3) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (1 @ 1) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (3 @ 1) ifTrue: [^aPosition eightNeighbors.].
	aPosition = (2 @ 2) ifTrue: [^aPosition eightNeighbors.].
			
	^aPosition fourNeighbors.! !


!TerniLapilli methodsFor: 'inicialization' stamp: 'na 6/18/2020 11:24:28'!
initialize

	Xmarks := OrderedCollection new.
	Omarks := OrderedCollection new.
	state := PuttingX new initializeWith: self.! !


!TerniLapilli methodsFor: 'state - private' stamp: 'na 6/18/2020 00:21:27'!
isMovingO

	^self whoIsPlaying = 'X' and: [Omarks size = 3].! !

!TerniLapilli methodsFor: 'state - private' stamp: 'na 6/18/2020 00:21:33'!
isMovingX

	^self whoIsPlaying = 'O' and: [Omarks size = 3].! !

!TerniLapilli methodsFor: 'state - private' stamp: 'na 6/18/2020 00:10:25'!
isPuttingO

	^ Omarks size < Xmarks size! !

!TerniLapilli methodsFor: 'state - private' stamp: 'na 6/18/2020 00:09:08'!
isPuttingX

	^(Xmarks size < 3)  and: [Xmarks size = Omarks size].! !

!TerniLapilli methodsFor: 'state - private' stamp: 'na 6/18/2020 09:39:49'!
updateState

	state := TerniLapilliState for: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilliExercise!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'initialization' stamp: 'rjs 6/11/2020 20:19:00'!
new
	^ self basicNew initialize.! !


!TerniLapilli class methodsFor: 'errors' stamp: 'na 6/18/2020 09:50:40'!
InvalidMarkPlaceErrorDescription

	^ 'ya hay ficha ahi'! !

!TerniLapilli class methodsFor: 'errors' stamp: 'rjs 6/12/2020 17:45:53'!
InvalidMarkPositionErrorDescription

	^ ' Posicion de Marca invalida, Probá del 1 al 3 '! !

!TerniLapilli class methodsFor: 'errors' stamp: 'rjs 6/13/2020 19:01:12'!
MarkMoveErrorDescription

	^ ' Solo podes elegir tus fichas para moverlas '! !

!TerniLapilli class methodsFor: 'errors' stamp: 'na 6/18/2020 09:53:11'!
canNotPutMoreMarksErrorDescription

	^ ' No podes poner más fichas, move las que tenés '! !

!TerniLapilli class methodsFor: 'errors' stamp: 'na 6/15/2020 20:23:02'!
gameOverErrorDescription
	
	^ 'se termino el juego.'! !

!TerniLapilli class methodsFor: 'errors' stamp: 'rjs 6/13/2020 18:35:34'!
invalidDistanceOfMarksErrorDescription

	^ ' No podes mover una ficha mas de un casillero de distancia '! !

!TerniLapilli class methodsFor: 'errors' stamp: 'na 6/18/2020 09:52:24'!
invalidLessNumberOfMarksInPlayErrorDescription

	^ '  No pusiste las 3 fichas todavia '! !

!TerniLapilli class methodsFor: 'errors' stamp: 'na 6/18/2020 09:54:48'!
isNotYourTurnErrorDescription

	^ 'Le toca al otro jugador'! !


!classDefinition: #TerniLapilliState category: #TerniLapilliExercise!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!TerniLapilliState methodsFor: 'initialization' stamp: 'na 6/18/2020 10:03:16'!
initializeWith: aTerniLapilli.
	 
	game := aTerniLapilli.! !


!TerniLapilliState methodsFor: 'put' stamp: 'na 6/18/2020 10:09:37'!
putOat: aPosition
	
	^self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'put' stamp: 'na 6/18/2020 10:09:40'!
putXat: aPosition
	
	^self subclassResponsibility.! !


!TerniLapilliState methodsFor: 'move' stamp: 'na 6/18/2020 10:09:16'!
moveOMarkAt: aMark to: aPosition
	
	^self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'move' stamp: 'na 6/18/2020 10:09:18'!
moveXMarkAt: aMark to: aPosition
	
	^self subclassResponsibility.! !


!TerniLapilliState methodsFor: 'assert' stamp: 'na 6/18/2020 10:07:23'!
hasNotFinishedYet

	^self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'assert' stamp: 'na 6/17/2020 20:26:48'!
whoIsPlaying
	
	^ self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilliExercise!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'initialization' stamp: 'na 6/18/2020 11:24:38'!
for: aTerniLapilli

	^(self allSubclasses detect: [:aState | aState isFor: aTerniLapilli]) new initializeWith: aTerniLapilli. ! !

!TerniLapilliState class methodsFor: 'initialization' stamp: 'na 6/17/2020 20:26:36'!
isFor: aTernilaPilli

	^self subclassResponsibility! !


!classDefinition: #GameOverState category: #TerniLapilliExercise!
TerniLapilliState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!GameOverState methodsFor: 'assert' stamp: 'na 6/18/2020 09:58:32'!
hasNotFinishedYet

	^false.! !

!GameOverState methodsFor: 'assert' stamp: 'na 6/17/2020 20:21:07'!
whoIsPlaying

	^game error: game class gameOverErrorDescription ! !


!GameOverState methodsFor: 'move' stamp: 'na 6/17/2020 20:21:07'!
moveOMarkAt: aMark to: aPosition
	
	^ game error: game class gameOverErrorDescription.! !

!GameOverState methodsFor: 'move' stamp: 'na 6/17/2020 20:21:07'!
moveXMarkAt: aMark to: aPosition
	
	^ game error: game class gameOverErrorDescription.! !


!GameOverState methodsFor: 'put' stamp: 'na 6/17/2020 20:21:07'!
putOat: aPosition

	^ game error: game class gameOverErrorDescription.! !

!GameOverState methodsFor: 'put' stamp: 'na 6/17/2020 20:21:07'!
putXat: aPosition
	
	^ game error: game class gameOverErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOverState class' category: #TerniLapilliExercise!
GameOverState class
	instanceVariableNames: ''!

!GameOverState class methodsFor: 'state' stamp: 'na 6/17/2020 20:30:01'!
isFor: aTerniliLapilli

	^aTerniliLapilli hasPlayerXWon or: [aTerniliLapilli hasPlayerOWon].! !


!classDefinition: #PlayingO category: #TerniLapilliExercise!
TerniLapilliState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PlayingO methodsFor: 'assert' stamp: 'na 6/18/2020 09:58:32'!
hasNotFinishedYet 

	^true! !

!PlayingO methodsFor: 'assert' stamp: 'na 6/15/2020 12:35:16'!
whoIsPlaying
	
	^ 'O'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingO class' category: #TerniLapilliExercise!
PlayingO class
	instanceVariableNames: ''!

!PlayingO class methodsFor: 'state' stamp: 'na 6/17/2020 20:30:27'!
isFor: aTerniLapilli

	^false! !


!classDefinition: #MovingO category: #TerniLapilliExercise!
PlayingO subclass: #MovingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!MovingO methodsFor: 'move' stamp: 'na 6/17/2020 20:21:07'!
moveOMarkAt: aMark to: aPosition
	
	game moveMark: aMark FromPlayerOAt: aPosition! !

!MovingO methodsFor: 'move' stamp: 'na 6/18/2020 09:54:31'!
moveXMarkAt: aMark to: aPosition
	
	^ game error: game class isNotYourTurnErrorDescription.! !


!MovingO methodsFor: 'put' stamp: 'na 6/18/2020 09:53:11'!
putOat: aPosition

	^game error: game class canNotPutMoreMarksErrorDescription! !

!MovingO methodsFor: 'put' stamp: 'na 6/18/2020 09:54:31'!
putXat: aPosition
	
	^game error: game class isNotYourTurnErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MovingO class' category: #TerniLapilliExercise!
MovingO class
	instanceVariableNames: ''!

!MovingO class methodsFor: 'state' stamp: 'na 6/18/2020 00:19:23'!
isFor: aTerniLapilli

	^aTerniLapilli isMovingO and: [aTerniLapilli hasPlayerOWon not]! !


!classDefinition: #PuttingO category: #TerniLapilliExercise!
PlayingO subclass: #PuttingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PuttingO methodsFor: 'move' stamp: 'na 6/18/2020 09:52:24'!
moveOMarkAt: aMark to: aPosition
	
	^ game error: game class invalidLessNumberOfMarksInPlayErrorDescription! !

!PuttingO methodsFor: 'move' stamp: 'na 6/18/2020 09:54:31'!
moveXMarkAt: aMark to: aPosition
	 
	^ game error: game class isNotYourTurnErrorDescription.! !


!PuttingO methodsFor: 'put' stamp: 'na 6/17/2020 20:21:07'!
putOat: aPosition
	
	game addMarkFromPlayerOAt: aPosition! !

!PuttingO methodsFor: 'put' stamp: 'na 6/18/2020 09:54:31'!
putXat: aPosition
	 
	^ game error: game class isNotYourTurnErrorDescription .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuttingO class' category: #TerniLapilliExercise!
PuttingO class
	instanceVariableNames: ''!

!PuttingO class methodsFor: 'state' stamp: 'na 6/18/2020 00:09:47'!
isFor: aTerniLapilli

	^aTerniLapilli isPuttingO and: [aTerniLapilli hasPlayerOWon not]! !


!classDefinition: #PlayingX category: #TerniLapilliExercise!
TerniLapilliState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PlayingX methodsFor: 'assert' stamp: 'na 6/18/2020 09:58:32'!
hasNotFinishedYet 

	^true! !

!PlayingX methodsFor: 'assert' stamp: 'na 6/15/2020 12:35:22'!
whoIsPlaying
	
	^ 'X'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingX class' category: #TerniLapilliExercise!
PlayingX class
	instanceVariableNames: ''!

!PlayingX class methodsFor: 'state' stamp: 'na 6/17/2020 20:30:43'!
isFor: aTerniLapilli

	^false! !


!classDefinition: #MovingX category: #TerniLapilliExercise!
PlayingX subclass: #MovingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!MovingX methodsFor: 'put' stamp: 'na 6/18/2020 09:54:31'!
putOat: aPosition
	 
	^ game error: game class isNotYourTurnErrorDescription .! !

!MovingX methodsFor: 'put' stamp: 'na 6/18/2020 09:53:11'!
putXat: aPosition
	
	^ game error: game class canNotPutMoreMarksErrorDescription! !


!MovingX methodsFor: 'move' stamp: 'na 6/18/2020 09:54:31'!
moveOMarkAt: aMark to: aPosition
	
	^ game error: game class isNotYourTurnErrorDescription .! !

!MovingX methodsFor: 'move' stamp: 'na 6/17/2020 20:21:07'!
moveXMarkAt: aMark to: aPosition
	
	game moveMark: aMark FromPlayerXAt: aPosition! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MovingX class' category: #TerniLapilliExercise!
MovingX class
	instanceVariableNames: ''!

!MovingX class methodsFor: 'state' stamp: 'na 6/18/2020 00:21:58'!
isFor: aTerniLapilli

	^aTerniLapilli isMovingX and: [aTerniLapilli hasPlayerXWon not]! !


!classDefinition: #PuttingX category: #TerniLapilliExercise!
PlayingX subclass: #PuttingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliExercise'!

!PuttingX methodsFor: 'put' stamp: 'na 6/18/2020 09:54:31'!
putOat: aPosition
	 
	^ game error: game class isNotYourTurnErrorDescription .! !

!PuttingX methodsFor: 'put' stamp: 'na 6/17/2020 20:21:07'!
putXat: aPosition
	
	game addMarkFromPlayerXAt: aPosition! !


!PuttingX methodsFor: 'move' stamp: 'na 6/18/2020 09:54:31'!
moveOMarkAt: aMark to: aPosition
	
	^ game error: game class isNotYourTurnErrorDescription .! !

!PuttingX methodsFor: 'move' stamp: 'na 6/18/2020 09:52:24'!
moveXMarkAt: aMark to: aPosition
	
	^ game error: game class invalidLessNumberOfMarksInPlayErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuttingX class' category: #TerniLapilliExercise!
PuttingX class
	instanceVariableNames: ''!

!PuttingX class methodsFor: 'state' stamp: 'na 6/18/2020 00:08:13'!
isFor: aTerniLapilli

	^aTerniLapilli isPuttingX and: [aTerniLapilli hasPlayerXWon not]! !
