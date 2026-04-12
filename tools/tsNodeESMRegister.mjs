import { register } from "node:module";
import { pathToFileURL } from "node:url";

// eslint-disable-next-line @typescript-eslint/no-unsafe-call
register("ts-node/esm", pathToFileURL("./"));
