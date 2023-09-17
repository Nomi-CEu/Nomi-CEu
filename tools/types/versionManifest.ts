interface AssetIndex {
	id: string;
	sha1: string;
	size: number;
	totalSize: number;
	url: string;
}

interface Client {
	sha1: string;
	size: number;
	url: string;
}

interface Server {
	sha1: string;
	size: number;
	url: string;
}

interface Downloads {
	client: Client;
	server: Server;
}

interface Artifact {
	path: string;
	sha1: string;
	size: number;
	url: string;
}

interface NativesLinux {
	path: string;
	sha1: string;
	size: number;
	url: string;
}

interface NativesOsx {
	path: string;
	sha1: string;
	size: number;
	url: string;
}

interface NativesWindows {
	path: string;
	sha1: string;
	size: number;
	url: string;
}

interface Sources {
	path: string;
	sha1: string;
	size: number;
	url: string;
}

interface Javadoc {
	path: string;
	sha1: string;
	size: number;
	url: string;
}

interface Classifiers {
	["natives-linux"]: NativesLinux;
	["natives-osx"]: NativesOsx;
	["natives-windows"]: NativesWindows;
	sources: Sources;
	javadoc: Javadoc;
}

interface Downloads2 {
	artifact: Artifact;
	classifiers: Classifiers;
}

interface Os {
	name: string;
}

interface Rule {
	action: string;
	os: Os;
}

interface Extract {
	exclude: string[];
}

interface Natives {
	linux: string;
	osx: string;
	windows: string;
}

interface Library {
	downloads: Downloads2;
	name: string;
	rules: Rule[];
	extract: Extract;
	natives: Natives;
}

export interface VersionManifest {
	assetIndex: AssetIndex;
	assets: string;
	downloads: Downloads;
	id: string;
	libraries: Library[];
	mainClass: string;
	minecraftArguments: string;
	minimumLauncherVersion: number;
	releaseTime: Date;
	time: Date;
	type: string;
}
