!classDefinition: #TestRobot category: #Rover!
TestCase subclass: #TestRobot
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:20:41'!
test01EmptyCommand
	
	| robot |
	
	robot := MarsRobot with: 1@1 and: 'N'.
	
	robot process: ''.
	
	self assert: robot position equals: 1@1.
	self assert: robot direction equals: 'N'.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:20:57'!
test02MoveFowardFromNorthOrientation
	
	| robot |
	
	robot := MarsRobot with: 1@1 and: 'N'.
	
	robot process: 'f'.
	
	self assert: 1@2 equals: robot position .
	self assert: robot direction equals: 'N'.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:21:06'!
test03MoveBackwardsFromNorthOrientation
	
	| robot |
	
	robot := MarsRobot with: 1@1 and: 'N'.
	
	robot process: 'b'.
	
	self assert:  1@0 equals: robot position .
	self assert: robot direction equals: 'N'.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:21:17'!
test04TurnRightFromNorthOrientation
	
	| robot |
	
	robot := MarsRobot with: 1@1 and: 'N'.
	
	robot process: 'r'.
	
	self assert:  1@1 equals: robot position .
	self assert:  'E' equals: robot direction.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:21:30'!
test05TurnLeftFromNorthOrientation
	
	| robot |
	
	robot := MarsRobot with: 1@1 and: 'N'.
	
	robot process: 'l'.
	
	self assert:  1@1 equals: robot position .
	self assert:  'O' equals: robot direction.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:21:41'!
test06WrongCommand
	
	| robot |
	
	robot := MarsRobot with: 1@1 and: 'N'.
	
	self
		should: [ robot process: 'x'. ]
		raise: Error
		withMessageText: [	self assert: robot position equals: 1@1.
									self assert: robot direction equals: 'N'.
									MarsRobot InvalidComandErrorDescription ]

 ! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:21:58'!
test07MoveFowardTwiceFromNorthOrientation
	
	| robot |
	
	robot := MarsRobot with: 1@1 and: 'N'.
	
	robot process: 'ff'.
	
	self assert:  1@3 equals: robot position .
	self assert:  'N' equals: robot direction.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:22:24'!
test08MoveBackwardsTwiceFromNorthOrientation
	
	| robot |
	
	robot := MarsRobot with: 1@3 and: 'N'.
	
	robot process: 'bb'.

	self assert:  1@1 equals: robot position .
	self assert:  'N' equals: robot direction.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:23:09'!
test09TurningRight
	
	| robot1 robot2 robot3 robot4 |
	
	robot1 := MarsRobot with: 1@1 and: 'N'.
	robot2 := MarsRobot with: 1@1 and: 'E'.
	robot3 := MarsRobot with: 1@1 and: 'S'.
	robot4:= MarsRobot with: 1@1 and: 'O'.
	
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

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:23:17'!
test10TurningLeft
	
	| robot1 robot2 robot3 robot4 |
	
	robot1 := MarsRobot with: 1@1 and: 'N'.
	robot2 := MarsRobot with: 1@1 and: 'O'.
	robot3 := MarsRobot with: 1@1 and: 'S'.
	robot4:= MarsRobot with: 1@1 and: 'E'.
	
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

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:24:04'!
test11LongSequence
	
	| robot |
	
	robot := MarsRobot with: 1@1 and: 'N'.
	
	robot process: 'frblfl'.
	
	self assert:  0@3 equals: robot position .
	self assert:  'O' equals: robot direction.! !

!TestRobot methodsFor: 'tests' stamp: 'rjs 6/7/2020 13:23:57'!
test12LongWrongCommandSequence
	
	| robot |
	
	robot := MarsRobot with: 1@1 and: 'N'.
	
		self
		should: [ robot process: 'frblflxrr'. ]
		raise: Error
		withMessageText: [	self assert:  0@3 equals: robot position .
									self assert:  'O' equals: robot direction.
									MarsRobot InvalidComandErrorDescription ]
