accessing
eCrossReferences
	| result |
	result := self eProperties eCrossReferences.
	result ifNil: [ 
		result := ECrossReferenceEList createECrossReferenceEList: self.
		self eBasicProperties eContents: result.
		].
	^result