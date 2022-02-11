interface ModLoader {
	id: string;
	primary: boolean;
}

interface Minecraft {
	version: string;
	modLoaders?: ModLoader[];
}

export interface ExternalDependency {
	name: string;
	url: string;
	sha: string;
}

export interface ModpackManifestFile {
	projectID: number;
	fileID: number;
	required: boolean;
	sides?: ("client" | "server")[];
}

export interface ModpackManifest {
	minecraft: Minecraft;
	manifestType: string;
	manifestVersion: number;
	name: string;
	version: string;
	author: string;
	projectID: number;
	externalDependencies?: ExternalDependency[];
	files: ModpackManifestFile[];
	overrides: string;
}
