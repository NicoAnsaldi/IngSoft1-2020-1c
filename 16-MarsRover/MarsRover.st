!classDefinition: #TestRover category: #MarsRover!
TestCase subclass: #TestRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test01EmptyCommand
	
	| robot |
	
	robot := MarsRover with: 1@1 and: 'N'.
	
	robot process: ''.
	
	self assert: robot position equals: 1@1.
	self assert: robot direction equals: 'N'.! !

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test02MoveFowardFromNorthOrientation
	
	| robot |
	
	robot := MarsRover with: 1@1 and: 'N'.
	
	robot process: 'f'.
	
	self assert: 1@2 equals: robot position .
	self assert: robot direction equals: 'N'.! !

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test03MoveBackwardsFromNorthOrientation
	
	| robot |
	
	robot := MarsRover with: 1@1 and: 'N'.
	
	robot process: 'b'.
	
	self assert:  1@0 equals: robot position .
	self assert: robot direction equals: 'N'.! !

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test04TurnRightFromNorthOrientation
	
	| robot |
	
	robot := MarsRover with: 1@1 and: 'N'.
	
	robot process: 'r'.
	
	self assert:  1@1 equals: robot position .
	self assert:  'E' equals: robot direction.! !

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test05TurnLeftFromNorthOrientation
	
	| robot |
	
	robot := MarsRover with: 1@1 and: 'N'.
	
	robot process: 'l'.
	
	self assert:  1@1 equals: robot position .
	self assert:  'O' equals: robot direction.! !

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test06WrongCommand
	
	| robot |
	
	robot := MarsRover with: 1@1 and: 'N'.
	
	self
		should: [ robot process: 'x'. ]
		raise: Error
		withMessageText: [	self assert: robot position equals: 1@1.
									self assert: robot direction equals: 'N'.
									MarsRover InvalidComandErrorDescription ]

 ! !

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test07MoveFowardTwiceFromNorthOrientation
	
	| robot |
	
	robot := MarsRover with: 1@1 and: 'N'.
	
	robot process: 'ff'.
	
	self assert:  1@3 equals: robot position .
	self assert:  'N' equals: robot direction.! !

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test08MoveBackwardsTwiceFromNorthOrientation
	
	| robot |
	
	robot := MarsRover with: 1@3 and: 'N'.
	
	robot process: 'bb'.

	self assert:  1@1 equals: robot position .
	self assert:  'N' equals: robot direction.! !

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test09TurningRight
	
	| robot1 robot2 robot3 robot4 |
	
	robot1 := MarsRover with: 1@1 and: 'N'.
	robot2 := MarsRover with: 1@1 and: 'E'.
	robot3 := MarsRover with: 1@1 and: 'S'.
	robot4:= MarsRover with: 1@1 and: 'O'.
	
	robot1 process: 'r'.
	robot2 process: 'r'.
	robot3 process: 'r'.
	robot4 process: 'r'.
	
	self assert:  1@1 equals: robot1 position .
	self assert:  'E' equals: robot1 direction.
	self assert:  1@1 equals: robot2 position .
	self assert:  'S' equals: robot2 direction.
	self assert:  1@1 equals: robot3 position .
	self assert:  'O' equals: robot3 direction.
	self assert:  1@1 equals: robot4 position .
	self assert:  'N' equals: robot4 direction.! !

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test10TurningLeft
	
	| robot1 robot2 robot3 robot4 |
	
	robot1 := MarsRover with: 1@1 and: 'N'.
	robot2 := MarsRover with: 1@1 and: 'O'.
	robot3 := MarsRover with: 1@1 and: 'S'.
	robot4:= MarsRover with: 1@1 and: 'E'.
	
	robot1 process: 'l'.
	robot2 process: 'l'.
	robot3 process: 'l'.
	robot4 process: 'l'.
	
	self assert:  1@1 equals: robot1 position .
	self assert:  'O' equals: robot1 direction.
	self assert:  1@1 equals: robot2 position .
	self assert:  'S' equals: robot2 direction.
	self assert:  1@1 equals: robot3 position .
	self assert:  'E' equals: robot3 direction.
	self assert:  1@1 equals: robot4 position .
	self assert:  'N' equals: robot4 direction.! !

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test11LongSequence
	
	| robot |
	
	robot := MarsRover with: 1@1 and: 'N'.
	
	robot process: 'frblfl'.
	
	self assert:  0@3 equals: robot position .
	self assert:  'O' equals: robot direction.! !

