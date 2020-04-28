!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'operaciones' stamp: 'rjs 4/28/2020 16:54:21'!
- aNumber
	^ self descripcionDeErrorDeNumerosNegativosNoSoportados
		
		! !

!I class methodsFor: 'operaciones' stamp: 'rjs 4/27/2020 21:49:45'!
succesor
 ^ self createChildNamed: self name, 'I'! !


!I class methodsFor: 'base' stamp: 'AM 4/27/2020 21:20:19'!
successor

	^self createChildNamed: self name , 'I'.! !


!I class methodsFor: 'operation' stamp: 'AM 4/27/2020 21:38:28'!
+ aNumber 
	
	^aNumber successor! !


!I class methodsFor: 'as yet unclassified' stamp: 'rjs 4/28/2020 16:03:20'!
* aNumber
	^ aNumber! !

!I class methodsFor: 'as yet unclassified' stamp: 'rjs 4/28/2020 17:45:43'!
/ aNumber
	
	aNumber = I
	ifTrue: [^ I ]
	ifFalse: [ ^ 'descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor' ]! !

!I class methodsFor: 'as yet unclassified' stamp: 'rjs 4/28/2020 17:29:54'!
>= aNumber

 ^ (self asString) size >= (aNumber asString) size


	! !

!I class methodsFor: 'as yet unclassified' stamp: 'rjs 4/28/2020 17:53:54'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.
	^ ' Error división '! !

!I class methodsFor: 'as yet unclassified' stamp: 'rjs 4/28/2020 17:54:02'!
descripcionDeErrorDeNumerosNegativosNoSoportados
 ^ 'Error resta'! !

!I class methodsFor: 'as yet unclassified' stamp: 'rjs 4/28/2020 16:07:49'!
multiplicar: aNumber
	^ self * aNumber! !


!classDefinition: #II category: #'Numeros de Peano'!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'base' stamp: 'AM 4/27/2020 21:42:53'!
previous

	^self parent! !


!II class methodsFor: 'operation' stamp: 'rjs 4/28/2020 16:11:48'!
+ aNumber 

	^ self previous + aNumber successor! !

!II class methodsFor: 'operation' stamp: 'rjs 4/28/2020 16:48:16'!
- aNumber 

	aNumber = I
	ifTrue: [^ self previous]
	ifFalse: [^ self previous - aNumber previous]
	! !


!II class methodsFor: 'as yet unclassified' stamp: 'rjs 4/28/2020 16:06:32'!
* aNumber
	^ aNumber multiplicar: self! !

!II class methodsFor: 'as yet unclassified' stamp: 'rjs 4/28/2020 17:56:41'!
/ aNumber

	aNumber = I
	ifTrue: [^ self].
	
	self >= aNumber
	ifTrue: [ ^ self division: aNumber  ]
	ifFalse: [^ self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ]
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'rjs 4/28/2020 17:50:49'!
division: aNumber
	
	| x y |
	y:=self - aNumber + I.
	x:=I.
	
	[y >= aNumber]
	whileTrue: [ x:= x + I . y := y - aNumber ].
	^ x
	
	
	
	
! !

!II class methodsFor: 'as yet unclassified' stamp: 'rjs 4/28/2020 16:09:51'!
multiplicar: aNumber
	^ self + ( aNumber previous * self )! !


!classDefinition: #III category: #'Numeros de Peano'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIII category: #'Numeros de Peano'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIII category: #'Numeros de Peano'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #TestNumerosDePeano category: #'Numeros de Peano'!
DenotativeObject subclass: #TestNumerosDePeano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestNumerosDePeano class' category: #'Numeros de Peano'!
TestNumerosDePeano class
	instanceVariableNames: ''!

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:25:55'!
test01

	Assert that: I successor isEqualTo: II.! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:28:06'!
test02ElSucesorDeUnNumeroNEsNAsterisco

	Assert that: II successor isEqualTo: III.! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'rjs 4/27/2020 21:50:56'!
test02ElSucesorDeUnNumeroNEsUnNumeroN
		Assert that: II succesor isEqualTo: III
	
! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:33:59'!
test03UnoMasUnNumeroEsIgualAlSucesorDelNumero

	Assert that: I + III isEqualTo: III successor! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:35:40'!
test04

	Assert that: II + III isEqualTo: IIII successor! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:52:23'!
test05

	Assert that: II - I isEqualTo: I! !

!TestNumerosDePeano class methodsFor: 'as yet unclassified' stamp: 'AM 4/27/2020 21:55:03'!
test06

	Assert that: IIII - II isEqualTo: II! !


!classDefinition: #tuVieja category: #'Numeros de Peano'!
DenotativeObject subclass: #tuVieja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'tuVieja class' category: #'Numeros de Peano'!
tuVieja class
	instanceVariableNames: ''!

!tuVieja class methodsFor: 'as yet unclassified' stamp: 'rjs 4/28/2020 17:17:20'!
test
	Assert that: IIIII / III isEqualTo: I! !
