as yet unclassified
delegatedEPackage: nsURI
	"Returns the factory from the delegate registry if there is one"

	delegateRegistry ifNotNil: [ ^delegateRegistry ePackage: nsURI ].
	^nil