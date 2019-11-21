as yet unclassified
getEClassifier: ePackage type: type
	| index |
	type ifNil: [ ^ nil ].
	index := type lastIndexOf: '#'.
	((index == -1) 
	ifTrue: [ ePackage ifNil: [ nil ] ifNotNil: [ self getType: ePackage name: type ] ] 	
	ifFalse: [ index == 0 ])
	ifTrue: [ ^self getType: nil name: (type copyFrom: 2) ]
	ifFalse: [ ^self getType: (type copyFrom: 1 to: index) name: (type copyFrom: index +2) ]