as yet unclassified
basicGetGroup: eStructuralFeature
	| aName eAnnotation qualifiedName eContainingClass kind ePackage fragmentIndex namespace |
	eAnnotation := self getAnnotation: eStructuralFeature demandCreate: false.
	eAnnotation ifNotNil: [
		qualifiedName := eStructuralFeature getEContainingClass.
		qualifiedName ifNotNil: [
			eContainingClass := eStructuralFeature getDetails get: 'group'.
			eContainingClass ifNil: [ ^nil ].
			fragmentIndex := qualifiedName lastIndexOf: '#'.
			namespace := ''.
			aName := ''.
			fragmentIndex == -1 ifTrue: [
				ePackage := eContainingClass getEPackage.
				namespace := (ePackage isNil) ifTrue: [ nil ] ifFalse: [ self getNamespace: ePackage ].
				aName := qualifiedName.
			]
			ifFalse: [ 
				fragmentIndex == 0 ifTrue: [ 
					namespace := nil.
					name := qualifiedName copyFrom: 2.				
				]
				ifFalse: [ 
					namespace := qualifiedName copyFrom: 1 to: fragmentIndex.
					name := qualifiedName copyFrom: fragmentIndex + 2.
				]
			].
			kind := self getFeatureKind: eStructuralFeature.
			((kind == self ATTRIBUTE_FEATURE ) | (kind == self ATTRIBUTE_WILDCARD_FEATURE )) ifTrue: [ 
				^ self getAttribute: eContainingClass namespace: namespace name: aName
			].
			((kind == self UNSPECIFIED_FEATURE  ) | (kind == self ELEMENT_FEATURE  ) |
			(kind == self ELEMENT_WILDCARD_FEATURE ) | (kind == self GROUP_FEATURE )) ifTrue: [ 
				^ self getElement: eContainingClass namespace: namespace name: aName
			]
		]
	].
	^nil