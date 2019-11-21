testing
matchesWithList: list namespace: namespace
	list size isZero ifFalse: [ 
		list do: [ :item |
			(self matches: item namespace: namespace) ifTrue: [ ^true ]
		]	
	].
	^false