! !


!classDefinition: #MarsRobot category: #Rover!
Object subclass: #MarsRobot
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobot methodsFor: 'turnRigth - private' stamp: 'rjs 6/7/2020 12:58:34'!
turnRightAMarsRobotWithEastOrientation
	
	 direction := 'S'.! !

!MarsRobot methodsFor: 'turnRigth - private' stamp: 'rjs 6/7/2020 12:58:46'!
turnRightAMarsRobotWithNorthOrientation
	
	 direction := 'E'.! !

!MarsRobot methodsFor: 'turnRigth - private' stamp: 'rjs 6/7/2020 12:58:58'!
turnRightAMarsRobotWithSouthOrientation
	
	 direction := 'O'.! !

!MarsRobot methodsFor: 'turnRigth - private' stamp: 'rjs 6/7/2020 12:59:11'!
turnRightAMarsRobotWithWestOrientation
	
	 direction := 'N'.! !


!MarsRobot methodsFor: 'turnLeft - private' stamp: 'rjs 6/7/2020 12:59:38'!
turnLeftAMarsRobotWithEastOrientation
	
	 direction := 'N'.! !

!MarsRobot methodsFor: 'turnLeft - private' stamp: 'rjs 6/7/2020 12:59:43'!
turnLeftAMarsRobotWithNorthOrientation
	
	 direction := 'O'.! !

!MarsRobot methodsFor: 'turnLeft - private' stamp: 'rjs 6/7/2020 12:59:48'!
turnLeftAMarsRobotWithSouthOrientation
	
	 direction := 'E'.! !

!MarsRobot methodsFor: 'turnLeft - private' stamp: 'rjs 6/7/2020 12:59:53'!
turnLeftAMarsRobotWithWestOrientation
	
	 direction := 'S'.! !


!MarsRobot methodsFor: 'foward - private' stamp: 'rjs 6/7/2020 12:57:30'!
moveFowardAMarsRobotWithEastOrientation
	
	 position := (( position x +1) @ ( position y)).! !

!MarsRobot methodsFor: 'foward - private' stamp: 'rjs 6/7/2020 12:57:34'!
moveFowardAMarsRobotWithNorthOrientation
	
	position := (( position x) @ ( position y +1)).! !

!MarsRobot methodsFor: 'foward - private' stamp: 'rjs 6/7/2020 12:57:39'!
moveFowardAMarsRobotWithSouthOrientation
	
	position := ((position x) @ (position y - 1))! !

!MarsRobot methodsFor: 'foward - private' stamp: 'rjs 6/7/2020 12:57:44'!
moveFowardAMarsRobotWithWestOrientation
	
	position := ((position x - 1 ) @ (position y)) ! !


!MarsRobot methodsFor: 'backwards - private' stamp: 'rjs 6/7/2020 12:57:52'!
moveBackwardsAMarsRobotWithEastOrientation
	
	 position := (( position x -1) @ ( position y)).! !

!MarsRobot methodsFor: 'backwards - private' stamp: 'rjs 6/7/2020 12:57:56'!
moveBackwardsAMarsRobotWithNorthOrientation
	
	position := (( position x) @ ( position y -1)).! !

!MarsRobot methodsFor: 'backwards - private' stamp: 'rjs 6/7/2020 12:58:01'!
moveBackwardsAMarsRobotWithSouthtOrientation
	
	position := ((position x) @ (position y + 1))! !

!MarsRobot methodsFor: 'backwards - private' stamp: 'rjs 6/7/2020 12:58:05'!
moveBackwardsAMarsRobotWithWestOrientation
	
	position := ((position x + 1 ) @ (position y)) ! !


!MarsRobot methodsFor: 'initialization' stamp: 'rjs 6/4/2020 21:04:53'!
initialize: aPosition with: aDirection
		
	position := aPosition.
	direction := aDirection.! !