!TestRover methodsFor: 'tests' stamp: 'na 6/7/2020 13:39:40'!
test12LongWrongCommandSequence
	
	| robot |
	
	robot := MarsRover with: 1@1 and: 'N'.
	
		self
		should: [ robot process: 'frblflxrr'. ]
		raise: Error
		withMessageText: [	self assert:  0@3 equals: robot position .
									self assert:  'O' equals: robot direction.
									MarsRover InvalidComandErrorDescription ]
! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'turnRigth - private' stamp: 'rjs 6/7/2020 12:58:34'!
turnRightAMarsRobotWithEastOrientation
	
	 direction := 'S'.! !

!MarsRover methodsFor: 'turnRigth - private' stamp: 'rjs 6/7/2020 12:58:46'!
turnRightAMarsRobotWithNorthOrientation
	
	 direction := 'E'.! !

!MarsRover methodsFor: 'turnRigth - private' stamp: 'rjs 6/7/2020 12:58:58'!
turnRightAMarsRobotWithSouthOrientation
	
	 direction := 'O'.! !

!MarsRover methodsFor: 'turnRigth - private' stamp: 'rjs 6/7/2020 12:59:11'!
turnRightAMarsRobotWithWestOrientation
	
	 direction := 'N'.! !


!MarsRover methodsFor: 'turnLeft - private' stamp: 'rjs 6/7/2020 12:59:38'!
turnLeftAMarsRobotWithEastOrientation
	
	 direction := 'N'.! !

!MarsRover methodsFor: 'turnLeft - private' stamp: 'rjs 6/7/2020 12:59:43'!
turnLeftAMarsRobotWithNorthOrientation
	
	 direction := 'O'.! !

!MarsRover methodsFor: 'turnLeft - private' stamp: 'rjs 6/7/2020 12:59:48'!
turnLeftAMarsRobotWithSouthOrientation
	
	 direction := 'E'.! !

!MarsRover methodsFor: 'turnLeft - private' stamp: 'rjs 6/7/2020 12:59:53'!
turnLeftAMarsRobotWithWestOrientation
	
	 direction := 'S'.! !


!MarsRover methodsFor: 'foward - private' stamp: 'rjs 6/7/2020 12:57:30'!
moveFowardAMarsRobotWithEastOrientation
	
	 position := (( position x +1) @ ( position y)).! !

!MarsRover methodsFor: 'foward - private' stamp: 'rjs 6/7/2020 12:57:34'!
moveFowardAMarsRobotWithNorthOrientation
	
	position := (( position x) @ ( position y +1)).! !

!MarsRover methodsFor: 'foward - private' stamp: 'rjs 6/7/2020 12:57:39'!
moveFowardAMarsRobotWithSouthOrientation
	
	position := ((position x) @ (position y - 1))! !

!MarsRover methodsFor: 'foward - private' stamp: 'rjs 6/7/2020 12:57:44'!
moveFowardAMarsRobotWithWestOrientation
	
	position := ((position x - 1 ) @ (position y)) ! !


!MarsRover methodsFor: 'backwards - private' stamp: 'rjs 6/7/2020 12:57:52'!
moveBackwardsAMarsRobotWithEastOrientation
	
	 position := (( position x -1) @ ( position y)).! !

!MarsRover methodsFor: 'backwards - private' stamp: 'rjs 6/7/2020 12:57:56'!
moveBackwardsAMarsRobotWithNorthOrientation
	
	position := (( position x) @ ( position y -1)).! !

!MarsRover methodsFor: 'backwards - private' stamp: 'rjs 6/7/2020 12:58:01'!
moveBackwardsAMarsRobotWithSouthtOrientation
	
	position := ((position x) @ (position y + 1))! !

