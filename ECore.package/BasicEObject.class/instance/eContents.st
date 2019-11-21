accessing
eContents
	| result |
	result := self eProperties eContents.
	result ifNil: [ 
		result := EContentsEList createEContentsEList: self.
		self eBasicProperties eContents: result.
		].
	^result