!MarsRobot methodsFor: 'comparing' stamp: 'rjs 6/7/2020 13:05:34'!
isBackwards: aCommand
	
	^ (aCommand = $b)
	
	! !

!MarsRobot methodsFor: 'comparing' stamp: 'rjs 6/7/2020 13:04:43'!
isFoward: aCommand
	
	^ (aCommand = $f)
	
	! !

!MarsRobot methodsFor: 'comparing' stamp: 'rjs 6/7/2020 13:05:40'!
isLeft: aCommand
	
	^ (aCommand = $l)
	
	! !

!MarsRobot methodsFor: 'comparing' stamp: 'rjs 6/7/2020 13:05:45'!
isRight: aCommand
	
	^ (aCommand = $r)
	
	! !


!MarsRobot methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:04:55'!
process: aString

	aString do: [ :each | self processCommand: each ].
	! !

!MarsRobot methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:18:23'!
processCommand: aCommand
	
	(self isFoward: aCommand) ifTrue: [ ^ (MarsRobotOrientation stateFor: self) moveFoward  ].
	(self isBackwards: aCommand) ifTrue: [ ^ (MarsRobotOrientation stateFor: self) moveBackwards ].
	(self isRight: aCommand) ifTrue: [ ^ (MarsRobotOrientation stateFor: self) turnRight ].
	(self isLeft: aCommand) ifTrue: [ ^(MarsRobotOrientation stateFor: self) turnLeft  ].
	
	^ self error: self class InvalidComandErrorDescription.
	! !


!MarsRobot methodsFor: 'accesing' stamp: 'rjs 6/4/2020 21:34:36'!
direction
	^ direction! !

!MarsRobot methodsFor: 'accesing' stamp: 'rjs 6/4/2020 21:10:48'!
position
	
	^ position! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobot class' category: #Rover!
MarsRobot class
	instanceVariableNames: ''!

!MarsRobot class methodsFor: 'initialization' stamp: 'rjs 6/7/2020 13:01:46'!
with: aPosition and: aDirection
		

	 ^ self basicNew initialize: aPosition with: aDirection.! !


!MarsRobot class methodsFor: 'error' stamp: 'rjs 6/7/2020 13:02:53'!
InvalidComandErrorDescription 

	^ ' Me pasate un comando invalido'! !


!classDefinition: #MarsRobotOrientation category: #Rover!
Object subclass: #MarsRobotOrientation
	instanceVariableNames: 'marsRobot'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobotOrientation methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:11:58'!
moveBackwards
	^ self subclassResponsibility ! !

!MarsRobotOrientation methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:10:53'!
moveFoward
	^ self subclassResponsibility ! !

!MarsRobotOrientation methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:10:41'!
turnLeft
	^ self subclassResponsibility ! !

!MarsRobotOrientation methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:12:22'!
turnRight
	^ self subclassResponsibility ! !


!MarsRobotOrientation methodsFor: 'initialize' stamp: 'rjs 6/7/2020 13:10:07'!
initialize: aMarsRobot

	marsRobot _ aMarsRobot
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobotOrientation class' category: #Rover!
MarsRobotOrientation class
	instanceVariableNames: ''!

!MarsRobotOrientation class methodsFor: 'initialize' stamp: 'rjs 6/7/2020 10:44:25'!
canHandle: aMarsRobot
	^ self subclassResponsibility ! !

!MarsRobotOrientation class methodsFor: 'initialize' stamp: 'rjs 6/7/2020 13:10:07'!
for: aMarsRobot
 	^ self new initialize: aMarsRobot! !

!MarsRobotOrientation class methodsFor: 'initialize' stamp: 'rjs 6/7/2020 10:42:37'!
stateFor: aMarsRobot

	^(self subclasses detect: [:aMarsRobotStateClass | aMarsRobotStateClass canHandle: aMarsRobot ]) for: aMarsRobot! !


