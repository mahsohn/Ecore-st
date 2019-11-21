as yet unclassified
getAttribute: namespace name: name
	| ePackage documentRoot |
	ePackage := self getPackage: namespace.
	ePackage ifNotNil: [ 
		documentRoot := self getDocumentRoot: ePackage.
		documentRoot ifNotNil: [ ^ self getLocalAttribute: documentRoot namespace: namespace name: name ]
	].
	^nil