/**
 * Bytes to exclude from hashing.
 *
 * Why? I dunno.
 */
const MURMUR_SKIP_BYTES: { [key: number]: boolean } = {
	9: true,
	10: true,
	13: true,
	32: true,
};

import _sha1 from "sha1";

/**
 * JS Implementation of MurmurHash2
 *
 * @author <a href="mailto:gary.court@gmail.com">Gary Court</a>
 * @see http://github.com/garycourt/murmurhash-js
 * @author <a href="mailto:aappleby@gmail.com">Austin Appleby</a>
 * @see http://sites.google.com/site/murmurhash/
 */
function murmurhash2_32_gc(arr, seed, len = arr.length) {
	let l = len,
		h = seed ^ l,
		i = 0,
		k;

	while (l >= 4) {
		k = (arr[i] & 0xff) | ((arr[++i] & 0xff) << 8) | ((arr[++i] & 0xff) << 16) | ((arr[++i] & 0xff) << 24);

		k = (k & 0xffff) * 0x5bd1e995 + ((((k >>> 16) * 0x5bd1e995) & 0xffff) << 16);
		k ^= k >>> 24;
		k = (k & 0xffff) * 0x5bd1e995 + ((((k >>> 16) * 0x5bd1e995) & 0xffff) << 16);

		h = ((h & 0xffff) * 0x5bd1e995 + ((((h >>> 16) * 0x5bd1e995) & 0xffff) << 16)) ^ k;

		l -= 4;
		++i;
	}

	switch (l) {
		case 3:
			h ^= (arr[i + 2] & 0xff) << 16;
		case 2:
			h ^= (arr[i + 1] & 0xff) << 8;
		case 1:
			h ^= arr[i] & 0xff;
			h = (h & 0xffff) * 0x5bd1e995 + ((((h >>> 16) * 0x5bd1e995) & 0xffff) << 16);
	}

	h ^= h >>> 13;
	h = (h & 0xffff) * 0x5bd1e995 + ((((h >>> 16) * 0x5bd1e995) & 0xffff) << 16);
	h ^= h >>> 15;

	return h >>> 0;
}

/**
 * Returns the hash sum of bytes of given bytes using MurmurHash v2.
 *
 * This is what Twitch is using to fingerprint mod files.
 */
export const murmurhash = (inputBuffer: Buffer, seed = 1): string => {
	const output = new Uint8Array(inputBuffer.length);

	let pos = 0;
	for (let i = 0; i < inputBuffer.length; i++) {
		const byte = inputBuffer.readUInt8(i);

		if (!MURMUR_SKIP_BYTES[byte]) {
			output[pos++] = byte;
		}
	}

	return String(murmurhash2_32_gc(output, seed, pos));
};

import { HashDef } from "../types/hashDef";

/**
 * Returns the hash sum of bytes of given bytes using SHA1.
 *
 * This is what Forge is using to check files.
 */
export const sha1 = (inputBuffer: Buffer): string => {
	return _sha1(inputBuffer);
};

const hashFuncs: { [key: string]: (buffer: Buffer) => string } = {
	murmurhash: murmurhash,
	sha1: sha1,
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