!MarsRover methodsFor: 'backwards - private' stamp: 'rjs 6/7/2020 12:58:05'!
moveBackwardsAMarsRobotWithWestOrientation
	
	position := ((position x + 1 ) @ (position y)) ! !


!MarsRover methodsFor: 'initialization' stamp: 'rjs 6/4/2020 21:04:53'!
initialize: aPosition with: aDirection
		
	position := aPosition.
	direction := aDirection.! !


!MarsRover methodsFor: 'comparing' stamp: 'rjs 6/7/2020 13:05:34'!
isBackwards: aCommand
	
	^ (aCommand = $b)
	
	! !

!MarsRover methodsFor: 'comparing' stamp: 'rjs 6/7/2020 13:04:43'!
isFoward: aCommand
	
	^ (aCommand = $f)
	
	! !

!MarsRover methodsFor: 'comparing' stamp: 'rjs 6/7/2020 13:05:40'!
isLeft: aCommand
	
	^ (aCommand = $l)
	
	! !

!MarsRover methodsFor: 'comparing' stamp: 'rjs 6/7/2020 13:05:45'!
isRight: aCommand
	
	^ (aCommand = $r)
	
	! !


!MarsRover methodsFor: 'actions' stamp: 'na 6/7/2020 13:36:39'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [ :aCommand | self processCommand: aCommand ].
	! !

!MarsRover methodsFor: 'actions' stamp: 'na 6/7/2020 13:35:59'!
processCommand: aCommand
	
	(self isFoward: aCommand) ifTrue: [ ^ self orientation moveFoward  ].
	(self isBackwards: aCommand) ifTrue: [ ^ self orientation moveBackwards ].
	(self isRight: aCommand) ifTrue: [ ^ self orientation turnRight ].
	(self isLeft: aCommand) ifTrue: [ ^self orientation turnLeft  ].
	
	^ self error: self class InvalidComandErrorDescription.
	! !


!MarsRover methodsFor: 'accesing' stamp: 'rjs 6/4/2020 21:34:36'!
direction
	^ direction! !

!MarsRover methodsFor: 'accesing' stamp: 'na 6/7/2020 13:39:55'!
orientation
	
	^MarsRoverOrientation orientationFor: self.! !

!MarsRover methodsFor: 'accesing' stamp: 'rjs 6/4/2020 21:10:48'!
position
	
	^ position! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'rjs 6/7/2020 13:01:46'!
with: aPosition and: aDirection
		

	 ^ self basicNew initialize: aPosition with: aDirection.! !


!MarsRover class methodsFor: 'error' stamp: 'rjs 6/7/2020 13:02:53'!
InvalidComandErrorDescription 

	^ ' Me pasate un comando invalido'! !


!classDefinition: #MarsRoverOrientation category: #MarsRover!
Object subclass: #MarsRoverOrientation
	instanceVariableNames: 'marsRobot'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientation methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:11:58'!
moveBackwards
	^ self subclassResponsibility ! !

!MarsRoverOrientation methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:10:53'!
moveFoward
	^ self subclassResponsibility ! !

!MarsRoverOrientation methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:10:41'!
turnLeft
	^ self subclassResponsibility ! !

!MarsRoverOrientation methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:12:22'!
turnRight
	^ self subclassResponsibility ! !


!MarsRoverOrientation methodsFor: 'initialize' stamp: 'rjs 6/7/2020 13:10:07'!
initialize: aMarsRobot

	marsRobot _ aMarsRobot
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientation class' category: #MarsRover!
MarsRoverOrientation class
	instanceVariableNames: ''!

!MarsRoverOrientation class methodsFor: 'initialize' stamp: 'rjs 6/7/2020 10:44:25'!
canHandle: aMarsRobot
	^ self subclassResponsibility ! !

!MarsRoverOrientation class methodsFor: 'initialize' stamp: 'rjs 6/7/2020 13:10:07'!
for: aMarsRobot
 	^ self new initialize: aMarsRobot! !

