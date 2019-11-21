as yet unclassified
getExtendedMetaData: eClassifierOrEStructuralFeature
	| result cache|
	cache := self instance extendedMetaDataHolderCache.
	(eClassifierOrEStructuralFeature isKindOf: EClassifier) ifTrue: [ 
		cache ifNotNil: [ 
			result := cache at: eClassifierOrEStructuralFeature ifAbsent: nil.
			result ifNil: [ 
				result := self createEClassifierExtendedMetaData: eClassifierOrEStructuralFeature.
				cache at: eClassifierOrEStructuralFeature 
				   put: result
			].
			^result
		]
		ifNil: [ 
			result := eClassifierOrEStructuralFeature getExtendedMetaData.
			result ifNil: [ 
				result := self createEClassifierExtendedMetaData: eClassifierOrEStructuralFeature.
				eClassifierOrEStructuralFeature setExtendedMetaData: result 
			].
			^result
		]
	]
	ifFalse:[
		
		(eClassifierOrEStructuralFeature isKindOf: EStructuralFeature) ifTrue: [ 
		cache ifNotNil: [ 
			result := cache at: eClassifierOrEStructuralFeature ifAbsent: nil.
			result ifNil: [ 
				result := self createEStructuralFeatureExtendedMetaData: eClassifierOrEStructuralFeature.
				cache at: eClassifierOrEStructuralFeature 
				   put: result
			].
			^result
		]
		ifNil: [ 
			result := eClassifierOrEStructuralFeature getExtendedMetaData.
			result ifNil: [ 
				result := self createEClassifierExtendedMetaData: eClassifierOrEStructuralFeature.
				eClassifierOrEStructuralFeature setExtendedMetaData: result 
			].
			^result
		]
	]
	ifFalse: [ self error: ' must be an EStructuralFeature or an eClassifier' ]
	]