as yet unclassified
delegatedEFactory: nsURI
	"Returns the factory from the delegate registry if there is one"

	delegateRegistry ifNotNil: [ ^delegateRegistry eFactory: nsURI ].
	^nil