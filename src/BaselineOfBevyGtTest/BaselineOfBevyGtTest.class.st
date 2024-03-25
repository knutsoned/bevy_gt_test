Class {
	#name : #BaselineOfBevyGtTest,
	#superclass : #BaselineOf,
	#category : #BaselineOfBevyGtTest
}

{ #category : #loading }
BaselineOfBevyGtTest class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'bevy_gt_test' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfBevyGtTest >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'BevyGtTest'
		]
]
