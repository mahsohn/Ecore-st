as yet unclassified
basicGetWildcards: eStructuralFeature
	| eAnnotation wildcards result |
	eAnnotation := self getAnnotation: eStructuralFeature  demandCreate: false.
	result := OrderedCollection new.
	eAnnotation ifNotNil: [ 
		wildcards := eAnnotation getDetails get: 'wildcards'.
		wildcards ifNotNil: [ 
			wildcards do: [ :wildcard |
				(wildcard equals: '##other') ifTrue: [ 
					result add: '!##', (self getPackageNamespace: eStructuralFeature)
				]
				ifFalse: [ 
					(wildcard equals: '##local') ifTrue: [ 
						result add: nil
					]
					ifFalse: [ 
						(wildcard equals: '##targetNamespace') ifTrue: [ 
							result add: (self getPackageNamespace: eStructuralFeature)
						]
						ifFalse: [ 
							result add: wildcard
					 	]
					]
				]
			]
		]
	].
	^result