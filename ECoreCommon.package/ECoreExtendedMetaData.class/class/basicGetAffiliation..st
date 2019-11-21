as yet unclassified
basicGetAffiliation: eStructuralFeature
	| eAnnotation qualifiedName eContainingClass ePackage fragmentIndex documentRoot |
	eAnnotation := self getAnnotation: eStructuralFeature demandCreate: false.
	eAnnotation ifNotNil: [
		qualifiedName := eAnnotation getDetails get: 'affiliation'.
		qualifiedName ifNotNil: [
			
			fragmentIndex := qualifiedName lastIndexOf: '#'.
			fragmentIndex == -1 ifTrue: [
				eContainingClass := eStructuralFeature getEContainingClass.
				eContainingClass ifNotNil: [
					ePackage := eContainingClass getEPackage.
					ePackage ifNotNil: [ 
						documentRoot := self getDocumentRoot: ePackage.
						documentRoot ifNotNil: [ 
							^self getLocalElement: documentRoot
							namespace: (self getNamespace: ePackage) 
							name: qualifiedName 
						]
					]
				]
			]
			ifFalse: [ 
				fragmentIndex == 0 ifTrue: [ 
					^ self getElement: nil name: (qualifiedName copyFrom: 2).		
				]
				ifFalse: [ 
					^ self getElement: (qualifiedName copyFrom: 1 to: fragmentIndex) 
							 name: (qualifiedName copyFrom: fragmentIndex + 2).	
				]
			]
		]
	].
	^nil