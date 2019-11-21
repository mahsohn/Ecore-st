as yet unclassified
getQualifiedName: defaultNamespace eClassifier: eClassifier
	| namespace name |
	namespace := self getNamespace: eClassifier.
	name := self getName: eClassifier.
	(namespace == defaultNamespace) ifTrue: [ ^name ] ifFalse: [ ^ ('#', name) ]