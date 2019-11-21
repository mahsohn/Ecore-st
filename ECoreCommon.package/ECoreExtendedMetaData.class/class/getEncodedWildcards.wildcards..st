as yet unclassified
getEncodedWildcards: namespace wildcards: wildcards
	| value i size|
	size := wildcards size.
	size isZero ifTrue: [ ^'' ].
	value := ''.
	i := 0.
	wildcards do: [ :wildcard |
		wildcard ifNil: [ 
			namespace ifNil: [ value := value, '##targetNamespace' ]
			ifNotNil: [ value := value, '##local' ]
		]
		ifNotNil: [ 
			(wildcard beginsWithEmpty: '!##' caseSensitive: true) ifTrue: [ 
				(namespace ifNil: [ wildcard size == 3 ] ifNotNil: [ 
					(wildcard endsWith: namespace) & (wildcard size == (namespace length + 3))
				]) ifTrue: [ value := value, wildcard ]
			]
			ifFalse: [ (wildcard equals: namespace) ifTrue: [ value := value, '##targetNamespace' ]
				ifFalse: [ value := value, wildcard ] ]
		].
		i := i + 1.
		i < size ifTrue: [ value := value, ' ' ]
	].
	^value