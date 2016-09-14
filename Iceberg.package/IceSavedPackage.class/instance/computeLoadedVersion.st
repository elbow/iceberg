private
computeLoadedVersion
	| workingCopyAncestors |
	workingCopyAncestors := self package workingCopy ancestors.

	^ self versions 
		detect: [ :version | workingCopyAncestors includes: version info  ] 
		ifNone: [ 
			"Check if working copy came from an MCGithubRepository"
			(MCGitHubRepository commitIdFor: self workingCopy)
				ifNotNil: [ :commitId |
					^ self versions 
						detect: [ :version | version isAncestorOfCommitId: commitId ]
						ifNone: [ self error: 'Couldn''t find the loaded version for package ', self name ]]					
		]