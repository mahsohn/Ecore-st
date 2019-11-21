testing
matches: string namespace: namespace
	^(string ifNil: [ namespace isNil ]
	ifNotNil: [ 
		(string beginsWithEmpty: '!##' caseSensitive: true) ifTrue:  [ 
			((namespace isNotNil | 
			string size ~= (namespace size +3)) & 
			(XMLTypePackage eNS_URI) ~= namespace)
		]
		ifFalse: [ 
			(string = '##any') & 
			(XMLTypePackage eNS_URI ~= namespace) | 
			string = namespace 
		]
	])