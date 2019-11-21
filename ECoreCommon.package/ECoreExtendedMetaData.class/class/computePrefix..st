as yet unclassified
computePrefix: namespace
	| index containsLetter prefix length |
	index := namespace size.
	containsLetter := false.
	prefix := ''.
	namespace asArray do: [ :char |
		(XMLTypeUtil isNCNamePart: char) ifTrue: [ 
			prefix := prefix, char asString.
			containsLetter := char isLetter. "fixme: break out of loop here"
		]
	].
	namespace asArray do: [ :char |
		(XMLTypeUtil isNCNamePart: char) ifTrue: [ 
			prefix := prefix, char asString.
			containsLetter ifFalse: [ containsLetter := char isLetter ]. 
		]
		ifFalse: [ containsLetter ifFalse: [ prefix := prefix, '_' ] 
			ifTrue: [ "fixme: break here" ]
			]
	].
	length := prefix size.
	(length isZero | (XMLTypeUtil isNCNamStart: prefix at: length) not) ifTrue: [ prefix := prefix, '_' ].
	^prefix reverse