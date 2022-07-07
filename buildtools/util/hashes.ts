import _sha1 from "sha1";
import _md5 from "md5";

import { HashDef } from "../types/hashDef";

/**
 * Returns the hash sum of bytes of given bytes using SHA1.
 *
 * This is what CurseForge and Forge are using to check files.
 */
export const sha1 = (inputBuffer: Buffer): string => {
	return _sha1(inputBuffer);
};

/**
 * Returns the hash sum of bytes of given bytes using MD5.
 *
 * This is what CF is using to check files.
 */
export const md5 = (inputBuffer: Buffer): string => {
	return _md5(inputBuffer);
};

const hashFuncs: { [key: string]: (buffer: Buffer) => string } = {
	sha1,
	md5,
};

/**
 * Compare buffer to the given HashDef.
 *
 * @param {Buffer} buffer
 * @param {HashDef} hashDef
 *
 * @throws {Error} Throws a generic error if hashes don't match.
 */
export const compareBufferToHashDef = (buffer: Buffer, hashDef: HashDef): boolean => {
	if (!hashFuncs[hashDef.id]) {
		throw new Error(`No hash function found for ${hashDef.id}.`);
	}

	const sum = hashFuncs[hashDef.id](buffer);
	return (Array.isArray(hashDef.hashes) && hashDef.hashes.includes(sum)) || hashDef.hashes == sum;
};
