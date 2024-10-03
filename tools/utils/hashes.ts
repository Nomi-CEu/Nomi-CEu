import { sha1, md5 } from "hash-wasm";
import { HashDef } from "#types/hashDef.ts";

/**
 * Returns the hash sum of bytes of given bytes using SHA1.
 *
 * This is what CurseForge and Forge are using to check files.
 */
const performSha1 = (inputBuffer: Buffer): Promise<string> => {
	return sha1(inputBuffer);
};

/**
 * Returns the hash sum of bytes of given bytes using MD5.
 *
 * This is what CF is using to check files.
 */
const performMd5 = (inputBuffer: Buffer): Promise<string> => {
	return md5(inputBuffer);
};

const hashFuncs: { [key: string]: (buffer: Buffer) => Promise<string> } = {
	sha1: performSha1,
	md5: performMd5,
};

/**
 * Compare buffer to the given HashDef.
 *
 * @param {Buffer} buffer
 * @param {HashDef} hashDef
 *
 * @throws {Error} Throws a generic error if hashes don't match.
 */
export async function compareBufferToHashDef(
	buffer: Buffer,
	hashDef: HashDef,
): Promise<boolean> {
	if (!hashFuncs[hashDef.id]) {
		throw new Error(`No hash function found for ${hashDef.id}.`);
	}

	const sum = await hashFuncs[hashDef.id](buffer);
	return (
		(Array.isArray(hashDef.hashes) && hashDef.hashes.includes(sum)) ||
		hashDef.hashes == sum
	);
}