!MarsRoverOrientation class methodsFor: 'initialize' stamp: 'na 6/7/2020 13:34:54'!
orientationFor: aMarsRobot

	^(self subclasses detect: [:aMarsRobotStateClass | aMarsRobotStateClass canHandle: aMarsRobot ]) for: aMarsRobot! !


!classDefinition: #MarsRoverOrientationEast category: #MarsRover!
MarsRoverOrientation subclass: #MarsRoverOrientationEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientationEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:12:51'!
moveBackwards

	^ marsRobot moveBackwardsAMarsRobotWithEastOrientation .

	
	! !

!MarsRoverOrientationEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:12:59'!
moveFoward

	^ marsRobot moveFowardAMarsRobotWithEastOrientation .

	
	! !

!MarsRoverOrientationEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:07'!
turnLeft

	^ marsRobot turnLeftAMarsRobotWithEastOrientation .

	
	! !

!MarsRoverOrientationEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:13'!
turnRight

	^ marsRobot turnRightAMarsRobotWithEastOrientation .

	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationEast class' category: #MarsRover!
MarsRoverOrientationEast class
	instanceVariableNames: ''!

!MarsRoverOrientationEast class methodsFor: 'status' stamp: 'rjs 6/7/2020 10:45:30'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'E'! !


!classDefinition: #MarsRoverOrientationNorth category: #MarsRover!
MarsRoverOrientation subclass: #MarsRoverOrientationNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientationNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:24'!
moveBackwards
	^ marsRobot moveBackwardsAMarsRobotWithNorthOrientation .! !

!MarsRoverOrientationNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:30'!
moveFoward
	^ marsRobot moveFowardAMarsRobotWithNorthOrientation .! !

!MarsRoverOrientationNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:40'!
turnLeft

	^ marsRobot turnLeftAMarsRobotWithNorthOrientation .
! !

!MarsRoverOrientationNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:47'!
turnRight

	^ marsRobot turnRightAMarsRobotWithNorthOrientation .
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationNorth class' category: #MarsRover!
MarsRoverOrientationNorth class
	instanceVariableNames: ''!

!MarsRoverOrientationNorth class methodsFor: 'status' stamp: 'rjs 6/7/2020 10:46:03'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'N'! !


!classDefinition: #MarsRoverOrientationSouth category: #MarsRover!
MarsRoverOrientation subclass: #MarsRoverOrientationSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientationSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:58'!
moveBackwards
		^ marsRobot moveBackwardsAMarsRobotWithSouthtOrientation .! !

!MarsRoverOrientationSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:03'!
moveFoward
	^ marsRobot moveFowardAMarsRobotWithSouthOrientation .! !

!MarsRoverOrientationSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:10'!
turnLeft

	^ marsRobot turnLeftAMarsRobotWithSouthOrientation .
! !

!MarsRoverOrientationSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:16'!
turnRight

	^ marsRobot turnRightAMarsRobotWithSouthOrientation .
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationSouth class' category: #MarsRover!
MarsRoverOrientationSouth class
	instanceVariableNames: ''!

!MarsRoverOrientationSouth class methodsFor: 'status' stamp: 'rjs 6/7/2020 10:46:09'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'S'! !


!classDefinition: #MarsRoverOrientationWest category: #MarsRover!
MarsRoverOrientation subclass: #MarsRoverOrientationWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientationWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:23'!
moveBackwards
	^ marsRobot moveBackwardsAMarsRobotWithWestOrientation .! !

!MarsRoverOrientationWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:30'!
moveFoward
	^ marsRobot moveFowardAMarsRobotWithWestOrientation .! !

!MarsRoverOrientationWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:37'!
turnLeft

	^ marsRobot turnLeftAMarsRobotWithWestOrientation .
! !

!MarsRoverOrientationWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:44'!
turnRight

	^ marsRobot turnRightAMarsRobotWithWestOrientation .
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverOrientationWest class' category: #MarsRover!
MarsRoverOrientationWest class
	instanceVariableNames: ''!

!MarsRoverOrientationWest class methodsFor: 'status' stamp: 'rjs 6/7/2020 10:46:16'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'O'! !
