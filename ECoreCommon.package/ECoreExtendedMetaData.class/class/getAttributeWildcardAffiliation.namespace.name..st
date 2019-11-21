as yet unclassified
getAttributeWildcardAffiliation: eClass namespace: namespace name: aName
	| result allAttributes |
	allAttributes := self getAllAttributes: eClass.
	allAttributes do: [ :attribute |
		(self matchesWithList: self getWildcards: attribute namespace: namespace) ifTrue: [ 
			^attribute	
		]
	].
	^nil