as yet unclassified
getElementWildcardAffiliation: eClass namespace: namespace name: aName
	| allElements |
	allElements := self getAllElements: eClass.
	allElements do: [ :element |
		(self matchesWithList: self getWildcards: element namespace: namespace) ifTrue: [ 
			^element	
		]
	].
	^nil