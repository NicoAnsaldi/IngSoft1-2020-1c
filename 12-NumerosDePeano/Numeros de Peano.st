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

!I class methodsFor: 'base' stamp: 'nn 4/29/2020 10:23:49'!
next

	^self successor ! !

!I class methodsFor: 'base' stamp: 'AM 4/27/2020 21:20:19'!
successor

	^self createChildNamed: self name , 'I'.! !


!I class methodsFor: 'operation' stamp: 'rjs 4/28/2020 16:03:20'!
* aNumber
	^ aNumber! !

!I class methodsFor: 'operation' stamp: 'AM 4/27/2020 21:38:28'!
+ aNumber 
	
	^aNumber successor! !

!I class methodsFor: 'operation' stamp: 'nn 4/29/2020 11:32:23'!
- aNumber
	^self descripcionDeErrorDeNumerosNegativosNoSoportados.
		
		! !

!I class methodsFor: 'operation' stamp: 'nn 4/29/2020 11:32:39'!
/ aNumber
	
	aNumber = I
	ifTrue: [^ I ]
	ifFalse: [ ^self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ]! !


!I class methodsFor: 'error' stamp: 'nn 4/29/2020 12:28:05'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.
	^ Error signal: 'Error de división'.! !

!I class methodsFor: 'error' stamp: 'nn 4/29/2020 12:25:02'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	 ^ Error signal: 'Resta inválida'.! !


!I class methodsFor: 'comparation' stamp: 'rjs 4/28/2020 17:29:54'!
>= aNumber

 ^ (self asString) size >= (aNumber asString) size


	! !


!I class methodsFor: 'auxiliar' stamp: 'rjs 4/28/2020 16:07:49'!
multiplicar: aNumber
	^ self * aNumber! !

!I class methodsFor: 'auxiliar' stamp: 'nn 4/29/2020 10:47:28'!
resta: aNumber

	^aNumber previous.
	
	! !


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


!II class methodsFor: 'operation' stamp: 'rjs 4/28/2020 16:06:32'!
* aNumber
	^ aNumber multiplicar: self! !

!II class methodsFor: 'operation' stamp: 'rjs 4/28/2020 16:11:48'!
+ aNumber 

	^ self previous + aNumber successor! !

!II class methodsFor: 'operation' stamp: 'nn 4/29/2020 12:17:43'!
- aNumber 
	
	^aNumber resta: self! !

!II class methodsFor: 'operation' stamp: 'rjs 4/28/2020 17:56:41'!
/ aNumber

	aNumber = I
	ifTrue: [^ self].
	
	self >= aNumber
	ifTrue: [ ^ self division: aNumber  ]
	ifFalse: [^ self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ]
	! !


!II class methodsFor: 'auxiliar' stamp: 'rjs 4/28/2020 17:50:49'!
division: aNumber
	
	| x y |
	y:=self - aNumber + I.
	x:=I.
	
	[y >= aNumber]
	whileTrue: [ x:= x + I . y := y - aNumber ].
	^ x
	
	
	
	
! !

!II class methodsFor: 'auxiliar' stamp: 'rjs 4/28/2020 16:09:51'!
multiplicar: aNumber
	^ self + ( aNumber previous * self )! !

!II class methodsFor: 'auxiliar' stamp: 'nn 4/29/2020 11:00:56'!
resta: aNumber

	^aNumber previous - self previous.! !


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


!classDefinition: #IIIIII category: #'Numeros de Peano'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!
