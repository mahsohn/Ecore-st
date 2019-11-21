as yet unclassified
demandPackage: namespace
	| ePackage documentRootEClass |
	ePackage := self instance demandRegistry getEPackage: namespace.
	ePackage ifNil: [ 
		ePackage := ECoreFactory createEPackage.
		ePackage nsURI: namespace.
		self setQualified: ePackage isQualified: namespace notNil.
		namespace ifNotNil: [ 
			ePackage nsPrefix: (namespace = self XMLNS_URI ifTrue: [ 
					namespace = self XML_URI ifTrue: [ 'xml' ] iFalse: [ 'xmlns' ]
				] ifFalse: [ self computePrefix: namespace ])
		].
		self instance demandRegistry at: namespace put: ePackage.
		documentRootEClass := ECoreFactory createEClass.
		documentRootEClass getESuperTypes add:XMLTypePackage getXMLTypeDocumentRoot.
		ePackage getEClassifiers add: documentRootEClass.
		self setDocumentRoot: documentRootEClass 
	].
	^ePackage