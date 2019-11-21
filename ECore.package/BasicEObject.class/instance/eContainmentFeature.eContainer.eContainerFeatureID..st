as yet unclassified
eContainmentFeature: anEObject eContainer: anEContainer eContainerFeatureID: anEContainerFeatureID
	| eFeature featureMap base |
	anEContainer ifNil: [ ^nil ].
	base := BasicEObject EOPPOSITE_FEATURE_BASE.
	anEContainerFeatureID <= base ifTrue: [ 
		eFeature := anEContainer eClass eStructuralFeature: base - anEContainerFeatureID.
		(eFeature isKindOf: EReference) ifTrue: [ ^eFeature ]
		 
	ifFalse: [ 
		featureMap := anEContainer eGet: eFeature.
		featureMap do: [ :f |
			f == anEObject ifTrue: [ 
				(f isKindOf: EReference) ifTrue: [ 
					f isContainment ifTrue: [ ^f ]
					 ]
				 ]
			 ]
		 ]
	]
	ifFalse: [ ^ anEObject eClass eStructuralFeature:  anEContainerFeatureID eOpposite ]