!classDefinition: #MarsRobotOrientationEast category: #Rover!
MarsRobotOrientation subclass: #MarsRobotOrientationEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobotOrientationEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:12:51'!
moveBackwards

	^ marsRobot moveBackwardsAMarsRobotWithEastOrientation .

	
	! !

!MarsRobotOrientationEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:12:59'!
moveFoward

	^ marsRobot moveFowardAMarsRobotWithEastOrientation .

	
	! !

!MarsRobotOrientationEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:07'!
turnLeft

	^ marsRobot turnLeftAMarsRobotWithEastOrientation .

	
	! !

!MarsRobotOrientationEast methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:13'!
turnRight

	^ marsRobot turnRightAMarsRobotWithEastOrientation .

	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobotOrientationEast class' category: #Rover!
MarsRobotOrientationEast class
	instanceVariableNames: ''!

!MarsRobotOrientationEast class methodsFor: 'status' stamp: 'rjs 6/7/2020 10:45:30'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'E'! !


!classDefinition: #MarsRobotOrientationNorth category: #Rover!
MarsRobotOrientation subclass: #MarsRobotOrientationNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobotOrientationNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:24'!
moveBackwards
	^ marsRobot moveBackwardsAMarsRobotWithNorthOrientation .! !

!MarsRobotOrientationNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:30'!
moveFoward
	^ marsRobot moveFowardAMarsRobotWithNorthOrientation .! !

!MarsRobotOrientationNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:40'!
turnLeft

	^ marsRobot turnLeftAMarsRobotWithNorthOrientation .
! !

!MarsRobotOrientationNorth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:47'!
turnRight

	^ marsRobot turnRightAMarsRobotWithNorthOrientation .
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobotOrientationNorth class' category: #Rover!
MarsRobotOrientationNorth class
	instanceVariableNames: ''!

!MarsRobotOrientationNorth class methodsFor: 'status' stamp: 'rjs 6/7/2020 10:46:03'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'N'! !


!classDefinition: #MarsRobotOrientationSouth category: #Rover!
MarsRobotOrientation subclass: #MarsRobotOrientationSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobotOrientationSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:13:58'!
moveBackwards
		^ marsRobot moveBackwardsAMarsRobotWithSouthtOrientation .! !

!MarsRobotOrientationSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:03'!
moveFoward
	^ marsRobot moveFowardAMarsRobotWithSouthOrientation .! !

!MarsRobotOrientationSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:10'!
turnLeft

	^ marsRobot turnLeftAMarsRobotWithSouthOrientation .
! !

!MarsRobotOrientationSouth methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:16'!
turnRight

	^ marsRobot turnRightAMarsRobotWithSouthOrientation .
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobotOrientationSouth class' category: #Rover!
MarsRobotOrientationSouth class
	instanceVariableNames: ''!

!MarsRobotOrientationSouth class methodsFor: 'status' stamp: 'rjs 6/7/2020 10:46:09'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'S'! !


!classDefinition: #MarsRobotOrientationWest category: #Rover!
MarsRobotOrientation subclass: #MarsRobotOrientationWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Rover'!

!MarsRobotOrientationWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:23'!
moveBackwards
	^ marsRobot moveBackwardsAMarsRobotWithWestOrientation .! !

!MarsRobotOrientationWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:30'!
moveFoward
	^ marsRobot moveFowardAMarsRobotWithWestOrientation .! !

!MarsRobotOrientationWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:37'!
turnLeft

	^ marsRobot turnLeftAMarsRobotWithWestOrientation .
! !

!MarsRobotOrientationWest methodsFor: 'actions' stamp: 'rjs 6/7/2020 13:14:44'!
turnRight

	^ marsRobot turnRightAMarsRobotWithWestOrientation .
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRobotOrientationWest class' category: #Rover!
MarsRobotOrientationWest class
	instanceVariableNames: ''!

!MarsRobotOrientationWest class methodsFor: 'status' stamp: 'rjs 6/7/2020 10:46:16'!
canHandle: aMarsRobot
	^ aMarsRobot direction = 'O'! !
