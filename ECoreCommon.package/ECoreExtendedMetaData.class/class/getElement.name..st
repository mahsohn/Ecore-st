as yet unclassified
getElement: namespace name: name
	| ePackage documentRoot |
	ePackage := self getPackage: namespace.
	ePackage ifNotNil: [ 
		documentRoot := self getDocumentRoot: ePackage.
		documentRoot ifNotNil: [ ^ self getLocalElement: documentRoot namespace: namespace name: name ]
	].
	^nil