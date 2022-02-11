interface Artifact {
	path: string;
	url: string;
	sha1: string;
	size: number;
}

interface Downloads {
	artifact: Artifact;
}

interface Library {
	name: string;
	downloads: Downloads;
}

export interface ForgeProfile {
	_comment_: string[];
	id: string;
	time: Date;
	releaseTime: Date;
	type: string;
	mainClass: string;
	inheritsFrom: string;
	minecraftArguments: string;
	libraries: Library[];
}
